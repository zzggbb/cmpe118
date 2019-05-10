E24 = [1, 1.1, 1.2, 1.3, 1.5, 1.6, 1.8, 2.0, 2.2, 2.4, 2.7, 3.0, 3.3, 3.6, 3.9, 4.3, 4.7, 5.1, 5.6, 6.2, 6.8, 7.5, 8.2, 9.1]
resistors = []
for exponent in [0, 1, 2, 3, 4, 5, 6, 7]:
  for multiplier in E24:
    value = multiplier * 10**exponent
    resistors.append(value)

E6 = [1, 1.5, 2.2, 3.3, 4.7, 6.8]
capacitors = []
for exponent in [-12, -11, -10, -9, -8, -7]:
  for multiplier in E6:
    value = multiplier * 10**exponent
    capacitors.append(value)

def name(value):
  pairs = {
      'pF': 1e-12,
      'nF': 1e-9,
      'uF': 1e-6,
      'mF': 1e-3,
      'Ω': 1,
      'KΩ': 1e3,
      'MΩ': 1e6,
  }

  for k, min in pairs.items():
    if min <= value < min*1e3:
      return '{:.1f} {}'.format(value/min, k)

if __name__ == '__main__':
  for v in [4.7e-4, 4.7e-5, 4.7e-6, 4.7e-7, 4.7e-8, 4.7e-9, 4.7e-10, 4.7e-11, 4.7e-12]:
    print(v, name(v))
