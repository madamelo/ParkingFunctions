load ../code/abfpp.sage

# TESTS ABFPP
print ("Tests ABFPP")

a1 = 10
b1 = 7
p1 = [6, 3, 1, 4, 2, 7, 1, 3, 4, 5]
p2 = [6, 3, 1, 4, 2, 7, 1, 3, 4, 6]
A1 = ABFPP (a1, b1, p1)
A2 = ABFPP (a1, b1, p2)
print (A1.is_abfpp ())
print (A2.is_abfpp ())
print ()

a = 3
b = 4
g = generate_abfpp (a, b)
k = 0
for e in g :
    print (e.p)
    k = k + 1
print (k)
print (b^(a - 1))
print ()

a = 5
b = 4
g = generate_abfpp (a, b)
k = len (list (g))
print (k)
print (b^(a - 1))
print ()

sig1 = Permutation ([9, 4, 7, 8, 6, 2, 1, 5, 3, 10])
A3 = perm_abfpp (A1, sig1)
print (A3.p)
print (A3.is_abfpp ())
print ()

a4 = 10
b4 = 7
P4 = SetPartition ([[1, 2], [3, 6], [4, 5]])
fP4 = {0 : {3, 7, 10}, 1 : {1, 4}, 2 : {6, 8, 9}}
Q4 = SetPartition ([[1], [2, 6], [3, 5], [4]])
fQ4 = {0 : {}, 1 : {2}, 2 : {5}, 3 : {}}
AB = ABFP (a4, b4, P4, Q4, fP4, fQ4)
print (AB.is_abfp ())
A4 = abfp_to_abfpp (AB)
print (A4.p)
print (A4.is_abfpp ())
print ()

R4 = abfpp_to_rdyck (A1)
print (R4.p)
print (R4.is_rdyck ())
R4.pretty_print ()
print ()

R5, l5 = abfpp_to_labeled_rdyck (A1)
print (R5.p)
print (l5)
print (R5.is_rdyck ())
R5.pretty_print ()
print ()

A6 = abfpp_to_abfp (A1)
print (A6.P, A6.Q)
print (A6.fP, A6.fQ)
print (A6.is_abfp ())
