#!/bin/env python

import numpy
import components

#target_f = 8000
#target_rc = 1/(2*numpy.pi * target_f)
target_rc = 451.9629e-6

e = 0.25

configurations = []
for r in components.resistors:
  for c in components.capacitors:
    rc = r*c

    if not (target_rc*(1-e) <= rc <= target_rc*(1+e)):
      continue

    configurations.append({
      'r': r,
      'c': c,
      'rc': rc
    })

proximity = []
for c in configurations:
  proximity.append(list(c.items()))

print("10 closest to {}:".format(target_rc))
for c in sorted(proximity, key=lambda c: abs(c[2][1] - target_rc))[:10]:
  print(', '.join(['{}: {}'.format(k, components.name(v)) for k, v in c]))
