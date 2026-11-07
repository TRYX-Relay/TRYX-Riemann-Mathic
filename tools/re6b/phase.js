(function(root){
function prime(n){if(!Number.isInteger(n)||n<2||n>10000)return false;for(let d=2;d*d<=n;d++)if(n%d===0)return false;return true}
function tracks(sigma,t,ps){if(!Number.isFinite(sigma)||sigma<.01||sigma>10||!Number.isFinite(t)||Math.abs(t)>1e6)throw Error('Enter σ from 0.01 to 10 and a finite height within ±1,000,000.');if(!ps.length||ps.length>8||new Set(ps).size!==ps.length||!ps.every(prime))throw Error('Enter up to 8 distinct primes between 2 and 10,000.');return ps.map(p=>{const turns=t*Math.log(p)/(2*Math.PI),whole=Math.trunc(turns),fraction=turns-whole,r=Math.exp(-sigma*Math.log(p)),angle=-2*Math.PI*fraction,x=r*Math.cos(angle),y=r*Math.sin(angle),den=(1-x)**2+y*y;return {p,sigma,t,r,turns,whole,fraction,angle_unwrapped:-2*Math.PI*turns,q:[x,y],L:[(1-x)/den,y/den],centre:1/(1-r*r),radius:r/(1-r*r)}})}
function series(track,n){
if(!Number.isInteger(n)||n<1||n>1000)throw Error('Enter 1–1000 series terms.');
const mul=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]];
let power=[1,0],sum=[0,0];const powers=[];
for(let k=0;k<n;k++){powers.push({k,value:power.slice(),sum:[sum[0]+power[0],sum[1]+power[1]],turns:k*track.turns});sum=[sum[0]+power[0],sum[1]+power[1]];power=mul(power,track.q)}
const remainder=mul(power,track.L),residual=Math.hypot(sum[0]+remainder[0]-track.L[0],sum[1]+remainder[1]-track.L[1]);
return {prime:track.p,terms:n,sum,remainder,remainderMagnitude:Math.hypot(...remainder),residual,powers};
}
root.Re6b={prime,tracks,series};if(typeof module!=='undefined')module.exports=root.Re6b;
})(globalThis);

