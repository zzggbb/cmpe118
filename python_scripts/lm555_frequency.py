#!/bin/env python

import sys
import math
import components

e = 0.25 # error margin
c = 0.027e-6
target_f = 21000
target_q = 0.5

# note that rb must be less than half ra

configurations = []

for ra in components.resistors:
  for rb in components.resistors:
    if rb >= ra/2:
      continue

    t1 = math.log(2) * ra * c
    t2 = (ra * rb)/(ra + rb) * c * math.log((rb - 2*ra)/(2*rb - ra))
    f = 1/(t1+t2)
    q = t1/(t1+t2)

    if not (target_q*(1-e) <= q <= target_q*(1+e)):
      continue

    if not (target_f*(1-e) <= f <= target_f*(1+e)):
      continue

    configurations.append({
      'ra': ra,
      'rb': rb,
      'c': c,
      'f': f,
      'q': q
    })

# convert configurations into list, sorted by proximity to target_frequency
proximity = []
for c in configurations:
  proximity.append(list(c.items()))

print("10 best, by frequency")
for c in sorted(proximity, key=lambda c: abs(c[3][1] - target_f))[:10]:
  print(c)

print("10 best, by duty cycle")
for c in sorted(proximity, key=lambda c: abs(c[4][1] - target_q))[:10]:
  print(c)
