
const mul=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]];
function zeta(t,N=256){const s=[.5,t];let z=[0,0];function add(a){z[0]+=a[0];z[1]+=a[1]};function pow(a){let m=Math.pow(N,a);return [m*Math.cos(-t*Math.log(N)),m*Math.sin(-t*Math.log(N))]};for(let k=1;k<N;k++){let q=-t*Math.log(k),m=1/Math.sqrt(k);add([m*Math.cos(q),m*Math.sin(q)])}let d=.25+t*t;add(mul(pow(.5),[-.5/d,-t/d]));add(pow(-.5).map(x=>x*.5));let f=s;[1/12,-1/720,1/30240,-1/1209600,1/47900160,-691/1307674368000].forEach((c,i)=>{let j=i+1;if(j>1)f=mul(mul(f,[.5+2*j-3,t]),[.5+2*j-2,t]);add(mul(f,pow(-.5-2*j+1)).map(x=>c*x))});return z}
const norm=z=>Math.hypot(...z);
function refine(a,b){let g=(Math.sqrt(5)-1)/2,c=b-g*(b-a),d=a+g*(b-a),fc=norm(zeta(c)),fd=norm(zeta(d));for(let i=0;i<65;i++){if(fc<fd){b=d;d=c;fd=fc;c=b-g*(b-a);fc=norm(zeta(c))}else{a=c;c=d;fc=fd;d=a+g*(b-a);fd=norm(zeta(d))}}let y=(a+b)/2,z=zeta(y),z2=zeta(y,512);return {y,re:z2[0],im:z2[1],residual:norm(z2),cutoffDifference:Math.hypot(z[0]-z2[0],z[1]-z2[1])}}

