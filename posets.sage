load perm.sage

print ("Perm")
P0 = Poset ([list (generate_perm (4)), couvre_perm])
g0 = P0.plot ()
g0.save ('perm_poset_4.pdf')
print (P0.zeta_polynomial ())
print ()

load pnc.sage

print ("PNC")
P1 = Poset ([list (generate_pnc (4)), couvre_pnc])
g1 = P1.plot (label_elements = False)
g1.save ('pnc_poset_4.pdf')
print (P1.zeta_polynomial ())
print ()

load dpnc.sage

print ("DPNC")
P2 = Poset ([list (generate_dpnc (3)), couvre_dpnc])
g2 = P2.plot (label_elements = False)
g2.save ('dpnc_poset_3.pdf')
print (P2.zeta_polynomial ())
print ()

load epnc.sage

print ("EPNC")
P3 = Poset ([list (generate_epnc (3)), couvre_epnc])
g3 = P3.plot (label_elements = False)
g3.save ('epnc_poset_3.pdf')
print (P3.zeta_polynomial ())
print ()

load abpnc.sage

print ("ABPNC")
a4 = 10
b4 = 7
p4 = [1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0]
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

load fp.sage

print ("FP")
P5 = Poset ([list (generate_fp (3)), couvre_fp])
g5 = P5.plot (label_elements = False)
g5.save ('fp_poset_3.pdf')
print (P5.zeta_polynomial ())


