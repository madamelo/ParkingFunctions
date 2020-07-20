load my_primitive_cover.sage

# TESTS MPC
print ("Tests MPC")

L1 = [1, 1, 3, 4, 4, 5, 7]
L2 = [1, 1, 3, 4, 4, 6, 7]
L3 = [1, 2, 3, 4, 4, 6, 7]
L4 = [1, 2, 3, 4, 4, 4, 7]

print (my_prim_cov (L1, L2))
print (my_prim_cov (L2, L1))
print (my_prim_cov (L3, L1))
print (my_prim_cov (L3, L2))
print (my_prim_cov (L4, L1))
print ()

D1 = fpp_to_dyck (L1)
D2 = fpp_to_dyck (L2)
D3 = fpp_to_dyck (L3)
D4 = fpp_to_dyck (L4)

print (my_prim_cov_dyck (D1, D2))
print (my_prim_cov_dyck (D2, D1))
print (my_prim_cov_dyck (D3, D1))
print (my_prim_cov_dyck (D3, D2))
print (my_prim_cov_dyck (D4, D1))