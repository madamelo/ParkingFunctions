

# This file was *autogenerated* from the file tests_fp.sage
from sage.all_cmdline import *   # import sage library

_sage_const_1 = Integer(1); _sage_const_2 = Integer(2); _sage_const_5 = Integer(5); _sage_const_6 = Integer(6); _sage_const_3 = Integer(3); _sage_const_4 = Integer(4); _sage_const_7 = Integer(7); _sage_const_0 = Integer(0); _sage_const_9 = Integer(9); _sage_const_13 = Integer(13)
sage.repl.load.load(sage.repl.load.base64.b64decode("ZnAuc2FnZQ=="),globals(),False)

# TESTS FP
print ("Tests FP")

L1 = [_sage_const_1 , _sage_const_2 , _sage_const_5 , _sage_const_6 , _sage_const_3 , _sage_const_3 ]
L2 = [_sage_const_3 , _sage_const_4 , _sage_const_1 , _sage_const_3 ]
L3 = [_sage_const_1 , _sage_const_2 , _sage_const_3 , _sage_const_3 , _sage_const_5 , _sage_const_6 ]
L4 = [_sage_const_1 , _sage_const_3 , _sage_const_3 , _sage_const_4 , _sage_const_4 ]
print (is_fp (L1))
print (is_fp (L2))
print (is_primitive (L1))
print (is_primitive (L3))
print (is_primitive (L4))
print ()

print (rank (L1))
print (rank (L3))
print (rank ([_sage_const_1 , _sage_const_5 , _sage_const_4 , _sage_const_2 , _sage_const_2 , _sage_const_3 , _sage_const_6 , _sage_const_7 ]))
print ()

n = _sage_const_4 
g = generate_fp (n)
k = _sage_const_0 
for e in g :
    print (e)
    k = k + _sage_const_1 
print (k)
print ((n + _sage_const_1 )**(n - _sage_const_1 ))
print ()

g = generate_fpp (n)
k = _sage_const_0 
for e in g :
    print (e)
    k = k + _sage_const_1 
print (k)
print (catalan_number (n))
print ()

pnc1 = SetPartition ([[_sage_const_1 , _sage_const_2 , _sage_const_4 ], [_sage_const_3 ], [_sage_const_5 , _sage_const_6 ]])
F1 = pnc_to_fpp (pnc1)
print (F1)
print (is_primitive (F1))
print (pnc1)
print (fpp_to_pnc (F1))

P = Permutation ([_sage_const_2 , _sage_const_4 , _sage_const_1 , _sage_const_3 , _sage_const_6 , _sage_const_5 ])
print (perm_fp (P, L1))
print ()

pi = SetPartition ([{_sage_const_1 , _sage_const_4 , _sage_const_6 }, {_sage_const_2 , _sage_const_3 }, {_sage_const_5 }])
rho = SetPartition ([{_sage_const_1 , _sage_const_5 }, {_sage_const_2 }, {_sage_const_3 , _sage_const_4 , _sage_const_6 }])
lam = {_sage_const_0  : _sage_const_2 , _sage_const_1  : _sage_const_0 , _sage_const_2  : _sage_const_1 }
D = DPNC (pi, rho, lam)
print (dpnc_to_fp (D))
print ()

L5 = [_sage_const_5 , _sage_const_1 , _sage_const_1 , _sage_const_1 , _sage_const_2 , _sage_const_5 , _sage_const_4 , _sage_const_3 , _sage_const_3 , _sage_const_2 ]
D5 = fp_to_dpnc (L5)
print (D5.pi)
print (D5.rho)
print (D5.lam)
print (D5.is_dpnc ())
print ()

L6 = [_sage_const_1 , _sage_const_1 , _sage_const_5 , _sage_const_2 , _sage_const_3 , _sage_const_2 , _sage_const_1 , _sage_const_4 , _sage_const_9 , _sage_const_5 , _sage_const_1 , _sage_const_3 , _sage_const_13 , _sage_const_13 ]
D6 = fp_to_dpnc (L6)
print (D6.pi)
print (D6.rho)
print (D6.lam)
print (D6.is_dpnc ())
print ()

print (L6)
print (dpnc_to_fp (D6))
print ()

L7 = dpnc_to_fp (D)
print (L7)
D7 = fp_to_dpnc (L7)
print (D.pi, D7.pi)
print (D.rho, D7.rho)
print (D.lam, D7.lam)
print ()

pi8 = SetPartition ([{_sage_const_1 , _sage_const_4 , _sage_const_5 }, {_sage_const_2 , _sage_const_3 }])
rho8 = SetPartition ([{_sage_const_1 , _sage_const_3 , _sage_const_5 }, {_sage_const_2 , _sage_const_4 }])
lam8 = {_sage_const_0  : _sage_const_0 , _sage_const_1  : _sage_const_1 }
D8 = DPNC (pi8, rho8, lam8)
L8 = dpnc_to_fp (D8)

pi9 = SetPartition ([{_sage_const_1 , _sage_const_5 }, {_sage_const_2 , _sage_const_3 }, {_sage_const_4 }])
rho9 = SetPartition ([{_sage_const_1 }, {_sage_const_2 , _sage_const_4 }, {_sage_const_3 , _sage_const_5 }])
lam9 = {_sage_const_0  : _sage_const_2 , _sage_const_1  : _sage_const_1 , _sage_const_2  : _sage_const_0 }
D9 = DPNC (pi9, rho9, lam9)
L9 = dpnc_to_fp (D9)

lam10 = {_sage_const_0  : _sage_const_1 , _sage_const_1  : _sage_const_2 , _sage_const_2  : _sage_const_0 }
D10 = DPNC (pi9, rho9, lam10)
L10 = dpnc_to_fp (D10)
print (couvre_fp (L9, L8))
print (couvre_fp (L10, L8))

