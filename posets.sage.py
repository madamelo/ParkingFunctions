

# This file was *autogenerated* from the file posets.sage
from sage.all_cmdline import *   # import sage library

_sage_const_4 = Integer(4); _sage_const_3 = Integer(3); _sage_const_10 = Integer(10); _sage_const_7 = Integer(7); _sage_const_1 = Integer(1); _sage_const_0 = Integer(0)
sage.repl.load.load(sage.repl.load.base64.b64decode("cGVybS5zYWdl"),globals(),False)

print ("Perm")
P0 = Poset ([list (generate_perm (_sage_const_4 )), couvre_perm])
g0 = P0.plot ()
g0.save ('perm_poset_4.pdf')
print (P0.zeta_polynomial ())
print ()

sage.repl.load.load(sage.repl.load.base64.b64decode("cG5jLnNhZ2U="),globals(),False)

print ("PNC")
P1 = Poset ([list (generate_pnc (_sage_const_4 )), couvre_pnc])
g1 = P1.plot (label_elements = False)
g1.save ('pnc_poset_4.pdf')
print (P1.zeta_polynomial ())
print ()

sage.repl.load.load(sage.repl.load.base64.b64decode("ZHBuYy5zYWdl"),globals(),False)

print ("DPNC")
P2 = Poset ([list (generate_dpnc (_sage_const_3 )), couvre_dpnc])
g2 = P2.plot (label_elements = False)
g2.save ('dpnc_poset_3.pdf')
print (P2.zeta_polynomial ())
print ()

sage.repl.load.load(sage.repl.load.base64.b64decode("ZXBuYy5zYWdl"),globals(),False)

print ("EPNC")
P3 = Poset ([list (generate_epnc (_sage_const_3 )), couvre_epnc])
g3 = P3.plot (label_elements = False)
g3.save ('epnc_poset_3.pdf')
print (P3.zeta_polynomial ())
print ()

sage.repl.load.load(sage.repl.load.base64.b64decode("YWJwbmMuc2FnZQ=="),globals(),False)

print ("ABPNC")
a4 = _sage_const_10 
b4 = _sage_const_7 
p4 = [_sage_const_1 , _sage_const_1 , _sage_const_0 , _sage_const_1 , _sage_const_0 , _sage_const_1 , _sage_const_1 , _sage_const_0 , _sage_const_1 , _sage_const_1 , _sage_const_0 , _sage_const_1 , _sage_const_1 , _sage_const_0 , _sage_const_0 , _sage_const_1 , _sage_const_0 ]
R4 = RDYCK (a4, b4, p4)
P4, _ = P (R4)
Q4, _ = Q (R4)
A4 = ABPNC (a4, b4, P4, Q4)
L4 = list (P4) + list (Q4)

def cbapnc (B1, B2) :
    return couvre_block_abpnc (A4, B1, B2)

d4 = {}
for e in L4 :
    d4 [e] = list (e)

P4_ = Poset ([L4, cbapnc])
g4 = P4_.plot (element_labels = d4)
g4.save ('abpnc_block_poset.pdf')
print (P4_.zeta_polynomial ())
print ()

sage.repl.load.load(sage.repl.load.base64.b64decode("ZnAuc2FnZQ=="),globals(),False)

print ("FP")
P5 = Poset ([list (generate_fp (_sage_const_3 )), couvre_fp])
g5 = P5.plot (label_elements = False)
g5.save ('fp_poset_3.pdf')
print (P5.zeta_polynomial ())
print ()

sage.repl.load.load(sage.repl.load.base64.b64decode("ZWRlbG1hbi5zYWdl"),globals(),False)

print ("Edelman")
L6 = []
for k in (ellipsis_iter(_sage_const_1 ,Ellipsis,_sage_const_4 )) :
    tmp = generate_pnc_k (_sage_const_4 , k)
    L6 = L6 + list (tmp)
P6 = Poset ([L6, cov])
g6 = P6.plot (label_elements = False)
g6.save ('edelman_poset_4.pdf')
print (P6.zeta_polynomial ())

