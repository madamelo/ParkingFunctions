load cfp.sage

# TESTS CFP
print ("Tests CFP")

f1 = ParkingFunction ([5, 4, 1, 1, 3, 5])
f2 = ParkingFunction ([2, 1, 3, 3, 4, 6])
f3 = ParkingFunction ([5, 3, 4, 1, 2, 6])
L1 = [f1, f2, f3]
L2 = [f3, f1]
C1 = CFP (L1)
C2 = CFP (L2)
print (C1.is_k_cfp (3))
print (C1.is_k_cfp (2))
print (C2.is_k_cfp (2))
print ()

n = 3
k = 2
l = 2
g = generate_cfp (n, k, l)
lg = list (g)
lg_nodup = []
for e in lg :
    if e not in lg_nodup :
        lg_nodup.append (e)

kt = 0
for e in lg_nodup :
    print (e)
    kt = kt + 1
print ()

print (kt)
print (factorial (l) * binomial (k * n, l) * stirling_number2 (n, l + 1))