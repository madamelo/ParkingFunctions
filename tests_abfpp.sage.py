

# This file was *autogenerated* from the file tests_abfpp.sage
from sage.all_cmdline import *   # import sage library

_sage_const_10 = Integer(10); _sage_const_7 = Integer(7); _sage_const_6 = Integer(6); _sage_const_3 = Integer(3); _sage_const_1 = Integer(1); _sage_const_4 = Integer(4); _sage_const_2 = Integer(2); _sage_const_5 = Integer(5); _sage_const_0 = Integer(0); _sage_const_9 = Integer(9); _sage_const_8 = Integer(8)
sage.repl.load.load(sage.repl.load.base64.b64decode("YWJmcHAuc2FnZQ=="),globals(),False)

# TESTS ABFPP
print ("Tests ABFPP")

a1 = _sage_const_10 
b1 = _sage_const_7 
p1 = [_sage_const_6 , _sage_const_3 , _sage_const_1 , _sage_const_4 , _sage_const_2 , _sage_const_7 , _sage_const_1 , _sage_const_3 , _sage_const_4 , _sage_const_5 ]
p2 = [_sage_const_6 , _sage_const_3 , _sage_const_1 , _sage_const_4 , _sage_const_2 , _sage_const_7 , _sage_const_1 , _sage_const_3 , _sage_const_4 , _sage_const_6 ]
A1 = ABFPP (a1, b1, p1)
A2 = ABFPP (a1, b1, p2)
print (A1.is_abfpp ())
print (A2.is_abfpp ())
print ()

a = _sage_const_3 
b = _sage_const_4 
g = generate_abfpp (a, b)
k = _sage_const_0 
for e in g :
    print (e.p)
    k = k + _sage_const_1 
print (k)
print (b**(a - _sage_const_1 ))
print ()

a = _sage_const_5 
b = _sage_const_4 
g = generate_abfpp (a, b)
k = len (list (g))
print (k)
print (b**(a - _sage_const_1 ))
print ()

sig1 = Permutation ([_sage_const_9 , _sage_const_4 , _sage_const_7 , _sage_const_8 , _sage_const_6 , _sage_const_2 , _sage_const_1 , _sage_const_5 , _sage_const_3 , _sage_const_10 ])
A3 = perm_abfpp (A1, sig1)
print (A3.p)
print (A3.is_abfpp ())
print ()

a4 = _sage_const_10 
b4 = _sage_const_7 
P4 = SetPartition ([[_sage_const_1 , _sage_const_2 ], [_sage_const_3 , _sage_const_6 ], [_sage_const_4 , _sage_const_5 ]])
fP4 = {_sage_const_0  : {_sage_const_3 , _sage_const_7 , _sage_const_10 }, _sage_const_1  : {_sage_const_1 , _sage_const_4 }, _sage_const_2  : {_sage_const_6 , _sage_const_8 , _sage_const_9 }}
Q4 = SetPartition ([[_sage_const_1 ], [_sage_const_2 , _sage_const_6 ], [_sage_const_3 , _sage_const_5 ], [_sage_const_4 ]])
fQ4 = {_sage_const_0  : {}, _sage_const_1  : {_sage_const_2 }, _sage_const_2  : {_sage_const_5 }, _sage_const_3  : {}}
AB = ABFP (a4, b4, P4, Q4, fP4, fQ4)
print (AB.is_abfp ())
A4 = abfp_to_abfpp (AB)
print (A4.p)
print (A4.is_abfpp ())
print ()

R4 = abfpp_to_rdyck (A1)
print (R4.p)
print (R4.is_rdyck ())
R4.pretty_print ()

