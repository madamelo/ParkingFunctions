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

def ranks (A, rp, rq) :
    if not A.is_abpnc () :
        return None
    
    b = A.b
    P =  A.P
    Q = A.Q
    SP = {}
    SQ = {}
    LP = []
    LQ = []

    for (i, bp) in enumerate (P) :
        m = min (bp)
        SP [m] = rp [i]

    for i in (1..b - 1) :
        if i in SP :
            LP.append (SP [i])
        else :
            LP.append (0)
    
    for (i, bq) in enumerate (Q) :
        m = max (bq)
        SQ [m] = rq [i]

    for i in (1..b - 1) :
        if i in SQ :
            LQ.append (SQ [i])
        else :
            LQ.append (0)
    
    L = [LP [0]]
    for i in range (b - 2) :
        m = max (LP [i + 1], LQ [i])
        L.append (m)
    L.append (LQ [-1])
    
    return L

def abpnc_to_rdyck (A, rp, rq) :
    if not A.is_abpnc () :
        return None

    a, b = A.a, A.b
    L = ranks (A, rp, rq)
    P = []

    for k in L :
        P = P + [1] * k + [0]

    R = RDYCK (a, b, P)
    if not R.is_rdyck () :
        return None
    
    return R

def couvre_block_abpnc (A, B1, B2) :
    if not A.is_abpnc () :
        return False
    
    P, Q = A.P, A.Q

    if B1 in P :
        min1 = min (B1)
        min2 = min (B2)
        max1 = max (B1)
        max2 = max (B2)

        if B2 in P and B1 != B2 :
            if min1 <= min2 <= max1 :
                if min1 <= max2 <= max1 :
                    return True
        
        elif B2 in Q :
            if min1 <= max2 <= max1 :
                return True
    
    elif B1 in Q :
        return (B1 == B2)
    
    return False

def rfn_p (P) :
    b = P.base_set_cardinality () + 1

    Parts = []

    for B in P :
        part = []
        for e in B :
            part.append (b - e)
        Parts.append (part)
    
    return SetPartition (Parts)

def rfn_q (Q) :
    b = Q.base_set_cardinality () + 1

    Parts = []

    for B in Q :
        part = []
        for e in B :
            if e == b - 1 :
                part.append (b - 1)
            else :
                part.append (b - e - 1)
        Parts.append (part)
    
    return SetPartition (Parts)

def rfn (A) :
    if not A.is_abpnc () :
        return None
    
    a, b = A.a, A.b
    P, Q = A.P, A.Q
    
    P2 = rfn_p (P)
    Q2 = rfn_q (Q)
    A2 = ABPNC (a, b, P2, Q2)

    return A2