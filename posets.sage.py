

# This file was *autogenerated* from the file posets.sage
from sage.all_cmdline import *   # import sage library

_sage_const_4 = Integer(4); _sage_const_3 = Integer(3)
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
