#!/bin/env python

import sys
import math
import components

target_g = 100
order = 3
f_pass = 21000
f_stop = 2100

def hpf(f, r, c):
  x = 2 * math.pi * f * r * c
  return  x / math.sqrt(x**2 + 1)

configurations = []
for r in components.resistors:
  for c in components.capacitors:
    g_pass = hpf(f_pass, r, c)**order
    g_stop = hpf(f_stop, r, c)**order
    g = g_pass / g_stop

    if (g < target_g):
      continue

    configurations.append({
      'r': r,
      'c': c,
      'g': g,
      'g_pass': g_pass,
      'g_stop': g_stop
    })

# convert configurations into list, sorted by proximity to target_frequency
proximity = []
for c in configurations:
  proximity.append(list(c.items()))

print(hpf(120, 43e3, 330e-12)**3)
print(hpf(2100, 43e3, 330e-12)**3)
print(hpf(2000, 43e3, 330e-12)**3)

print("10 closest to {}".format(target_g))
for c in sorted(proximity, key=lambda c: abs(c[2][1] - target_g))[:10]:
  print(c)
