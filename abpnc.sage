load pnc.sage
load rdyck.sage

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

def generate_mut (b) :
    g1 = generate_pnc (b - 1)
    g2 = generate_pnc (b - 1)

    for P in g1 :
        for Q in g2 :
            if mut_nc (P, Q) :
                yield (P, Q)


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

def generate_abpnc (a, b) :
    g = generate_rdyck (a, b)
    for e in g :
        p, lp = P (e)
        q, lq = Q (e)
        yield ABPNC (a, b, p, q), lp, lq

def abrot (A) :
    if not A.is_abpnc () :
        return None
    
    a, b = A.a, A.b
    P, Q = A.P, A.Q

    P2 = rot (P)
    Q2 = rot (Q)
    A2 = ABPNC (a, b, P2, Q2)
    return A2

def abrotb (A) :
    if not A.is_abpnc () :
        return None
    
    a, b = A.a, A.b
    P, Q = A.P, A.Q

    P2 = rotb (P)
    Q2 = rotb (Q)
    A2 = ABPNC (a, b, P2, Q2)
    return A2