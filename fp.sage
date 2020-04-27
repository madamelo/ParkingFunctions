load dpnc.sage

def is_fp (L) :
    L2 = sorted (L)
    for i, b in enumerate (L2) :
        if b > (i + 1) : 
            return False
    return True

def is_primitive (L) :
    if (is_fp (L)) :
        return (list (L) == sorted (L))
    return False

import itertools

def generate_fp (n) :
    for f in ParkingFunctions (n) :
        yield f

def generate_fpp (n) :
    for f in NonDecreasingParkingFunctions (n) :
        yield f

def couvre_fp (L1, L2) :
    S1 = sum (L1)
    S2 = sum (L2)
    return S1 >= S2 # NOT THAT
    return True #TODO

def perm_fp (P, L) :
    P2 = P.inverse ()
    R = []
    for i in range (len (L)) :
        R.append (L [P2 [i] - 1])
    return R

def dpnc_to_fp (D) :
    pi, rho, lam = D.pi, D.rho, D.lam
    if not D.is_dpnc () :
        print (pi, rho, lam, "n'est pas une dpnc")
        return False

    n = pi.base_set_cardinality ()
    L = [0] * n

    for i, B in enumerate (pi) :
        b = min (B)
        B2 = rho [lam [i]]
        for e in B2 :
            L [e -  1] = b
    return L