load abfp.sage

# TESTS ABFP
print ("TESTS ABFP")

a1 = 10
b1 = 7
P1 = SetPartition ([[1, 2], [3, 6], [4], [5]])
Q1 = SetPartition ([[1], [2, 6], [3, 4, 5]])
fP1 = {0 : {1, 7}, 1 : {2, 3}, 2 : {5, 9}, 3 : {4, 6}}
fQ1 = {0 : {10}, 1 : {8}, 2 : {}}
fP2 = {0 : {1, 7}, 1 : {2, 3, 5}, 2 : {9}, 3 : {4, 6}}
A1 = ABFP (a1, b1, P1, Q1, fP1, fQ1)
A2 = ABFP (a1, b1, P1, Q1, fP2, fQ1)
print (A1.is_abfp ())
print (A2.is_abfp ())