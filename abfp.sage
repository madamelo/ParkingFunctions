load abpnc.sage

class ABFP :
    a = 0
    b = 0
    P = None
    Q = None
    fP = None
    fQ = None

    def __init__ (self, a, b, P, Q, fP, fQ) :
        self.a = a
        self.b = b
        self.P = P
        self.Q = Q
        self.fP = fP
        self.fQ = fQ
    
    def is_abfp (self) :
        a, b = self.a, self.b
        P, Q = self.P, self.Q
        fP, fQ = self.fP, self.fQ

        if gcd (a, b) != 1 :
            return False
        
        if len (fP) != len (P) :
            return False
        if P.base_set_cardinality () != b - 1 :
            return False
        
        if len (fQ) != len (Q) :
            return False
        if Q.base_set_cardinality () != b - 1 :
            return False
        
        s = []

        for e in fP :
            s = s + list (fP [e])
        for e in fQ :
            s = s + list (fQ [e])

        s = sorted (s)
        L = [i for i in (1..a)]
        if s != L :
            return False

        rp = {}
        for i, _ in enumerate (P) :
            rk = len (fP [i])
            rp [i] = rk
        rq = {}
        for i, _ in enumerate (Q) :
            rk = len (fQ [i])
            rq [i] = rk
        
        A = ABPNC (a, b, P, Q)
        res = is_rank_abpnc (A, rp, rq)
        return res

def sp_emp (L, n) :
    for i in (1..len (L)) :
        S = SetPartitions (L, i)
        for s in S :
            s_ = list (s)
            ls = [0] * i
            for perm in Permutations (i) :
                for ie, e in enumerate (perm) :
                    ls [ie] = s_ [e - 1]
                
                mq = n - i
                if mq > 0 :
                    Lid = [j for j in range (n)]
                    Lids = Subsets (Lid, mq)
                    for ids in Lids :
                        k = 0
                        p = []
                        for l in range (n) :
                            if l in ids :
                                p.append ({})
                            else :
                                p.append (ls [k])
                                k = k + 1
                        yield p
                else :
                    yield ls

def generate_abfp (a, b) :
    g = list (generate_mut (b))
    L = [i for i in (1..a)]

    for P, Q in g :
        nbp = len (P) + len (Q)

        S = list (sp_emp (L, nbp))

        for s in S :
            ls = s
            j = 0

            fP = {}
            for i, _ in enumerate (P) :
                fP [i] = list (ls [j])
                j = j + 1
            
            fQ = {}
            for i, _ in enumerate (Q) :
                fQ [i] = list (ls [j])
                j = j + 1

            A = ABFP (a, b, P, Q, fP, fQ)
            if A.is_abfp () :
                yield A