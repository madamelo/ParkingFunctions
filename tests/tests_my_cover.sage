load ../code/my_cover.sage

# TESTS MC
print ("Tests MC")

L1 = [5, 1, 3, 7, 4, 1, 4]
L2 = [6, 1, 3, 7, 4, 1, 4]
L3 = [6, 2, 3, 7, 4, 1, 4]
L4 = [4, 2, 3, 7, 4, 1, 4]
L5 = [4, 2, 2, 7, 4, 1, 4]

print (my_cov (L1, L2))
print (my_cov (L2, L1))
print (my_cov (L3, L1))
print (my_cov (L3, L2))
print (my_cov (L4, L1))
print (my_cov (L4, L5))
print ()

print (correctly_inserted ([3, 5, 6], [3, 4, 5, 6], 4))
print (correctly_inserted ([3, 5, 6], [3, 5, 4, 6], 4))
print ()

D1 = fp_to_ddyck (L1)
D2 = fp_to_ddyck (L2)
D3 = fp_to_ddyck (L3)
D4 = fp_to_ddyck (L4)
D5 = fp_to_ddyck (L5)
print (D1.to_list ())
print (D2.to_list ())
print (D3.to_list ())
print (D4.to_list ())
print (D5.to_list ())
print ()

print (my_cov_ddyck (D1, D2))
print (my_cov_ddyck (D2, D1)) #case 3
print (my_cov_ddyck (D3, D1))
print (my_cov_ddyck (D3, D2)) #case 1
print (my_cov_ddyck (D4, D1))
print (my_cov_ddyck (D4, D5)) #case 2
print ()

L = list (generate_fp (5))
P1 = Poset ([L, my_cov])
print (len (P1.cover_relations ()))
print (P1.relations_number ())
print ()

L2 = []
for f in L :
    L2.append (fp_to_ddyck (f))

P2 = Poset ([L2, my_cov_ddyck])
print (len (P2.cover_relations ()))
print (P2.relations_number ())
