load fp.sage
load pnc.sage

class EFFPNC :
    sizes = None

    def __init__ (self, sizes) :
        self.sizes = sizes

    def is_eff_pnc (self) :
        sizes = self.sizes
        L = []

        for e in sizes :
            i = sizes [e]
            L = L + [e] * i

        return is_primitive (sorted (L)) 
    
    def to_pnc (self) :
        sizes = self.sizes
        s = 0
        for e in sizes :
            s = s + sizes [e]

        orphans = []
        missing = []

        for i in (1..s) :
            if i in sizes :
                missing.append (i)
            else :
                orphans.append (i)

        if len (missing) > 0 :
            last = 0
            for e in missing [ : : - 1] :
                if sizes [e] > 1 :
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
            nb = sizes [m] - 1
            bros [m] = orphans [ : nb]
            orphans = orphans [nb : ]
        
        Parts = []

        for i in missing :
            part = [i]
            for j in bros [i] :
                if j < i :
                    return None
                part.append (j)
            Parts.append (part)
    
        P = SetPartition (Parts)
        return P

def pnc_to_eff (P) :
    if not is_pnc (P) :
        return None

    sizes = {}

    for b in P :
        m = min (b)
        l = len (b)
        sizes [m] = l
    
    E = EFFPNC (sizes)
    return E

def couvre_eff_pnc (P1, P2) :
    if not P1.is_eff_pnc () :
        return False
    if not P2.is_eff_pnc () :
        return False

    S1 = P1.sizes
    S2 = P2.sizes

    not_in_2 = None
    diff_size = None

    for e in S2 :
        if e not in S1 :
            return False
        if S1 [e] != S2 [e] :
            if diff_size == None :
                diff_size = e
            else :
                return False

    if diff_size == None :
        return False

    for e in S1 :
        if e not in S2 :
            if not_in_2 == None :
                not_in_2 = e
            else :
                return False

    if not_in_2 == None :
        return False

    new_size = S1 [not_in_2] + S1 [diff_size]
    res = new_size == S2 [diff_size]
    return res

def Kreweras_eff (P)
    