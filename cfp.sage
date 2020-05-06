load fp.sage
load ddyck.sage

class CFP :
    C = []
    k = 0

    def __init__(self, C) :
        self.C = C
        self.k = len (C)
    
    def is_k_cfp (self, k0) :
        C = self.C
        k = self.k
        if k != k0 :
            return False
        
        for f in C : 
            if not is_fp (f) :
                return False

        for i in range (k - 1) :
            fi = C [i]
            fn = C [i + 1]
            if not couvre_fp (fn, fi) :
                return False
        
        return True

from itertools import *

def generate_cfp (n, k, l) :
    it = generate_fp (n)
    L = list (it)

    rmax = 0
    lr = [i for i in (1..n)]
    lrl = lr [n - l - 1 : ]
    for e in lrl :
        rmax = rmax + e - 1

    S = product (L, repeat = rmax)

    for s in S :
        C = CFP (s)

        if C.is_k_cfp (rmax) :
            L0 = [i for i in range (rmax)]
            LK = Subsets (L0, k)

            for lk in LK :
                c = []

                for e in lk :
                    c.append (s [e])

                fk = c [-1]
                if rank (fk) == l :
                    yield c