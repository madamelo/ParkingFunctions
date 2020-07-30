load ../code/epnc.sage

# TESTS EPNC
print ("Tests EPNC")

pi = SetPartition ([{1, 4, 5}, {2, 3}])
sig1 = Permutation ([2, 1, 5, 3, 4])
sig2 = Permutation ([2, 1, 5, 4, 3])
e1 = EPNC (pi, sig1)
e2 = EPNC (pi, sig2)
print (e1.is_epnc ())
print (e2.is_epnc ())
print ()

n = 4
g = generate_epnc (n)
k = 0
for e in g :
    print (e.pi, e.sig)
    k = k + 1
print (k)
print ((n + 1)^(n - 1))
print ()

pi3 = SetPartition ([{1, 5}, {4}, {2, 3}])
sig3 = Permutation ([2, 1, 4, 3, 5])
e3 = EPNC (pi3, sig1)
e4 = EPNC (pi3, sig3)
print (couvre_epnc (e3, e1))
print (couvre_epnc (e4, e1))
print (couvre_epnc (e1, e3))
print ()

pi5 = SetPartition ([{1, 4, 5}, {2, 3}])
rho5 = SetPartition ([{1, 3, 5}, {2, 4}])
lam5 = {0 : 0, 1 : 1}
d5 = DPNC (pi5, rho5, lam5)
e5 = dpnc_to_epnc (d5)
ed5 = epnc_to_dpnc (e5)
print (e5.pi, e5.sig)
print (ed5.pi, ed5.rho, ed5.lam)
print ()

d6 = epnc_to_dpnc (e1)
de6 = dpnc_to_epnc (d6)
print (d6.pi, d6.rho, d6.lam)
print (de6.pi, de6.sig)
print ()

pi7 = SetPartition ([{1, 4, 5}, {2}, {3}])
sig7 = Permutation ([2, 5, 1, 3, 4])
e7 = EPNC (pi7, sig7)
print (epnc_label (e3, e1))
print (epnc_label (e7, e1))
print ()

print (precede_label (e1, e3, e7))
print (precede_label (e1, e7, e3))
