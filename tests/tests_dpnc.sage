load ../code/dpnc.sage

# TESTS DPNC
print ("Tests DPNC")

pi = SetPartition ([{1, 4, 5}, {2, 3}])
rho = SetPartition ([{1, 3, 5}, {2, 4}])
lam = {0 : 0, 1 : 1}
d = DPNC (pi, rho, lam)
print (d.is_dpnc ())

lam2 = {0 : 1, 1 : 0}
d2 = DPNC (pi, rho, lam2)
print (d2.is_dpnc ())

d3 = DPNC (rho, rho, lam)
print (d3.is_dpnc ())
print ()

n = 4
g = generate_dpnc (n)
k = 0
for e in g :
    print (e.pi, e.rho, e.lam)
    k = k + 1
print (k)
print ((n + 1)^(n - 1))
print ()

pi4 = SetPartition ([{1, 5}, {2, 3}, {4}])
rho4 = SetPartition ([{1}, {2, 4}, {3, 5}])
lam4 = {0 : 2, 1 : 1, 2 : 0}
d4 = DPNC (pi4, rho4, lam4)
print (couvre_dpnc (d4, d))

lam5 = {0 : 1, 1 : 2, 2 : 0}
d5 = DPNC (pi4, rho4, lam5)
print (couvre_dpnc (d5, d))
print ()

print (d.rang ())
print (d4.rang ())
print ()

P = Permutation ([4, 5, 2, 1, 3])
d6 = perm_dpnc (P, d)
print (d6.pi)
print (d6.rho)
print (d6.lam)
