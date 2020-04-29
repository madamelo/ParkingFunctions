load perm.sage

# Tests Perm
print ("Tests Perm")

L1 = [1, 5, 2, 4, 3]
L2 = [1, 3, 2, 4, 2]
print (is_perm (L1))
print (is_perm (L2))
print ()

Lc = [2, 5, 4, 1, 3]
print (is_cycle (L1))
print (is_cycle (Lc))
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

n = 4
g = generate_perm (n)
k = 0
for e in g :
    print (e)
    k = k + 1
print (k)
print (factorial (n))
print ()

L4 = [7, 3, 8, 5, 1, 2, 6, 4]
L5 = [1, 5, 2, 3, 4]
L6 = [1, 3, 2, 4, 5]
print (code (L4))
print (code (L1))
print (code (L5))
print (code (L6))
print ()

print (couvre_perm (L1, L6))
print (couvre_perm (L1, L5))