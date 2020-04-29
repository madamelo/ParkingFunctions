load pnc.sage

class DPNC :
    pi = None
    rho = None
    lam = None

    def __init__(self, pi, rho, lam) :
        self.pi = pi
        self.rho = rho
        self.lam = lam
    
    def is_dpnc (self) :
        pi = self.pi
        rho = self.rho
        lam = self.lam
        if not is_pnc (pi) :
            return False
        c1 = pi.cardinality ()
        c2 = rho.cardinality ()
        if c1 != c2 :
            return False
        for i in range (c1) :
            n = len (pi [i])
            m = len (rho [lam [i]])
            if n != m :
                return False
        return True
    
    def rang (self) :
        return self.pi.cardinality () - 1

def generate_dpnc (n) :
    for pi in generate_pnc (n) :
        for rho in SetPartitions (n) :
            m = len (pi)
            for p in Permutations (m) :
                lam = { i : (p [i] - 1) for i in range(m) }
                tmp = DPNC (pi, rho, lam)
                if tmp.is_dpnc () :
                    yield tmp
    
def couvre_dpnc (D1, D2) :
    if not D1.is_dpnc () :
        return False
    if not D2.is_dpnc () :
        return False

    pi1, rho1, lam1 = D1.pi, D1.rho, D1.lam
    pi2, rho2, lam2 = D2.pi, D2.rho, D2.lam
    if not couvre_pnc (pi1, pi2) :
        return False
    if not couvre_part (rho1, rho2) :
        return False
    
    for i2, b2 in enumerate (pi2) :
        d = []
        for i1, b1 in enumerate (pi1) :
            if is_subset (b1, b2) : 
                d = d + list (rho1 [lam1 [i1]])
        d = sorted (d)
        if d != list (rho2 [lam2 [i2]]) :
            return False
    return True

def perm_dpnc (P, D) :
    pi, rho, lam = D.pi, D.rho, D.lam
    rho2 = rho.apply_permutation (P)
    lam2 = {}
    for i1, b1 in enumerate (pi) :
        r = rho [lam [i1]]
        tmp = SetPartition ([r]).apply_permutation (P) [0]
        for i2, b2 in enumerate (rho2) :
            if list (tmp) == list (b2) :
                lam2 [i1] = i2
    D2 = DPNC (pi, rho2, lam2)
    return D2