load eff_pnc.sage

# TESTS EFF_PNC
print ("Tests eff_pnc")

m1 = {1 : 3, 3 : 4, 7 : 1}
m2 = {2 : 3, 3 : 4, 8 : 1}
E1 = EFFPNC (m1)
E2 = EFFPNC (m2)
print (E1.is_eff_pnc ())
print (E2.is_eff_pnc ())
print ()

P1 = E1.to_pnc ()
P2 = E2.to_pnc ()
print (P1)
print (P2)
print ()

print (E1.sizes)
E3 = pnc_to_eff (P1)
print (E3.sizes)
print ()

m4 = {1 : 4, 3 : 4}
m5 = {1 : 8, 7 : 1}
E4 = EFFPNC (m4)
E5 = EFFPNC (m5)
print (couvre_eff_pnc (E1, E4))
print (couvre_eff_pnc (E4, E1))
print (couvre_eff_pnc (E1, E5))