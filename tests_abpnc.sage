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
print ()

A4 = abrot (A1)
print (A4.P, A4.Q)
print (A4.is_abpnc ())
print ()

A5 = abrotb (A1)
print (A5.P, A5.Q)
print (A5.is_abpnc ())
print ()

print (A1.P, A1.Q)
A6 = abrotb (A4)
print (A6.P, A6.Q)
A7 = abrot (A5)
print (A7.P, A7.Q)
print ()

a8 = 10
b8 = 7
p8 = [1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0]
R8 = RDYCK (a8, b8, p8)
R8.pretty_print ()
P8, rp8 = P (R8)
Q8, rq8 = Q (R8)
A8 = ABPNC (a8, b8, P8, Q8)
print (P8, Q8)

R9 = rotr (R8)
R9.pretty_print ()
P9, _ = P (R9)
Q9, _ = Q (R9)
print (P9, Q9)

A9 = abrotb (A8)
print (A9.P, A9.Q)
print ()

print (P9, Q9)
P10 = rotb (P8)
Q10 = rotb (Q8)
print (P10, Q10)
print ()

print (ranks (A8, rp8, rq8))
R11 = abpnc_to_rdyck (A8, rp8, rq8)
R11.pretty_print ()
print ()

for B1 in P8 :
    for B2 in P8 :
        if couvre_block_abpnc (A8, B1, B2) :
            print (list (B1), list (B2))
for B1 in P8 : 
    for B2 in Q8 :
        if couvre_block_abpnc (A8, B1, B2) :
            print (list (B1), list (B2))
print ()

print (rfn_p (P8))
print (rfn_q (Q8))
A12 = rfn (A8)
print (A12.P, A12.Q)
print (A12.is_abpnc ())