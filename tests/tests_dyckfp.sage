load ../code/dyckfp.sage

# TESTS DYCKFP
print ("Tests DYCKFP")

L1 = [1, 1, 3, 3, 5, 6, 6, 6]
D1 = fpp_to_dyck (L1)
print (D1)
pretty_print_dfp (D1)
print ()

L2 = dyck_to_fpp (D1)
print (L1)
print (L2)
print ()

L3 = [6, 1, 5, 3, 1, 6, 6, 3]
D3 = fp_to_ddyck (L3)
D3.pretty_print ()
print ()

L4 = ddyck_to_fp (D3)
print (L3)
print (L4)
