from itertools import *
load rdyck.sage

def is_prim_rfp (L, a, b) :
    if gcd (a, b) != 1 :
        return False

    if len (L) != a :
        return False

    if sorted (L) != list (L) :
        return False

    for (i, e) in enumerate (L) :
        if e - 1 > b * i / a :
            return False

    return True

def is_rfp (L, a, b) :
    L2 = sorted (L)
    return is_prim_rfp (L2, a, b)

def generate_rfp (a, b) :
    if gcd (a, b) == 1 :
        L = [i for i in (1..b)]
        S = product (L, repeat = a)
        for e in S :
            if is_rfp (e, a, b) :
                yield e

def generate_prim_rfp (a, b) :
    if gcd (a, b) == 1 :
        g = generate_rfp (a, b)
        for e in g :
            if is_prim_rfp (e, a, b) :
                yield e

def prfp_to_rdyck (L, a, b) :
    if not is_prim_rfp (L, a, b) :
        return None

    w = []
    prec = 1
    tot0 = 0
    
    for e in L :
        diff = e - prec
        sub = [0] * diff + [1]
        w = w + sub
        prec = e
        tot0 = tot0 + diff

    prec = b - tot0
    w = w + [0] * prec

    D = RDYCK (a, b, w)
    return D

def rdyck_to_prfp (R) :
    if not R.is_rdyck () :
        return None

    a, b, w = R.a, R.b, R.p

    L = []
    cpt_left = 1

    for e in w :
        if e == 1 :
            L.append (cpt_left)
        else :
            cpt_left = cpt_left + 1

    return L, a, b

def rfp_to_drdyck (L, a, b) :
    if not is_rfp (L, a, b) :
        return None

    L2 = sorted (L)
    R = prfp_to_rdyck (L2, a, b)

    labels = []    
    n = len (L)
    for k in (1..b) :
        for (j, e) in enumerate (L) :
            if e == k :
                labels.append (j + 1)

    return R, labels

def drdyck_to_rfp (R, labels) :
    if not R.is_rdyck () :
        return None

    a, b, w = R.a, R.b, R.p

    L = []
    cpt_left = 1

    for e in w :
        if e == 1 :
            L.append (cpt_left)
        else :
            cpt_left = cpt_left + 1

    L2 = [0] * a
    
    for (i, e) in enumerate (labels) :
        L2 [e - 1] = L [i]

    return L2