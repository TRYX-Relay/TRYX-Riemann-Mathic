"""Local dynamic arithmetic successor. Only operands and an operation enter prepare."""
from pathlib import Path
import json
from dataclasses import dataclass,asdict
from hashlib import sha256
from RATIONAL import Q as F
from KERNEL import Ball,apply,guard,ResourceHold
REV='eniad-zeta-disk-v1'
def canon(x):return json.dumps(x,sort_keys=True,separators=(',',':'))
def digest(x):return sha256(canon(x).encode()).hexdigest()
def check(ok,msg):
 if not ok:raise ValueError(msg)
def rational(s):
 check(type(s)is str and len(s)<=1000,'coordinate text budget')
 import re
 for exponent in re.findall(r'[eE]([+-]?[0-9]+)',s):
  if abs(int(exponent))>1200:raise ResourceHold('decimal exponent budget')
 v=F(s);check(max(abs(v.numerator).bit_length(),v.denominator.bit_length())<=4096,'coordinate size budget');return v
@dataclass(frozen=True)
class Value:
 identity:str
 revision:str
 ball:Ball
 parents:tuple=()
 def serial(self):return {'identity':self.identity,'revision':self.revision,'ball':self.ball.serial(),'parents':list(self.parents),'carrier3':[q.encode() for q in (self.ball.re,self.ball.im,self.ball.radius)]}
@dataclass(frozen=True)
class Request:
 identity:str
 operation:str
 left:str
 output:str
 right:str|None=None
 terms:int=32
 revision:str=REV
 def __post_init__(self):
  check(self.revision==REV,'revision')
  check(self.operation in ('add','multiply','divide','log','exp'),'operation')
  check(all(type(x)is str and 0<len(x)<=256 for x in (self.identity,self.left,self.output)),'identity')
  check((self.right is None)==(self.operation in ('log','exp')),'arity')
  check(self.right is None or type(self.right)is str and 0<len(self.right)<=256,'right identity')
  check(type(self.terms)is int and 8<=self.terms<=64,'series budget')
class Runtime:
 def __init__(self):self.values={};self.pending={};self.issued={};self.received=set();self.executions=0
 def admit(self,v):
  check(type(v)is Value and type(v.ball)is Ball,'value')
  check(type(v.identity)is str and 0<len(v.identity)<=256 and v.identity not in self.values,'new identity')
  guard(v.ball)
  self.values[v.identity]=v
 def prepare(self,q):
  check(type(q)is Request,'request')
  check(q.identity not in self.pending and q.identity not in self.issued,'request reused')
  check(q.output not in self.values,'output collision')
  ids=(q.left,) if q.right is None else (q.left,q.right)
  operands=tuple(self.values[i] for i in ids)
  self.pending[q.identity]=(q,operands)
  return {'request':asdict(q),'operands':[digest(v.serial()) for v in operands]}
 def execute(self,identity):
  check(identity in self.pending,'unprepared')
  q,vs=self.pending[identity]
  check(all(self.values[v.identity]==v for v in vs),'stale operand')
  check(q.output not in self.values,'output collision')
  b=vs[1].ball if len(vs)==2 else None
  value=apply(q.operation,vs[0].ball,b,q.terms)
  result=Value(q.output,REV,value,tuple(v.identity for v in vs))
  self.executions+=1
  body={'request':asdict(q),'operands':[v.serial() for v in vs],'result':result.serial(),'sequence':self.executions}
  receipt={'body':body,'digest':digest(body)}
  self.issued[identity]=canon(receipt);del self.pending[identity]
  return json.loads(canon(receipt))
 def receive(self,r,expected,operands):
  check(type(expected)is Request and type(operands)is tuple,'independent expected request and operands')
  check(expected.identity not in self.received,'replay')
  check(set(r)=={'body','digest'} and digest(r['body'])==r['digest'],'receipt checksum')
  check(self.issued.get(expected.identity)==canon(r),'unissued or altered receipt')
  body=r['body'];check(body['request']==asdict(expected),'request mismatch')
  ids=(expected.left,) if expected.right is None else (expected.left,expected.right)
  check(tuple(v.identity for v in operands)==ids,'operand identities')
  check(body['operands']==[v.serial() for v in operands],'snapshot mismatch')
  check(all(self.values.get(v.identity)==v for v in operands),'stale receiver')
  # Replay the documented kernel; independent analytic oracle is test-only.
  b=operands[1].ball if len(operands)==2 else None
  result=Value(expected.output,REV,apply(expected.operation,operands[0].ball,b,expected.terms),ids)
  check(body['result']==result.serial(),'calculation or bound mismatch')
  check(result.identity not in self.values,'output collision')
  self.values[result.identity]=result;self.received.add(expected.identity);return result
def run(doc):
 check(set(doc)=={'operands','requests'},'document fields')
 check(len(doc['operands'])<=100 and len(doc['requests'])<=2000,'program budget')
 rt=Runtime()
 for x in doc['operands']:
  check(set(x) in ({'identity','real','imag'},{'identity','real','imag','radius'}),'input fields')
  rt.admit(Value(x['identity'],'input-disk-v1',Ball(rational(x['real']),rational(x['imag']),rational(x.get('radius','0')))))
 receipts=[]
 for x in doc['requests']:
  check(set(x)<=set(Request.__dataclass_fields__),'precomputed result field prohibited')
  q=Request(**x);ids=(q.left,) if q.right is None else (q.left,q.right);vs=tuple(rt.values[i] for i in ids)
  rt.prepare(q);receipt=rt.execute(q.identity);rt.receive(receipt,q,vs);receipts.append(receipt)
 return {'status':'PASS','revision':REV,'executions':rt.executions,'values':[v.serial() for v in rt.values.values()],'receipts':receipts}
if __name__=='__main__':
 import sys
 try:print(json.dumps(run(json.load(sys.stdin)),indent=2))
 except ResourceHold as e:print(json.dumps({'status':'ResourceHold','message':str(e)}));sys.exit(2)
 except (ValueError,TypeError,KeyError,ZeroDivisionError) as e:print(json.dumps({'status':'InvalidInput','message':str(e)}));sys.exit(1)
