"""Exact rational centers with conservative complex-disk error bounds."""
from RATIONAL import Q as F
from dataclasses import dataclass
from math import factorial
class ResourceHold(ValueError):pass
MAX_BITS=8192
def guard(a):
 for q in (a.re,a.im,a.radius):
  if max(abs(q.numerator).bit_length(),q.denominator.bit_length())>MAX_BITS:
   raise ResourceHold('intermediate rational exceeds 8192-bit budget')
 return a
@dataclass(frozen=True)
class Ball:
 re:F
 im:F=F(0)
 radius:F=F(0)
 def __post_init__(self):
  if self.radius<0:raise ValueError('negative radius')
 def serial(self):return [str(self.re),str(self.im),str(self.radius)]
def compact(a):
 if a.radius==0:return a
 scale=2**160
 re=F((a.re*scale).__floor__(),scale);im=F((a.im*scale).__floor__(),scale)
 radius=a.radius+abs(a.re-re)+abs(a.im-im)
 radius=F((radius*scale).__ceil__(),scale)
 return Ball(re,im,radius)
def norm(a):return abs(a.re)+abs(a.im)
def add(a,b):return Ball(a.re+b.re,a.im+b.im,a.radius+b.radius)
def mul(a,b):
 return Ball(a.re*b.re-a.im*b.im,a.re*b.im+a.im*b.re,norm(a)*b.radius+norm(b)*a.radius+a.radius*b.radius)
def div(a,b):
 lower=max(abs(b.re),abs(b.im))-b.radius
 if lower<=0:raise ValueError('denominator enclosure not separated from zero by conservative bound')
 q=b.re*b.re+b.im*b.im
 re=(a.re*b.re+a.im*b.im)/q;im=(a.im*b.re-a.re*b.im)/q
 return Ball(re,im,(a.radius+(abs(re)+abs(im))*b.radius)/lower)
def exp_exact(re,im,terms):
 a=abs(re)+abs(im)
 if a>256:raise ResourceHold(' exponential magnitude budget')
 scale=0
 while a>F(1,2):a/=2;scale+=1
 z=Ball(re/2**scale,im/2**scale);term=Ball(F(1));total=term
 for k in range(1,terms+1):
  term=mul(term,z);term=Ball(term.re/k,term.im/k);total=add(total,term)
 error=2*a**(terms+1)/factorial(terms+1)
 result=compact(Ball(total.re,total.im,error))
 for _ in range(scale):result=compact(mul(result,result))
 return result
def exp(a,terms):
 if norm(a)+a.radius>256:raise ResourceHold(' exponential magnitude budget')
 out=exp_exact(a.re,a.im,terms)
 if a.radius:
  upper=exp_exact(a.re+a.radius,F(0),terms)
  out=Ball(out.re,out.im,out.radius+(norm(upper)+upper.radius)*a.radius)
 return out
def atanh_log(y,terms):
 total=2*sum((y**(2*k+1)/F(2*k+1) for k in range(terms)),F(0))
 error=2*abs(y)**(2*terms+1)/(F(2*terms+1)*(1-y*y))
 return total,error
def log(a,terms):
 if a.im or a.re<=a.radius:raise ValueError('log requires positive-real center and disk excluding zero')
 m=a.re;k=0
 while m>=2:m/=2;k+=1
 while m<1:m*=2;k-=1
 if abs(k)>4096:raise ResourceHold(' logarithm scale budget')
 v,e=atanh_log((m-1)/(m+1),terms);v2,e2=atanh_log(F(1,3),terms)
 return Ball(v+k*v2,F(0),e+abs(k)*e2+a.radius/(a.re-a.radius))
def _apply(op,a,b=None,terms=32):
 if type(terms)is not int or not 8<=terms<=64:raise ValueError('series budget 8..64')
 if op=='add':return compact(add(a,b))
 if op=='multiply':return compact(mul(a,b))
 if op=='divide':return compact(div(a,b))
 if op=='log':return compact(log(a,terms))
 if op=='exp':return compact(exp(a,terms))
 raise ValueError('unknown operator')

def apply(op,a,b=None,terms=32):
 guard(a)
 if b is not None:guard(b)
 return guard(_apply(op,a,b,terms))
