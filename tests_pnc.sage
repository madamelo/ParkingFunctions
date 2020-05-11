load pnc.sage

# TESTS PNC
print ("Tests PNC")

P1 = SetPartition ([{1, 5}, {2}, {3, 4}])
P2 = SetPartition ([{1, 3, 4}, {2}, {5}])
P3 = SetPartition ([{1, 3, 4}, {2, 5}])
print (is_pnc (P1))
print (is_pnc (P2))
print (is_pnc (P3))
print ()

n = 5
g = generate_pnc (n)
k = 0
for e in g :
    print (e)
    k = k + 1
print (k)
print (catalan_number (n))
print ()

P4 = SetPartition ([{1, 4}, {2}, {3}, {5}])
P5 = SetPartition ([{1, 2, 3, 4}, {5}])
print (couvre_pnc (P4, P2))
print (couvre_pnc (P4, P3))
print (couvre_pnc (P4, P5))
print (couvre_pnc (P4, P4))
print ()

print (pnc_to_perm (P1))
print ()

print (Kreweras (P1))
print ()

print (label (P4, P2))
print ()

tmp = P1
for i in range (5) :
    print (rot (tmp))
    tmp = rot (tmp)
print ()

tmp = P1
for i in range (5) :
    print (Kreweras (Kreweras (tmp)), rotb (tmp))
    tmp = rotb (tmp)
print ()

print (P1)
print (rot (rotb (P1)))
print (rotb (rot (P1)))