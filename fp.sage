load pnc.sage
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

def rank (L) :
    if not is_fp (L) :
        return None

    n = len (L)
    s = 0
    for i in (1..n) :
        if i in L :
            s = s + 1
    
    return s - 1

import itertools

def generate_fp (n) :
    for f in ParkingFunctions (n) :
        yield f

def generate_fpp (n) :
    for f in NonDecreasingParkingFunctions (n) :
        yield f

def pnc_to_fpp (P) :
    if not is_pnc (P) :
        return None
    
    n = P.base_set_cardinality ()
    L = [0] * n

    for p in P :
        m = min (p)
        np = len (p)
        L [m - 1] = np
    
    F = []
    for i, e in enumerate (L) :
        F = F + [i + 1] * e
    
    return F

def fpp_to_pnc (L) :
    if not is_primitive (L) :
        return None

    n = len (L)
    for p in generate_pnc (n) :
        F = pnc_to_fpp (p)
        if F == L :
            return p

def perm_fp (P, L) :
    P2 = P.inverse ()
    R = []
    for i in range (len (L)) :
        R.append (L [P2 [i] - 1])
    return R

def dpnc_to_fp (D) :
    pi, rho, lam = D.pi, D.rho, D.lam
    if not D.is_dpnc () :
        return None

    n = pi.base_set_cardinality ()
    L = [0] * n

    for i, B in enumerate (pi) :
        b = min (B)
        B2 = rho [lam [i]]
        for e in B2 :
            L [e -  1] = b
    return L

def fp_to_dpnc (L) :
    if not is_fp (L) :
        return None
    
    n = len (L)

    labels = []

    for i in range (n) :
        lab = []
        for j, e in enumerate (L) :
            if e == i + 1 :
                lab.append (j + 1)
        labels.append (lab)
    
    orphans = []
    missing = []
    miss_nb = {}
    for i in range (n) :
        lab = labels [i]
        ll = len (lab)
        if ll == 0 :
            orphans.append (i + 1)
        else :
            missing.append (i + 1)
            miss_nb [i + 1] = ll - 1
    
    if len (missing) > 0 :
        last = 0
        for e in missing [ : : - 1] :
            if miss_nb [e] > 0 :
                last = e
                break
        idx = 0

        for io, o in enumerate (orphans) :
            if o > last :
                idx = io
                break

        orphans = orphans [idx : ] + orphans [ : idx]

    bros = {}
    for m in missing [ : : - 1] :
        nb = miss_nb [m]
        bros [m] = orphans [ : nb]
        orphans = orphans [nb : ]
    
    Parts_pi = []
    Parts_rho = []

    for i in missing :
        part = [i]
        for j in bros [i] :
            part.append (j)
        Parts_pi.append (part)
        Parts_rho.append (labels [i - 1])
    
    pi = SetPartition (Parts_pi)
    rho = SetPartition (Parts_rho)
    
    lam = {}
    for ep, er in zip (Parts_pi, Parts_rho) :
        idp = pi.index (set (ep))
        idr = rho.index (set (er))
        lam [idp] = idr

    D = DPNC (pi, rho, lam)
    return D

def couvre_fp (L1, L2) :
    if not is_fp (L1) :
        return False
    if not is_fp (L2) :
        return False
    
    if L1 == L2 :
        return True
    
    D1 = fp_to_dpnc (L1)
    D2 = fp_to_dpnc (L2)

    res = couvre_dpnc (D1, D2)
    return res