load fp.sage

# TESTS FP
print ("Tests FP")

L1 = [1, 2, 5, 6, 3, 3]
L2 = [3, 4, 1, 3]
L3 = [1, 2, 3, 3, 5, 6]
L4 = [1, 3, 3, 4, 4]
print (is_fp (L1))
print (is_fp (L2))
print (is_primitive (L1))
print (is_primitive (L3))
print (is_primitive (L4))
print ()

n = 4
g = generate_fp (n)
k = 0
for e in g :
    print (e)
    k = k + 1
print (k)
print ((n + 1)^(n - 1))
print ()

g = generate_fpp (n)
k = 0
for e in g :
    print (e)
    k = k + 1
print (k)
print (catalan_number (n))
print ()

P = Permutation ([2, 4, 1, 3, 6, 5])
print (perm_fp (P, L1))
print ()

pi = SetPartition ([{1, 4, 6}, {2, 3}, {5}])
rho = SetPartition ([{1, 5}, {2}, {3, 4, 6}])
lam = {0 : 2, 1 : 0, 2 : 1}
D = DPNC (pi, rho, lam)
print (dpnc_to_fp (D))
print ()

L5 = [5, 1, 1, 1, 2, 5, 4, 3, 3, 2]
D5 = fp_to_dpnc (L5)
print (D5.pi)
print (D5.rho)
print (D5.lam)
print (D5.is_dpnc ())
print ()

L6 = [1, 1, 5, 2, 3, 2, 1, 4, 9, 5, 1, 3, 13, 13]
D6 = fp_to_dpnc (L6)
print (D6.pi)
print (D6.rho)
print (D6.lam)
print (D6.is_dpnc ())
print ()

print (L6)
print (dpnc_to_fp (D6))
print ()

L7 = dpnc_to_fp (D)
print (L7)
D7 = fp_to_dpnc (L7)
print (D.pi, D7.pi)
print (D.rho, D7.rho)
print (D.lam, D7.lam)