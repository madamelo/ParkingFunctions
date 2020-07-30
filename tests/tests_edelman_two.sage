load ../code/edelman_two.sage

P1 = [([1, 5, 6], [2, 4, 6]),
      ([2, 4], [3, 5]),
      ([3], [1])]
P2 = [([1, 4, 6], [2, 4, 6]),
      ([2, 5], [3, 5]),
      ([3], [1])]
P3 = [([1, 5, 6], [2, 4, 5]),
      ([2, 4], [3, 3]),
      ([3], [1])]
P4 = [([1, 5, 6], [2, 4, 6]),
      ([2, 4], [5]),
      ([3], [3, 1])]
print (is_edeltwo (P1))
print (is_edeltwo (P2))
print (is_edeltwo (P3))
print (is_edeltwo (P4))
print ()

P5 = [([1, 6], [4, 6]),
      ([2, 4], [3, 5]),
      ([3], [1]),
      ([5], [2])]
P6 = [([1, 6], [4, 6]),
      ([2], [5]),
      ([3], [1]),
      ([4], [3]),
      ([5], [2])]
print (cov_edeltwo (P1, P5))
print (cov_edeltwo (P5, P1))
print (cov_edeltwo (P1, P6))
print ()

n = 4
g = generate_edeltwo (n)
k = 0
for e in g :
    k = k + 1
print (k)
print (cpt_edeltwo (n))
print ()

P7 = [([1], [3]),
      ([2, 5], [1, 4]),
      ([3, 4], [2, 5])]
g = L_pi (P7)
for e in g :
    print (e)
print ()

print (type (P1))
print (type (P7))
print ()

s = [1, 0, 1, 0]
g = generate_edeltwo_s (s)
k = 0
for e in g :
    print (e)
    k = k + 1
print (k)
print (cpt_edeltwo_s (s))
print ()

A1 = [[1, 5, 6], [2, 4], [3]]
A7 = [[1], [2, 5], [3, 4]]
print (type_pnc (A1))
print (type_pnc (A7))
print ()

s2 = [3, 1, 1, 0, 0, 0, 0, 0]
g = generate_pnc_s (s2)
k = 0
for e in g :
    k = k + 1
print (k)
print (cpt_pnc_s (s2))
print ()

s3 = [2, 2, 1, 0, 0, 0, 0, 0, 0]
g = generate_part_s (s3)
k = 0
for e in g :
    k = k + 1
print (k)
print (cpt_part_s (s3))
print ()

print (cpt_edeltwo_s (s))
print (cpt_edeltwo_s_alt (s))
print ()

m = 5
h = 2
g = generate_edeltwo_h (m, h)
k = 0
for e in g :
    k = k + 1
print (k)
print (cpt_edeltwo_h (m, h))
print ()

m = 3
n = 3
print (zeta_edeltwo (n, m))
print (cpt_weak_edeltwo_chains (n, m))
