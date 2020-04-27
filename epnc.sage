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
        print (pi1, sig1, "n'est pas une epnc")
        return False
    if not E2.is_epnc () :
        print (pi2, sig2, "n'est pas une pnc")
        return False

    if not couvre_pnc (pi1, pi2) :
        print (pi1, "ne couvre pas", pi2)
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
            print (S1, "n'est pas", S2)
            return False
    return True