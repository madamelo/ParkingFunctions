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