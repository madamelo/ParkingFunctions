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
    return True #TODO