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
    t = (i for i in (1..n))
    L = itertools.product (t, repeat = n)
    for e in L :
        if is_fp (e) :
            yield list (e)

def generate_fpp (n) :
    t = (i for i in (1..n))
    L = itertools.product (t, repeat = n)
    for e in L :
        if is_primitive (e) :
            yield list (e)

def couvre_fp (L1, L2) :
    return True
