# Explicit arithmetic-domain construction. Python integer arithmetic and gcd
# are declared implementation foundations; no claim of G3-only generation.
from math import gcd
import re
def ternary(n):
 if n==0:return '0'
 sign='-' if n<0 else '';n=abs(n);digits=[]
 while n:n,r=divmod(n,3);digits.append(str(r))
 return sign+''.join(reversed(digits))
def integer3(s):
 if type(s)is not str or re.fullmatch(r'-?(0|[12][012]*)',s) is None or s=='-0':raise ValueError('canonical ternary integer required')
 return int(s,3)
class Q:
 __slots__=('numerator','denominator')
 def __init__(self,n=0,d=1):
  if isinstance(n,Q):
   if d!=1:raise ValueError('unexpected denominator')
   self.numerator=n.numerator;self.denominator=n.denominator;return
  if type(n)is str:
   if len(n)>3000:raise ValueError('rational input budget')
   if '/' in n:
    x,y=n.split('/');n,d=int(x),int(y)
   else:
    m=re.fullmatch(r'([+-]?)([0-9]+)(?:\.([0-9]+))?(?:[eE]([+-]?[0-9]+))?',n)
    if not m:raise ValueError('exact rational text required')
    sign,whole,part,exponent=m.groups();part=part or '';exponent=int(exponent or 0)
    if abs(exponent)>1200:raise ValueError('decimal exponent budget')
    n=int(whole+part)*(-1 if sign=='-' else 1);d=10**len(part)
    if exponent>=0:n*=10**exponent
    else:d*=10**(-exponent)
  if type(n)is not int or type(d)is not int:raise TypeError('integer foundation required')
  if d==0:raise ZeroDivisionError('zero denominator')
  if d<0:n,d=-n,-d
  g=gcd(abs(n),d);self.numerator=n//g;self.denominator=d//g
 def __str__(self):return str(self.numerator) if self.denominator==1 else str(self.numerator)+'/'+str(self.denominator)
 def __repr__(self):return 'Q('+str(self)+')'
 def __hash__(self):
  import sys
  m=sys.hash_info.modulus
  h=(abs(self.numerator)*pow(self.denominator,-1,m))%m if self.denominator%m else sys.hash_info.inf
  h=-h if self.numerator<0 else h
  return -2 if h==-1 else h
 def __setattr__(self,k,v):
  if hasattr(self,k):raise AttributeError('immutable rational')
  object.__setattr__(self,k,v)
 def __delattr__(self,k):raise AttributeError('immutable rational')
 def __bool__(self):return self.numerator!=0
 def __neg__(self):return Q(-self.numerator,self.denominator)
 def __abs__(self):return Q(abs(self.numerator),self.denominator)
 def __add__(self,b):
  b=Q(b);return Q(self.numerator*b.denominator+b.numerator*self.denominator,self.denominator*b.denominator)
 __radd__=__add__
 def __sub__(self,b):return self+-Q(b)
 def __rsub__(self,b):return Q(b)+-self
 def __mul__(self,b):
  b=Q(b);return Q(self.numerator*b.numerator,self.denominator*b.denominator)
 __rmul__=__mul__
 def __truediv__(self,b):
  b=Q(b);return Q(self.numerator*b.denominator,self.denominator*b.numerator)
 def __rtruediv__(self,b):return Q(b)/self
 def __pow__(self,k):
  if type(k)is not int:raise TypeError('integer power only')
  if k<0:return Q(self.denominator,self.numerator)**(-k)
  return Q(self.numerator**k,self.denominator**k)
 def __eq__(self,b):
  try:b=Q(b)
  except (ValueError,TypeError):return False
  return self.numerator==b.numerator and self.denominator==b.denominator
 def __lt__(self,b):
  b=Q(b);return self.numerator*b.denominator<b.numerator*self.denominator
 def __le__(self,b):return self==b or self<b
 def __gt__(self,b):return not self<=b
 def __ge__(self,b):return not self<b
 def __floor__(self):return self.numerator//self.denominator
 def __ceil__(self):return -((-self.numerator)//self.denominator)
 def __float__(self):return self.numerator/self.denominator
 def encode(self):return {'numerator3':ternary(self.numerator),'denominator3':ternary(self.denominator)}
 @classmethod
 def decode(cls,p):
  if type(p)is not dict or set(p)!={'numerator3','denominator3'}:raise ValueError('carrier fields')
  q=cls(integer3(p['numerator3']),integer3(p['denominator3']))
  if q.encode()!=p:raise ValueError('noncanonical carrier')
  return q
