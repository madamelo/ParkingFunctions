load my_ab_cover.sage

# TESTS MABC
print ("Tests M a,b - C")

a1 = 7
b1 = 3
# limites : 1, 1, 1, 2, 2, 3, 3

L1 = ABFPP (a1, b1, [3, 1, 1, 2, 1, 2, 1])
L2 = ABFPP (a1, b1, [3, 2, 1, 2, 1, 2, 1])
L3 = ABFPP (a1, b1, [3, 2, 1, 2, 1, 3, 1])
L4 = ABFPP (a1, b1, [2, 1, 1, 3, 1, 2, 1])

print (my_ab_cov (L1, L2))
print (my_ab_cov (L2, L1))
print (my_ab_cov (L3, L1))
print (my_ab_cov (L3, L2))
print (my_ab_cov (L4, L1))
print ()

d1, l1 = rfp_to_drdyck (L1.p, a1, b1)
D1 = DRDYCK (d1, l1)
d2, l2 = rfp_to_drdyck (L2.p, a1, b1)
D2 = DRDYCK (d2, l2)
d3, l3 = rfp_to_drdyck (L3.p, a1, b1)
D3 = DRDYCK (d3, l3)
d4, l4 = rfp_to_drdyck (L4.p, a1, b1)
D4 = DRDYCK (d4, l4)

print (my_ab_cov_dyck (D1, D2))
print (my_ab_cov_dyck (D2, D1))
print (my_ab_cov_dyck (D3, D1))
print (my_ab_cov_dyck (D3, D2))
print (my_ab_cov_dyck (D4, D1))
print ()

a2 = 3
b2 = 5
# limites : 1, 2, 4

L5 = ABFPP (a2, b2, [1, 3, 1])
L6 = ABFPP (a2, b2, [1, 4, 1])
L7 = ABFPP (a2, b2, [1, 4, 2])
L8 = ABFPP (a2, b2, [1, 2, 2])

print (my_ab_cov (L5, L6))
print (my_ab_cov (L6, L5))
print (my_ab_cov (L7, L5))
print (my_ab_cov (L7, L6))
print (my_ab_cov (L8, L5))
print ()

d5, l5 = rfp_to_drdyck (L5.p, a2, b2)
D5 = DRDYCK (d5, l5)
d6, l6 = rfp_to_drdyck (L6.p, a2, b2)
D6 = DRDYCK (d6, l6)
d7, l7 = rfp_to_drdyck (L7.p, a2, b2)
D7 = DRDYCK (d7, l7)
d8, l8 = rfp_to_drdyck (L8.p, a2, b2)
D8 = DRDYCK (d8, l8)

print (my_ab_cov_dyck (D5, D6))
print (my_ab_cov_dyck (D6, D5))
print (my_ab_cov_dyck (D7, D5))
print (my_ab_cov_dyck (D7, D6))
print (my_ab_cov_dyck (D8, D5))
print ()

a1 = 5
b1 = 3
a2 = 2
b2 = 5

L1 = list (generate_abfpp (a1, b1))

P1 = Poset ([L1, my_ab_cov])
print (len (P1.cover_relations ()))
print (P1.relations_number ())
print ()

L2 = []
for f in L1 :
    Df, lf = rfp_to_drdyck (f.p, a1, b1)
    R = DRDYCK (Df, lf)
    L2.append (R)

P2 = Poset ([L2, my_ab_cov_dyck])
print (len (P2.cover_relations ()))
print (P2.relations_number ())
print ()

L3 = list (generate_abfpp (a2, b2))

P3 = Poset ([L3, my_ab_cov])
print (len (P3.cover_relations ()))
print (P3.relations_number ())
print ()

L4 = []
for f in L3 :
    Df, lf = rfp_to_drdyck (f.p, a2, b2)
    R = DRDYCK (Df, lf)
    L4.append (R)

P4 = Poset ([L4, my_ab_cov_dyck])
print (len (P4.cover_relations ()))
print (P4.relations_number ())