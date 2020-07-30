load ../code/ddyck.sage

# TESTS DDYCK
print ("Tests DDYCK")

W1 = [1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0]
W2 = [1, 0, 0, 1]
L1 = [1, 9, 3, 5, 7, 2, 10, 4, 6, 8]
L2 = [1, 2]
dd1 = DDYCK (W1, L1)
dd2 = DDYCK (W2, L2)
print (dd1.is_ddyck ())
print (dd2.is_ddyck ())
print ()

P3 = ParkingFunction ([1, 3, 2, 6, 2, 8, 2, 10, 1, 4])
dd3 = fp_to_ddyck (P3)
dd3.pretty_print ()
print ()

dd3.flat_print ()
print ()

print (blocks (dd3))
print (ddyck_to_fp (dd3))
print ()

print (dd3.to_list ())
print ()

L4 = [1, 2, 1, 2, 1]
L5 = [4, 2, 1, 2, 1]
L6 = [4, 1, 2, 1, 2]

dd4 = fp_to_ddyck (L4)
dd5 = fp_to_ddyck (L5)
dd6 = fp_to_ddyck (L6)
print (couvre_ddyck (dd5, dd4))
print (couvre_ddyck (dd4, dd5))
print (couvre_ddyck (dd6, dd4))
