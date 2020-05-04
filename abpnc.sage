load pnc.sage

def mut_nc (P, Q) :
    if not P.is_noncrossing () :
        return False
    if not Q.is_noncrossing () :
        return False
    
    for B1 in P :
        for B2 in Q :
            for a in B1 :
                for c in B1 :
                    for b in B2 :
                        for d in B2 :
                            if a < b < c < d :
                                return False
                            if a > b > c > d :
                                return False
    return True


class ABPNC :
    a = 0
    b = 0
    P = None
    Q = None

    def __init__ (self, a, b, P, Q) :
        self.a = a
        self.b = b
        self.P = P
        self.Q = Q
    
    def is_abpnc (self) :
        a, b, P, Q = self.a, self.b, self.P, self.Q

        if gcd (a, b) != 1 :
            return False
        
        np = P.base_set_cardinality ()
        nq = Q.base_set_cardinality ()
        if np != b - 1 :
            return False
        if nq != b - 1 :
            return False

        return mut_nc (P, Q)