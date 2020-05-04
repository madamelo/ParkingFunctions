load rdyck.sage

# Tests RDYCK
print ("Tests RDYCK")

a1 = 7
b1 = 5
p1 = [1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0]
p2 = [1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1]
p3 = [1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0]
R1 = RDYCK (a1, b1, p1)
R2 = RDYCK (a1, b1, p2)
R3 = RDYCK (a1, b1, p3)
print (R1.is_rdyck ())
print (R2.is_rdyck ())
print (R3.is_rdyck ())
print ()

R1.pretty_print ()
print ()

print (R1.rdyck_coord ())
print ()

a = 5
b = 4
g = generate_rdyck (a, b)
k = 0
for e in g :
    print (e.p)
    k = k + 1
print (k)
print ((1 / (a + b)) * binomial (a + b, a))
print ()

print (R1.rdyck_to_list ())
print ()

print (parcours (R1))
print ()

print (vallees (R1))
print ()

a4 = 10
b4 = 7
p4 = [1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0]
pt = (2, 3)
R4 = RDYCK (a4, b4, p4)
print (laser (R4, pt))
print (lasers (R4))
print ()

print (hauteurs (R4))
print ()

print (P (R4))
print (Q (R4))