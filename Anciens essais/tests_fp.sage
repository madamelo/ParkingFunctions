load fp.sage

# TESTS FP
print ("Tests FP")

L1 = [1, 2, 5, 6, 3, 3]
L2 = [3, 4, 1, 3]
L3 = [1, 2, 3, 3, 5, 6]
L4 = [1, 3, 3, 4, 4]
print (is_fp (L1))
print (is_fp (L2))
print (is_primitive (L1))
print (is_primitive (L3))
print (is_primitive (L4))
print ()

n = 4
g = generate_fp (n)
k = 0
while True :
    try :
        print (g.send (None))
        k = k + 1
    except :
        break
print (k)
print ((n + 1)^(n - 1))
print ()

g = generate_fpp (n)
k = 0
while True :
    try :
        print (g.send (None))
        k = k + 1
    except :
        break
print (k)
print (catalan_number (n))