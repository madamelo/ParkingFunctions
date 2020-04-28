load ddyck.sage

# TESTS DDYCKFPT
print ("Tests DDYCK")

W1 = [1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0]
W2 = [1, 0, 0, 1]
L1 = [1, 9, 3, 5, 7, 2, 10, 4, 6, 8]
L2 = [1, 2]
dd1 = DDYCK (W1, L1)
dd2 = DDYCK (W2, L2)
print (dd1.is_ddyck ())
print (dd2.is_ddyck ())

P3 = ParkingFunction ([1, 3, 2, 6, 2, 8, 2, 10, 1, 4])
dd3 = fp_to_ddyck (P3)
dd3.pretty_print ()
print (blocks (dd3))
print (ddyck_to_fp (dd3))

print (dd3.to_list ())

W4 = [1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0]
L4 = [1, 9, 3, 5, 2, 7, 10, 4, 6, 8]
dd4 = DDYCK (W4, L4)
dd5 = DDYCK (W1, L4)
dd6 = DDYCK (W4, L1)
print (couvre_ddyck (dd1, dd4))
print (couvre_ddyck (dd1, dd5))
print (couvre_ddyck (dd1, dd6))
print (couvre_ddyck (dd6, dd1))