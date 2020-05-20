load edelman.sage

m = 10
for b in (1..m) :
    print (sigb (b, m))
print ()

P1 = [[1, 6, 9], [2], [3, 4, 5], [7, 8]]
print (reorder (P1, 3, 9))
print ()

L2 = [1, 3, 5, 6, 7]
R2_1 = [1, 2, 5]
R2_2 = [8]
s2 = sigb_hat (L2, [R2_1, R2_2], 3, 8)
print (s2)
print ()

s3 = ['(', 3, 2, '(', 4, ')', ')', '(', '(', 1, ')']
print (good_par (s2))
print (good_par (s3))
print ()

cpt = 0
found = 0
for b in (1..8) :
    s = sigb_hat (L2, [R2_1, R2_2], b, 8)
    _, r = good_par (s)
    if r :
        cpt = cpt + 1
        found = b
print (cpt, found)
print ()

print (to_part (L2, [R2_1, R2_2], 8))
print ()

m = 6
k = 3
g = generate_pnc_k (m, k)
kt = 0
for e in g :
    print (e)
    kt = kt + 1

print (kt)
print ((1 / m) * binomial (m, k) * binomial (m, k - 1))
print ()

print (par_to_pnc_b (L2, R2_1 + R2_2, 8))
print ()

P3 = [[1], [2, 6], [3, 4], [5], [7, 8]]
print (pnc_b_to_par (P3, 3, 8))
print ()

print (rk (P3))
print ()

P4 = [[1], [2, 5, 6], [3, 4], [7, 8]]
print (cov (P4, P3))
print (cov (P3, P4))
print ()

g2 = generate_strict_chains ([1, 2], 4)
k = 0
for e in g2 :
    print (e)
    k = k + 1
print (k)
print (cpt_strict_chains ([1, 2], 4))