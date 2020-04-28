load perm.sage

# Tests Perm
print ("Tests Perm")

L1 = [1, 5, 2, 4, 3]
L2 = [1, 3, 2, 4, 2]
print (is_perm (L1))
print (is_perm (L2))
print ()

print (inv_perm (L1))
print ()

L3 = [5, 1, 3, 2, 4]
print (comp_perm (L1, L3))
print (comp_perm (L1, inv_perm (L1)))
print ()

R  = blocs_perm (L3)
for e in R :
    print (list (e))
print ()

L4 = [7, 3, 8, 5, 1, 2, 6, 4]
print (code (L4))