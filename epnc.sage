load pnc.sage
load dpnc.sage

class EPNC :
    pi = None
    sig = None

    def __init__(self, pi, sig) :
        self.pi = pi
        self.sig = sig
    
    def is_epnc (self) :
        pi = self.pi
        sig = self.sig
        if not is_pnc (pi) :
            return False
        c = pi.base_set_cardinality ()
        n = len (sig)
        if c != n :
            return False
        for b in pi :
            prev = None
            for i, e in enumerate (b) :
                if prev != None :
                    if sig [prev - 1] > sig [e - 1] :
                        return False
                prev = e
        return True
    
    def rang (self) :
        return len (self.pi) - 1

def generate_epnc (n) :
    for pi in generate_pnc (n) :
        for sig in Permutations (n) :
            tmp = EPNC (pi, sig)
            if tmp.is_epnc () :
                yield tmp

def couvre_epnc (E1, E2) :
    pi1, sig1 = E1.pi, E1.sig
    pi2, sig2 = E2.pi, E2.sig

    if not E1.is_epnc () :
        return False
    if not E2.is_epnc () :
        return False

    if not couvre_pnc (pi1, pi2) :
        return False

    s = {}
    for i, b2 in enumerate (pi2) :
        s [i] = []
        for b1 in pi1 :
            if is_subset (b1, b2) :
                for e in b1 :
                   s [i].append (sig1 (e))
        L = []
        for e in b2 :
            L.append (sig2 (e))

        S1 = set (s [i])
        S2 = set (L)
        if S1 != S2 :
            return False
    return True

def dpnc_to_epnc (D) :
    pi, rho, lam = D.pi, D.rho, D.lam
    n = pi.base_set_cardinality ()
    L = [0] * n
    for i, b1 in enumerate (pi) :
        b2 = rho [lam [i]]
        L1 = sorted (list (b1))
        L2 = sorted (list (b2))
        for j in range (len (L1)) :
            idx = L1  [j] - 1
            L [idx] = L2 [j]
    P = Permutation (L)
    return EPNC (pi, P)

def epnc_to_dpnc (E) :
    pi, sig = E.pi, E.sig
    R = []
    lam = {}
    for b in pi :
        r = []
        for e in b :
            r.append (sig [e - 1])
        R.append (r)
    rho = SetPartition (R)
    for i, b in enumerate (R) :
        for irho, brho in enumerate (rho) :
            if sorted (b) == sorted (brho) :
                lam [i] = irho
    return DPNC (pi, rho, lam)

def epnc_label (E1, E2) :
    if not couvre_epnc (E1, E2) :
        return None

    pi, sig = E1.pi, E1.sig
    rho, tau = E2.pi, E2.sig

    gamma = code (sig)
    tr = label (pi, rho)
    return (gamma, tr)

def precede_label (E, E1, E2) :
    if not couvre_epnc (E1, E) :
        return False
    if not couvre_epnc (E2, E) :
        return False
    
    g1, t1 = epnc_label (E1, E)
    g2, t2 = epnc_label (E2, E)

    if str (g1) >= str (g2) :
        return False

    if str (t1) >= str (t2) :
        return False
    
    return True

