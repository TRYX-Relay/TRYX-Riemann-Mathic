from pathlib import Path
from fractions import Fraction as Q
import json,hashlib
p=Path(__file__).resolve().parent
d=json.loads((p/'CERTIFICATE.json').read_text())
assert d['status']=='PASS'
assert d['source_hashes']=={'ZETA.py': '670fbffbbacb1944f8551a2eea2a8f92653c69b382d9bb1e37f08488acd10a19', 'RUNTIME.py': 'f2fa6128f5cb63a114a67980c348786785c6743030431c15d9ccfb264ac2e84b', 'KERNEL.py': '98f48ff1e36bde0810fb1fcfab603270ff50f0703a5d2258d25b2024c95e708c', 'RATIONAL.py': 'e1c54262aa633f17834fd916619c1cfe04da113b938d07130f2fadecdfde15a0', 'TEST.py': '3b4dfc388dba1c5b92a155054e7921b658f51755e0ce1a89ff4c59904cee86f3'}
r=d['segments'];assert r
v=[tuple(map(Q,x)) for x in d['rectangle']]
assert v==[(Q('0.495'),Q('14.1297')),(Q('0.505'),Q('14.1297')),(Q('0.505'),Q('14.1397')),(Q('0.495'),Q('14.1397'))]
assert not (v[0][0]<=1<=v[1][0] and v[0][1]<=0<=v[2][1])
side=0;cursor=v[0];w=0
for i,e in enumerate(r):
 a,b=tuple(map(Q,e['a'])),tuple(map(Q,e['b']))
 assert a==cursor and a!=b
 end=v[(side+1)%4];start=v[side]
 if start[0]==end[0]:
  assert a[0]==b[0]==start[0]
  assert min(start[1],end[1])<=b[1]<=max(start[1],end[1])
  assert (b[1]-a[1])*(end[1]-start[1])>0
 else:
  assert a[1]==b[1]==start[1]
  assert min(start[0],end[0])<=b[0]<=max(start[0],end[0])
  assert (b[0]-a[0])*(end[0]-start[0])>0
 cursor=b
 if b==end:side+=1
 m=list(map(Q,e['image']));rr=Q(e['radius_star']);ca=list(map(Q,e['ca']));cb=list(map(Q,e['cb']))
 assert rr>=m[2]>=0 and m[0]*m[0]+m[1]*m[1]>rr*rr
 assert sum(abs(ca[j]-m[j]) for j in range(2))<=rr
 assert sum(abs(cb[j]-m[j]) for j in range(2))<=rr
 assert e['cb']==r[(i+1)%len(r)]['ca']
 cross=ca[0]*cb[1]-cb[0]*ca[1]
 assert not (cross==0 and ca[0]*cb[0]+ca[1]*cb[1]<=0)
 if ca[1]<=0<cb[1] and cross>0:w+=1
 elif cb[1]<=0<ca[1] and cross<0:w-=1
assert side==4 and cursor==v[0] and w==d['winding']
for name,h in d['source_hashes'].items():
 assert hashlib.sha256((p.parent/'ENIAD_ZETA_DISK_261018_V1'/name).read_bytes()).hexdigest()==h
print(json.dumps({'exact_geometry_checks':'PASS','winding':w,'segments':len(r),'arithmetic_replayed':False}))
