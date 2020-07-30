load ../code/rdyck.sage

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
print ()

R5 = transpose (R4)
R4.pretty_print ()
R5.pretty_print ()
print (R5.is_rdyck ())
print ()



p6 = [1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0]
R6 = RDYCK (a4, b4, p6)
print (R6.is_rdyck ())
R7 = rotr (R6)
R7.pretty_print ()
print (R7.is_rdyck ())
print ()

R8 = rotr (R4)
R8.pretty_print ()
print (R8.is_rdyck ())
print ()

p9 = [1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0]
R9 = RDYCK (a4, b4, p9)
print (R9.is_rdyck ())
R10 = rotr (R9)
R10.pretty_print ()
print (R10.is_rdyck ())
print ()

p11 = [1] * 10 + [0] * 7
R11 = RDYCK (a4, b4, p11)
print (R11.is_rdyck ())
R12 = rotr (R11)
R11.pretty_print ()
print (R11.is_rdyck ())
