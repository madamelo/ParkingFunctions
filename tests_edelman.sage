load edelman.sage

m = 10
for b in (1..m) :
    print (sigb (b, m))
print ()

P1 = [[1, 6, 9], [2], [3, 4, 5], [7, 8], [10, 11]]
print (reorder (P1, 3, 11))
print ()

L2 = [1, 3, 5, 6, 7]
R2_1 = [1, 2, 5]
R2_2 = [8]
s2 = sigb_hat (L2, [R2_1, R2_2], 3, 8)
print (s2)
print ()

s3 = ['(', 3, 2, '(', 4, ')', ')', '(', '(', 1, ')']
s4 = ['(', 33, 2, '(', 4, ')', '(', 1, ')']
print (good_par (s2))
print (good_par (s3))
print (good_par (s4))
print ()

cpt = 0
foundb = 0
founds = ""
for b in (1..12) :
    s = sigb_hat (L2, [R2_1, R2_2], b, 12)
    s_, r = good_par (s)
    if r :
        cpt = cpt + 1
        foundb = b
        founds = s_ 
print (cpt, foundb)
print (founds)
print ()

print (to_part (L2, [R2_1, R2_2], 12))
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

P3, b3 = par_to_pnc_b (L2, R2_1 + R2_2, 11)
print (P3, b3)
print ()

print (pnc_b_to_par (P3, b3, 11))
print ()

print (rk (P3))
print ()

P4 = [[1], [2, 6, 9, 10, 11], [3, 4, 5], [7,8]]
print (cov (P4, P3))
print (cov (P3, P4))
print ()

g2 = generate_strict_chains ([1, 3], 5)
k = 0
for e in g2 :
    print (e)
    k = k + 1
print (k)
print (cpt_strict_chains ([1, 3], 5))
print ()

g3 = generate_max_chains (5)
k = 0
for e in g3 :
    k = k + 1
print (k)
print (cpt_max_chains (5))
print ()

print (zeta_pnc (6, 3))
print (cpt_weak_chains (6, 3))
print ()

P4 = [[1, 2, 12], [3, 10, 11], [4, 5, 6, 7, 8, 9]]
print (is_k_divisible (P4, 3, 4))
print (is_k_divisible (P4, 3, 3))
print (is_k_divisible (P4, 4, 3))
print ()

P5 = [[1, 2, 3, 10, 11, 12], [4, 5, 6, 7, 8, 9]]
print (rk_k (P4, 3, 4))
print (rk_k (P5, 3, 4))
print ()

g4 = generate_pnc_k_h (5, 2, 2)
k = 0
for e in g4 :
    print (e)
    k = k + 1
print (k)
print (cpt_pnc_k_h (5, 2, 2))
print ()

g5 = generate_pnc_k_div (3, 2)
k = 0
for e in g5 :
    print (e)
    k = k + 1
print (k)
print (cpt_pnc_k_div (3, 2))
print ()

L6 = [1, 2, 3, 5]
R6 = [2, 9, 11]
print (par_to_pnc_b_k (L6, R6, 5, 3))
print ()

g7 = generate_strict_chains_k ([0, 2], 3, 2)
k = 0
for e in g7 :
    print (e)
    k = k + 1
print (k)
print (cpt_strict_chains_k ([0, 2], 3, 2))
print ()

g8 = generate_max_chains_k (3, 2)
k = 0
for e in g8 :
    print (e)
    k = k + 1
print (k)
print (cpt_max_chains_k (3, 2))
print ()

print (zeta_pnc_k (3, 3, 2))
print (cpt_weak_chains_k (3, 3, 2))