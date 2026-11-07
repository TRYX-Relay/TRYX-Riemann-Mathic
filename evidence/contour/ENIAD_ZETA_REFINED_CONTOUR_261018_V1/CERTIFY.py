from pathlib import Path
import sys,json,hashlib,time
from fractions import Fraction as Q
base=Path(__file__).resolve().parent
sys.path.insert(0,str(base.parent/'ENIAD_ZETA_DISK_261018_V1'))
from ZETA import calculate
cache={};records=[];calls=0
def ev(x,y,r=Q(0)):
 global calls
 key=(x,y,r)
 if key not in cache:
  a=calculate(str(x),str(y),radius=str(r));calls+=1
  cache[key]=tuple(Q(v) for v in a['result_ball'])
  if calls%25==0:print(json.dumps({'calls':calls,'accepted':len(records)}),flush=True)
 return cache[key]
def segment(a,b,depth=0):
 if calls>=1200 or depth>16:raise RuntimeError('ResourceHold')
 mid=((a[0]+b[0])/2,(a[1]+b[1])/2)
 rho=(abs(a[0]-b[0])+abs(a[1]-b[1]))/2
 m=ev(*mid,rho);ca=ev(*a);cb=ev(*b)
 rr=max(m[2],abs(ca[0]-m[0])+abs(ca[1]-m[1]),abs(cb[0]-m[0])+abs(cb[1]-m[1]))
 if m[0]**2+m[1]**2>rr**2:
  records.append({'a':list(map(str,a)),'b':list(map(str,b)),'image':list(map(str,m)),'radius_star':str(rr),'ca':list(map(str,ca[:2])),'cb':list(map(str,cb[:2]))})
  return
 segment(a,mid,depth+1);segment(mid,b,depth+1)
def winding(edges):
 n=0
 for a,b in edges:
  cross=a[0]*b[1]-b[0]*a[1]
  if cross==0 and a[0]*b[0]+a[1]*b[1]<=0:raise ValueError('edge through origin')
  if a[1]<=0<b[1] and cross>0:n+=1
  if b[1]<=0<a[1] and cross<0:n-=1
 return n
# Exact winding controls: orientation, no-zero polygon, origin crossing.
square=[(Q(-1),Q(-1)),(Q(1),Q(-1)),(Q(1),Q(1)),(Q(-1),Q(1))]
edges=list(zip(square,square[1:]+square[:1]))
assert winding(edges)==1 and winding([(b,a) for a,b in edges])==-1
assert winding([((a[0]+3,a[1]),(b[0]+3,b[1])) for a,b in edges])==0
try:winding([((Q(-1),Q(0)),(Q(1),Q(0)))])
except ValueError:pass
else:raise AssertionError('origin edge accepted')
vertices=[(Q('0.495'),Q('14.1297')),(Q('0.505'),Q('14.1297')),(Q('0.505'),Q('14.1397')),(Q('0.495'),Q('14.1397'))]
status='PASS'
try:
 for a,b in zip(vertices,vertices[1:]+vertices[:1]):segment(a,b)
except RuntimeError:status='ResourceHold'
out={'status':status,'calls':calls,'segments':records,'rectangle':[[str(x),str(y)] for x,y in vertices],'production':'ENIAD_ZETA_DISK_261018_V1; no external zeta oracle','winding':None}
if status=='PASS':
 assert all(records[i]['b']==records[(i+1)%len(records)]['a'] for i in range(len(records)))
 out['winding']=winding([(tuple(map(Q,r['ca'])),tuple(map(Q,r['cb']))) for r in records])
out['source_hashes']={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in (base.parent/'ENIAD_ZETA_DISK_261018_V1').glob('*.py')}
(base/'CERTIFICATE.json').write_text(json.dumps(out,indent=2))
print(json.dumps({'status':status,'calls':calls,'segments':len(records),'winding':out['winding']}),flush=True)
