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

n = 4
k = 2
l = 4
g = generate_cfp (n, k, l)
kt = 0
for e in g :
    print (e)
    kt = kt + 1
print (kt)
#fm = 1 / (l + 1) * binomial (k * n, l) * sum (i, 0, l + 1, (-1)^i * binomial (l + 1, i) * (l + 1 - i)^n)
#print (fm) TODO