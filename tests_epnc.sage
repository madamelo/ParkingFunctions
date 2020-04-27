load epnc.sage

# TESTS EPNC
print ("Tests EPNC")

pi = SetPartition ([{1, 4, 5}, {2, 3}])
sig1 = Permutation ([2, 1, 5, 3, 4])
sig2 = Permutation ([2, 1, 5, 4, 3])
e1 = EPNC (pi, sig1)
e2 = EPNC (pi, sig2)
print (e1.is_epnc ())
print (e2.is_epnc ())

n = 4
g = generate_epnc (n)
k = 0
for e in g :
    print (e.pi, e.sig)
    k = k + 1
print (k)
print ((n + 1)^(n - 1))

pi3 = SetPartition ([{1, 5}, {4}, {2, 3}])
sig3 = Permutation ([2, 1, 4, 3, 5])
e3 = EPNC (pi3, sig1)
e4 = EPNC (pi3, sig3)
print (couvre_epnc (e3, e1))
print (couvre_epnc (e4, e1))
print (couvre_epnc (e1, e3))