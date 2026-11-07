"""Compile the zeta formula into input-only runtime requests, never result tables."""
from RUNTIME import *
from KERNEL import compact
from math import factorial
def bernoulli(n):
 a=[F(0)]*(n+1)
 for m in range(n+1):
  a[m]=F(1,m+1)
  for j in range(m,0,-1):a[j-1]=j*(a[j-1]-a[j])
 return a[0]
def compile_program(real,imag,N=32,M=12):
 sigma,t=rational(real),rational(imag)
 check(0<=sigma<=2 and abs(t)<=20,'zeta stage domain: 0<=sigma<=2, |t|<=20')
 check((sigma,t)!=(1,0),'pole at 1')
 check(type(N)is int and 16<=N<=32 and type(M)is int and 4<=M<=12,'compiler budget')
 inputs=[];requests=[];constants={}
 def const(re,im=F(0)):
  key=(str(re),str(im))
  if key not in constants:
   name='c'+str(len(inputs));constants[key]=name;inputs.append({'identity':name,'real':str(re),'imag':str(im)})
  return constants[key]
 def op(kind,left,right=None):
  name='v'+str(len(requests));q={'identity':'op'+str(len(requests)),'operation':kind,'left':left,'output':name}
  if right is not None:q['right']=right
  requests.append(q);return name
 s='address';inputs.append({'identity':s,'real':str(sigma),'imag':str(t)})
 negative_s=op('multiply',const(-1),s);one=const(1)
 total=const(0)
 for n in range(1,N):
  logn=op('log',const(n));exponent=op('multiply',negative_s,logn)
  term=op('exp',exponent);total=op('add',total,term)
 logN=op('log',const(N))
 def power(exponent):return op('exp',op('multiply',exponent,logN))
 one_minus_s=op('add',one,negative_s)
 s_minus_one=op('add',s,const(-1))
 integral=op('divide',power(one_minus_s),s_minus_one)
 total=op('add',total,integral)
 total=op('add',total,op('multiply',const(F(1,2)),power(negative_s)))
 rising=one;j=0
 for k in range(1,M+1):
  while j<2*k-1:
   rising=op('multiply',rising,op('add',s,const(j)));j+=1
  exponent=op('add',negative_s,const(1-2*k))
  correction=op('multiply',const(bernoulli(2*k)/factorial(2*k)),op('multiply',rising,power(exponent)))
  total=op('add',total,correction)
 return {'operands':inputs,'requests':requests},total,(sigma,t,N,M)
def calculate(real,imag,N=32,M=12,radius="0"):
 rho=rational(radius);sigma,t=rational(real),rational(imag)
 check(rho>=0,'negative radius')
 a=sigma-rho
 check(a>=0 and sigma+rho<=2 and abs(t)+rho<=20,'whole disk outside admitted domain')
 check((sigma-1)**2+t*t>rho*rho,'input disk intersects pole')
 if max(abs(sigma-1),abs(t))<=rho:raise ResourceHold('conservative reciprocal separation insufficient')
 doc,output,params=compile_program(real,imag,N,M)
 next(x for x in doc['operands'] if x['identity']=='address')['radius']=str(rho)
 result=run(doc);item=next(v for v in result['values'] if v['identity']==output)
 b=Ball(*map(F,item['ball']));sigma,t,N,M=params
 # Conservative bound: pi>3, |(s)_2M|<=product(|sigma+j|+|t|),
 # N^-sigma<=1 for the stated nonnegative-real-part domain.
 product=F(1)
 for j in range(2*M):product*=abs(sigma+j)+abs(t)+rho
 tail=4*product/(F(6)**(2*M)*F(N)**(2*M-1)*(a+2*M-1))
 enclosed=compact(Ball(b.re,b.im,b.radius+tail))
 return {'status':'PASS','address':[str(sigma),str(t)],'input_radius':str(rho),'N':N,'M':M,'result_ball':enclosed.serial(),
 'analytic_tail_bound':str(tail),'arithmetic_error_radius':str(b.radius),'execution_count':result['executions'],
 'output_identity':output,'program':doc,'execution':result,
 'scope':'Explicit arithmetic-domain construction using transported rational laws; bounded classical zeta correspondence; not G3-derived or locked October T9'}
if __name__=='__main__':
 import sys
 try:
  p=json.load(sys.stdin);print(json.dumps(calculate(p['real'],p['imag'],radius=p.get('radius','0')),indent=2))
 except ResourceHold as e:print(json.dumps({'status':'ResourceHold','message':str(e)}));sys.exit(2)
 except (ValueError,TypeError,KeyError,ZeroDivisionError) as e:print(json.dumps({'status':'InvalidInput','message':str(e)}));sys.exit(1)
