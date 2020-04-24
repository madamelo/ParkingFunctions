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
    return True
