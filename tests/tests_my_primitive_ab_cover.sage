load ../code/my_primitive_ab_cover.sage

# TESTS MPABC
print ("Tests MP a,b - C")

a1 = 7
b1 = 3
# limites : 1, 1, 1, 2, 2, 3, 3

L1 = ABFPP (a1, b1, [1, 1, 1, 1, 2, 2, 3])
L2 = ABFPP (a1, b1, [1, 1, 1, 2, 2, 2, 3])
L3 = ABFPP (a1, b1, [1, 1, 1, 2, 2, 3, 3])
L4 = ABFPP (a1, b1, [1, 1, 1, 2, 2, 2, 2])

print (my_prim_ab_cov (L1, L2))
print (my_prim_ab_cov (L2, L1))
print (my_prim_ab_cov (L3, L1))
print (my_prim_ab_cov (L3, L2))
print (my_prim_ab_cov (L4, L1))
print ()

D1 = prfp_to_rdyck (L1.p, a1, b1)
D2 = prfp_to_rdyck (L2.p, a1, b1)
D3 = prfp_to_rdyck (L3.p, a1, b1)
D4 = prfp_to_rdyck (L4.p, a1, b1)

print (my_prim_ab_cov_dyck (D1, D2))
print (my_prim_ab_cov_dyck (D2, D1))
print (my_prim_ab_cov_dyck (D3, D1))
print (my_prim_ab_cov_dyck (D3, D2))
print (my_prim_ab_cov_dyck (D4, D1))
print ()

a2 = 3
b2 = 5
# limites : 1, 2, 4

L5 = ABFPP (a2, b2, [1, 1, 3])
L6 = ABFPP (a2, b2, [1, 1, 4])
L7 = ABFPP (a2, b2, [1, 2, 4])
L8 = ABFPP (a2, b2, [1, 2, 2])

print (my_prim_ab_cov (L5, L6))
print (my_prim_ab_cov (L6, L5))
print (my_prim_ab_cov (L7, L5))
print (my_prim_ab_cov (L7, L6))
print (my_prim_ab_cov (L8, L5))
print ()

D5 = prfp_to_rdyck (L5.p, a2, b2)
D6 = prfp_to_rdyck (L6.p, a2, b2)
D7 = prfp_to_rdyck (L7.p, a2, b2)
D8 = prfp_to_rdyck (L8.p, a2, b2)

print (my_prim_ab_cov_dyck (D5, D6))
print (my_prim_ab_cov_dyck (D6, D5))
print (my_prim_ab_cov_dyck (D7, D5))
print (my_prim_ab_cov_dyck (D7, D6))
print (my_prim_ab_cov_dyck (D8, D5))
print ()


L = list (generate_prim_rfp (a1, b1))
L1 = []
for e in L :
    f = ABFPP (a1, b1, e)
    L1.append (f)

P1 = Poset ([L1, my_prim_ab_cov])
print (len (P1.cover_relations ()))
print (P1.relations_number ())
print ()

L2 = []
for f in L :
    L2.append (prfp_to_rdyck (f, a1, b1))

P2 = Poset ([L2, my_prim_ab_cov_dyck])
print (len (P2.cover_relations ()))
print (P2.relations_number ())
print ()

L0 = list (generate_prim_rfp (a2, b2))
L3 = []
for e in L0 :
    f = ABFPP (a2, b2, e)
    L3.append (f)

P3 = Poset ([L3, my_prim_ab_cov])
print (len (P3.cover_relations ()))
print (P3.relations_number ())
print ()

L4 = []
for f in L0 :
    L4.append (prfp_to_rdyck (f, a2, b2))

P4 = Poset ([L4, my_prim_ab_cov_dyck])
print (len (P4.cover_relations ()))
print (P4.relations_number ())