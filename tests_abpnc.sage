load abpnc.sage
load rdyck.sage

# TESTS ABPNC
print ("Tests ABPNC")

P1 = SetPartition ([[1, 4, 6], [2], [3], [5]])
P2 = SetPartition ([[1, 3], [2], [4, 5], [6]])
Q1 = SetPartition ([[1], [2, 3, 4], [5, 6]])
print (mut_nc (P1, Q1))
print (mut_nc (P2, Q1))
print ()

b = 4
g = generate_mut (b)
k = 0
for e in g :
    print (e)
    k = k + 1
print (k)
print ()

A1 = ABPNC (10, 7, P1, Q1)
A2 = ABPNC (10, 7, P2, Q1)
print (A1.is_abpnc ())
print (A2.is_abpnc ())
print ()

a3 = 10
b3 = 7
p3 = [1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0]
R3 = RDYCK (a3, b3, p3)
P3, _ = P (R3)
Q3, _ = Q (R3)
A3 = ABPNC (a3, b3, P3, Q3)
print (A3.is_abpnc ())
print ()

a = 3
b = 4
g = generate_abpnc (a, b)
k = 0
for e, lp, lq in g :
    print (e.P, e.Q, lp, lq)
    s = 0
    for e in lp :
        s = s + lp [e]
    for e in lq :
        s = s + lq [e]
    print (s, s == a)
    k = k + 1
print (k)
print ((1 / (a + b)) * binomial (a + b, a))