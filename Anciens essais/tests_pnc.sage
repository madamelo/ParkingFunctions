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
while True :
    try :
        print (g.send (None))
    except :
        break
print (catalan_number (n))
print ()

P4 = SetPartition ([{1, 4}, {2}, {3}, {5}])
print (couvre_pnc (P4, P2))
print (couvre_pnc (P4, P3))
print ()

print (pnc_to_perm (P1))
print ()

print (Kreweras (P1))