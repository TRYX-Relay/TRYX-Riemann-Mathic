# EZPR Zeta sniffer

Released 4 November 2026.

[Open the included local sniffer](index.html).

Extract the packet and keep engine.js beside index.html. Choose reference A and real offsets r; height y=A+r determines zeta(1/2+i*y). Scan, inspect candidates, recenter without changing heights, and export numerical results.

The historical hosted address is https://ezpr-zeta-sniffer.netlify.app. Its earlier release note requires Netlify team sign-in; anonymous access was not verified for this repair. The local application is the supported entry point in this packet.

The numerical engine uses Euler–Maclaurin at cutoffs 256 and 512, with supported heights 0–100. Refined minima below residual 1e-8 are candidates, not certified zeros. Cutoff agreement is not an error bound. This fixed-half-line search neither excludes off-line zeros nor derives heights from prime placement. First-three-height checks gave residuals below 4e-14.

Archive contains only the usable application and these notes. Local experiments, tests, test hashes and deployment credentials are excluded. The approved paper and previous MATHIC retain their separate status.

