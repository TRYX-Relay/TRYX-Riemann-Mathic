from pathlib import Path
import json,hashlib,subprocess,sys
sys.path.insert(0,str(Path('../../.re6b-cert-deps').resolve()))
from flint import acb,arb,ctx
from ZETA import calculate,ResourceHold
ctx.prec=192
r=calculate("1/2","14.134725141734695",radius="1/1000000")
def number(s):return arb(s)
c=acb(number(r['result_ball'][0]),number(r['result_ball'][1]));rad=number(r['result_ball'][2])
for dx,dy in [(0,0),(1,0),(-1,0),(0,1),(0,-1)]:
 z=acb(arb(1)/2+arb(dx)/1000000,arb('14.134725141734695')+arb(dy)/1000000)
 assert abs(z.zeta()-c)<rad
p=calculate("1/2","14.134725141734695")
parent=Path('../ENIAD_ARITHMETIC_DOMAIN_ZETA_261017_V1').resolve()
raw=subprocess.check_output([sys.executable,'-B','-c','import json;from ZETA import calculate;print(json.dumps(calculate("1/2","14.134725141734695")["result_ball"]))'],cwd=parent,text=True)
assert p['result_ball']==json.loads(raw)
for re,im,rho in [('1','0','1/100'),('0','0','1/100'),('1/2','20','1/100'),('1/2','1','-1')]:
 try:calculate(re,im,radius=rho)
 except ValueError:pass
 else:raise AssertionError('invalid input accepted')
receipt=r['execution']['receipts'][0]
assert any(x['ball'][2]=='1/1000000' for x in receipt['body']['operands'])
out={'status':'PASS','reference_samples':5,'reference':'FLINT 192-bit certified sample comparisons; samples not uniform proof','disk_radius':str(rad),'zero_radius_exact_parent_match':True,'invalid_inputs_rejected':4,'radius_in_receipt':True,'zero_certificate':False}
Path('TEST_RESULTS.json').write_text(json.dumps(out,indent=2))
print(json.dumps(out))
