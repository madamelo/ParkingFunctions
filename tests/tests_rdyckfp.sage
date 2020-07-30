load ../code/rdyckfp.sage

a1 = 5
b1 = 8
L1 = [1, 2, 4, 4, 7]
L2 = [1, 2, 4, 6, 7]
L3 = [4, 7, 1, 4, 2]
L4 = [4, 7, 1, 6, 2]
print (is_prim_rfp (L1, a1, b1))
print (is_prim_rfp (L2, a1, b1))
print (is_rfp (L3, a1, b1))
print (is_rfp (L4, a1, b1))
print ()

a = 3
b = 5
g = generate_rfp (a, b)
k = 0
for e in g :
    print (e)
    k = k + 1
print ()
print (k)
print (b^ (a - 1))
print ()

g = generate_prim_rfp (a, b)
k = 0
for e in g :
    print (e)
    k = k + 1
print ()
print (k)
tmp = factorial (a + b - 1) / factorial (a)
tmp = tmp / factorial (b)
print (tmp)
print ()

D5 = prfp_to_rdyck (L1, a1, b1)
D5.pretty_print ()

L5 = rdyck_to_prfp (D5)
print (L1)
print (L5)
print ()

D6, l6 = rfp_to_drdyck (L3, a1, b1)
print (l6)
D6.pretty_print ()

L6 = drdyck_to_rfp (D6, l6)
print (L3)
print (L6)
