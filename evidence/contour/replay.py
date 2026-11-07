"""Replay the bundled contour certificate using only Python's standard library."""
from pathlib import Path
from fractions import Fraction
import argparse
import contextlib
import hashlib
import io
import json
import runpy
import sys
import time
import types
import __future__

ROOT = Path(__file__).resolve().parent
ARITHMETIC = ROOT / 'ENIAD_ZETA_DISK_261018_V1'
CONTOUR = ROOT / 'ENIAD_ZETA_REFINED_CONTOUR_261018_V1'
EXPECTED_CERTIFICATE = 'e399e1d4b2ed2d006174e7a55366e6ca501c2dc88d29388003adc5164c6218da'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check-inputs', action='store_true',
                        help='Check source hashes and exact geometry without replaying disks.')
    parser.add_argument('--segments', type=int,
                        help='Replay only the first N disks; never reports full replay unless N=128.')
    parser.add_argument('--output', type=Path, default=ROOT / 'replay-results',
                        help='Directory for newly generated results; saved evidence is untouched.')
    args = parser.parse_args()
    certificate_bytes = (CONTOUR / 'CERTIFICATE.json').read_bytes()
    certificate_hash = hashlib.sha256(certificate_bytes).hexdigest()
    if certificate_hash != EXPECTED_CERTIFICATE:
        raise ValueError('Certificate hash differs from the reviewed certificate.')
    data = json.loads(certificate_bytes)
    for name, expected in data['source_hashes'].items():
        if hashlib.sha256((ARITHMETIC / name).read_bytes()).hexdigest() != expected:
            raise ValueError('Arithmetic source hash mismatch: ' + name)
    geometry_output = io.StringIO()
    with contextlib.redirect_stdout(geometry_output):
        runpy.run_path(str(CONTOUR / 'VERIFY.py'), run_name='__main__')
    geometry = json.loads(geometry_output.getvalue())
    if geometry['exact_geometry_checks'] != 'PASS' or geometry['winding'] != 1:
        raise ValueError('Exact geometry verification failed.')
    if args.check_inputs:
        print(json.dumps({'input_hashes': 'PASS', 'geometry': geometry,
                          'arithmetic_replayed': False}, indent=2))
        return
    total = len(data['segments'])
    count = total if args.segments is None else args.segments
    if count < 1 or count > total:
        raise ValueError('Segment count must be between 1 and ' + str(total))
    # Defer type annotations for Python 3.9 compatibility. Source bytes and
    # arithmetic operations remain identical to the reviewed implementation.
    for name in ['RATIONAL', 'KERNEL', 'RUNTIME', 'ZETA']:
        source = ARITHMETIC / (name + '.py')
        module = types.ModuleType(name)
        module.__file__ = str(source)
        sys.modules[name] = module
        exec(compile(source.read_bytes(), str(source), 'exec',
                     flags=__future__.annotations.compiler_flag), module.__dict__)
    calculate = sys.modules['ZETA'].calculate
    args.output.mkdir(parents=True, exist_ok=True)
    start = time.monotonic()
    for index, segment in enumerate(data['segments'][:count], 1):
        a, b = [tuple(map(Fraction, segment[key])) for key in ('a', 'b')]
        midpoint = tuple((a[j] + b[j]) / 2 for j in (0, 1))
        radius = sum(abs(a[j] - b[j]) for j in (0, 1)) / 2
        actual = calculate(str(midpoint[0]), str(midpoint[1]),
                           radius=str(radius))['result_ball']
        if actual != segment['image']:
            raise ValueError('Disk mismatch at segment ' + str(index))
        progress = {'verified_disks': index, 'requested': count, 'total': total,
                    'elapsed_seconds': time.monotonic() - start}
        (args.output / 'PROGRESS.json').write_text(json.dumps(progress, indent=2) + '\n')
        if index % 8 == 0 or index == count:
            print('Verified disks ' + str(index) + '/' + str(count), flush=True)
    result = {'certificate_sha256': certificate_hash,
              'verified_disks': count, 'certificate_disks': total,
              'all_segment_disks_replayed': count == total,
              'exact_geometry_checks': 'PASS', 'winding': geometry['winding'],
              'elapsed_seconds': time.monotonic() - start,
              'scope': 'Retained implementation and reviewed analytic enclosure bounds; bounded rectangle only.'}
    (args.output / 'RESULT.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
