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
