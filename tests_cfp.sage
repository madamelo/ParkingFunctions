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
g1 = generate_strict_cfp (n, k, l)
lg1 = list (g1)
k1 = 0
for e in lg1 :
    print (e)
    k1 = k1 + 1
print ()
print (k1)
print ()

g2 = generate_weak_cfp (n, k, l)
lg2 = list (g2)
k2 = 0

lg_nodup = []
for e in lg2 :
    if e not in lg_nodup :
        lg_nodup.append (e)

for e in lg_nodup :
    print (e)
    k2 = k2 + 1
print ()

print (k2)
print (factorial (l) * binomial (k * n, l) * stirling_number2 (n, l + 1))