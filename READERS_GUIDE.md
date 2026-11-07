# Riemann paper and MATHIC reader guide

7 November 2026 · Publication successor V2

The [current evidence note](ERRATA_AND_CURRENT_STATUS.md) describes the dated repairs. The current paper integrates the corrected reproduction instructions. The paper develops the construction; the MATHIC gathers its assumptions, conclusions, proofs and challenges. Both retain the same local-closure scope.

## Paper and MATHIC topic map

| Topic | Paper | MATHIC | Reading question |
|---|---|---|---|
| Prime labels | [Pages 5–7](paper/PAPER.pdf#page=5) | [Pages 3–4](mathic/MATHIC_READER.pdf#page=3) | Which labels survive arithmetic selection? |
| Matching and midpoint | [Pages 6–9](paper/PAPER.pdf#page=6) | [Pages 3–5](mathic/MATHIC_READER.pdf#page=3) | Which premise gives relative half, and which gives absolute half? |
| Affine and recursive preservation | [Pages 9–10](paper/PAPER.pdf#page=9) | [Pages 5–6](mathic/MATHIC_READER.pdf#page=5) | What survives each operation, and what coverage is assumed? |
| Exact inherited-state recovery | [Pages 10–11](paper/PAPER.pdf#page=10) | [Page 6](mathic/MATHIC_READER.pdf#page=6) | Which decoder recovers the retained distinction? |
| Bent path and signed chart | [Pages 11–12](paper/PAPER.pdf#page=11) | [Page 6](mathic/MATHIC_READER.pdf#page=6) | How do nonnegative path distance and signed Y differ? |
| Critical-line readout | [Pages 12–13](paper/PAPER.pdf#page=12) | [Page 7](mathic/MATHIC_READER.pdf#page=7) | Which zero family and multiplicities are recovered? |
| Original zeros and full addresses | [Pages 13–15](paper/PAPER.pdf#page=13) | [Pages 7–9](mathic/MATHIC_READER.pdf#page=7) | Where is d retained, and what would permit its removal? |
| Bounded rectangle | [Page 15](paper/PAPER.pdf#page=15) | [Page 10](mathic/MATHIC_READER.pdf#page=10) | Which exact evidence supports the bounded count? |
| Questions and tests | [Pages 16–20](paper/PAPER.pdf#page=16) | [Pages 11–15](mathic/MATHIC_READER.pdf#page=11) | What does each challenge actually establish? |
| Formal coverage | [Page 27](paper/PAPER.pdf#page=27), with [correction](ERRATA_AND_CURRENT_STATUS.md) | [Pages 15–16](mathic/MATHIC_READER.pdf#page=15) | Which statements are in the consolidated proof file? |

## Definitions and return

The [definition index begins on page 21](paper/PAPER.pdf#page=21). Short routes are [address and recovery](paper/PAPER.pdf#page=22), [generation, inherited state and parent](paper/PAPER.pdf#page=23), [record and relative progress](paper/PAPER.pdf#page=24), and [signed chart, zeta zeros and survivors](paper/PAPER.pdf#page=25).

Use the PDF reader's Previous View or navigation Back command after following a link. Previous Page follows page order. These page links do not promise restoration of a word or scroll position. For comparison, keep the paper and MATHIC open together. The paper contains definition links and first-use return routes. Figure 2 number labels link to their worked definitions. The MATHIC reader copy retains its original page numbering and adds a dated update on page 18.

## Reproduce and inspect

Use the [current one-file Lean instructions](ERRATA_AND_CURRENT_STATUS.md), the [active source](lean/PrimeCrease.lean) and its [verification record](LEAN_VERIFICATION_CURRENT.md). Historical Lean snapshots are stored as text, not build targets.

The [contour replay](evidence/contour/README.md) now has a bundled certificate, arithmetic implementation and portable launcher. It addresses its bounded rectangle. The [source map](references/README.md) supplies selected historical records cited in the reader PDFs.

Open [RE6B V3](tools/re6b/index.html) or the [zeta sniffer](tools/zeta-sniffer/index.html) from the extracted packet. Their runnable code is unchanged from the tested original packet. The sniffer supplies numerical candidates; neither instrument establishes universal RH placement.
