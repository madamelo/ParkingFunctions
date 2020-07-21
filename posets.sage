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

print ("ABPNC : Cas Fuß - Catalan")
a4_ = 15
b4_ = 7
p4_ = [1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0,
       1, 1, 1, 0, 1, 0]
R4_ = RDYCK (a4_, b4_, p4_)
P4_, _ = P (R4_)
Q4_, _ = Q (R4_)
A4_ = ABPNC (a4_, b4_, P4_, Q4_)
L4_ = list (P4_) + list (Q4_)

d4_ = {}
for e in L4_ :
    d4_ [e] = list (e)

P4__ = Poset ([L4_, cbapnc])
g4_ = P4__.plot (element_labels = d4_)
g4_.save ('abpnc_block_poset_FC.pdf')
print (P4__.zeta_polynomial ())
print ()

load fp.sage

print ("FP")
P5 = Poset ([list (generate_fp (3)), couvre_fp])
g5 = P5.plot (label_elements = False)
g5.save ('fp_poset_3.pdf')
print (P5.zeta_polynomial ())
print ()

load edelman.sage

print ("Edelman")
L6 = []
for k in (1..4) :
    tmp = generate_pnc_k (4, k)
    L6 = L6 + list (tmp)
P6 = Poset ([L6, cov])
g6 = P6.plot (label_elements = False)
g6.save ('edelman_poset_4.pdf')
print (P6.zeta_polynomial ())
print ("---")

P7 = Poset ([list (generate_pnc_k_div (3, 2)), cov])
g7 = P7.plot (label_elements = False)
g7.save ('edelman_2div_poset_3.pdf')
print (P7.zeta_polynomial ())
print ()

load my_primitive_cover.sage

print ("My primitive PF cover")

P8 = Poset ([list (generate_fpp (4)), my_prim_cov])
g8 = P8.plot ()
g8.save ('MPC_poset_4.pdf')
print (P8.zeta_polynomial ())
print ('---')
print (len (P8.cover_relations ()))
print ('---')
print (P8.relations_number ())
print ()

print ("My Dyck cover")
L9 = []
for f in generate_fpp (4) :
    L9.append (DyckWord (fpp_to_dyck (f)))
P9 = Poset ([L9, my_prim_cov_dyck])
g9 = P9.plot ()
g9.save ('MPCD_poset_4.pdf')
print (P9.zeta_polynomial ())
print ('---')
print (len (P9.cover_relations ()))
print ('---')
print (P9.relations_number ())
print ()

load my_cover.sage

print ("My PF cover")

P10 = Poset ([list (generate_fp (5)), my_cov])
g10 = P10.plot ()
g10.save ('MC_poset_4.pdf')
print (P10.zeta_polynomial ())
print ('---')
print (len (P10.cover_relations ()))
print ('---')
print (P10.relations_number ())
print ()

print ("My decorated Dyck cover")
L11 = []
for f in generate_fp (4) :
    L11.append (fp_to_ddyck (f))
#P11 = Poset ([L11, my_cov_ddyck])
#g11 = P11.plot ()
#g11.save ('MCD_poset_4.pdf')
#print (P11.zeta_polynomial ())
print ('---')
#print (len (P11.cover_relations ()))
print ('---')
#print (P11.relations_number ())
print ()
