load fp.sage

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

def generate_cfp (n, k, l) :
    it = generate_fp (n)
    L = []
    for e in it :
        L.append (e)
    S = Subsets (L, k)
    for s in S :
        for p in Permutations (s) :
            c = CFP (p) 
            fk = c.C [k - 1]
            if max (fk) == l : #NOT THAT
                if c.is_k_cfp (k) :
                    yield p