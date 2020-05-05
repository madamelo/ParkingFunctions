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
    g1 = list (generate_pnc (b - 1))
    g2 = list (generate_pnc (b - 1))

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
    g = list (generate_rdyck (a, b))
    for e in g :
        p, lp = P (e)
        q, lq = Q (e)
        yield ABPNC (a, b, p, q), lp, lq

def rot_bloc (B, b) :
    res = []
    for e in B :
        if e == b :
            res.append (1)
        else :
            res.append (e + 1)
    return set (res)

def rotb_bloc (B, b) :
    res = []
    for e in B :
        if e == 1 :
            res.append (b)
        else :
            res.append (e - 1)
    return set (res)

def abrot (A, rp, rq) :
    if not A.is_abpnc () :
        return None
    
    a, b = A.a, A.b
    P, Q = A.P, A.Q

    P2 = rot (P)
    Q2 = rot (Q)

    rp2 = {}
    for i, bp in enumerate (P) :
        for j, bp2 in enumerate (P2) :
            if rot_bloc (bp, b - 1) == bp2 :
                rp2 [j] = rp [i]
                break
    
    rq2 = {}
    for i, bq in enumerate (Q) :
        for j, bq2 in enumerate (Q2) :
            if rot_bloc (bq, b - 1) == bq2 :
                rq2 [j] = rq [i]
                break

    A2 = ABPNC (a, b, P2, Q2)
    return A2, rp2, rq2

def abrotb (A, rp, rq) :
    if not A.is_abpnc () :
        return None
    
    a, b = A.a, A.b
    P, Q = A.P, A.Q

    P2 = rotb (P)
    Q2 = rotb (Q)

    rp2 = {}
    for i, bp in enumerate (P) :
        for j, bp2 in enumerate (P2) :
            if rotb_bloc (bp, b - 1) == bp2 :
                rp2 [j] = rp [i]
                break
    
    rq2 = {}
    for i, bq in enumerate (Q) :
        for j, bq2 in enumerate (Q2) :
            if rotb_bloc (bq, b - 1) == bq2 :
                rq2 [j] = rq [i]
                break

    A2 = ABPNC (a, b, P2, Q2)
    return A2, rp2, rq2

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

        if B2 in P:
            if min1 <= min2 <= max1 :
                if min1 <= max2 <= max1 :
                    return True
        
        elif B2 in Q :
            if min1 <= max2 <= max1 :
                return True
    
    elif B1 in Q :
        return (B1 == B2)
    
    return False

def rfn_p (P, rp) :
    b = P.base_set_cardinality () + 1

    Parts = []

    for B in P :
        part = []
        for e in B :
            part.append (b - e)
        Parts.append (part)
    
    S = SetPartition (Parts)
    rps = {}
    for i, p in enumerate (Parts) :
        j = S.index (set (p))
        rps [j] = rp [i]
    
    return S, rps

def rfn_q (Q, rq) :
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
    
    S = SetPartition (Parts)
    rqs = {}
    for i, p in enumerate (Parts) :
        j = S.index (set (p))
        rqs [j] = rq [i]
    
    return S, rqs

def rfn (A, rp, rq) :
    if not A.is_abpnc () :
        return None
    
    a, b = A.a, A.b
    P, Q = A.P, A.Q
    
    P2, rp2 = rfn_p (P, rp)
    Q2, rq2 = rfn_q (Q, rq)
    A2 = ABPNC (a, b, P2, Q2)

    return A2, rp2, rq2

def rank_cond (A, rp, rq, B) :
    if not A.is_abpnc () :
        return False

    a, b = A.a, A.b
    P, Q = A.P, A.Q

    if B not in P :
        return False
    
    e1 = (max (B) - min (B) + 1) * (a / b)

    e2 = 0
    for i, B2 in enumerate (P) :
        if couvre_block_abpnc (A, B, B2) :
            e2 = e2 + rp [i]
    for i, B2 in enumerate (Q) :
        if couvre_block_abpnc (A, B, B2) :
            e2 = e2 + rq [i]

    e3 = e1 + (a / b)
    return e1 <= e2 <= e3

def is_rank_abpnc (A, rp, rq) :
    if not A.is_abpnc () :
        return False
    
    a, b = A.a, A.b
    P, Q = A.P, A.Q

    sump = 0
    for (i, B) in enumerate (P) :
        if i not in rp :
            return False
        sump = sump + rp [i]
    
    sumq = 0
    for (i, B) in enumerate (Q) :
        if i not in rq :
            return False
        if rq [i] >= (a / b) :
            return False
        sumq = sumq + rq [i]

    if sump + sumq != a :
        return False
    
    KR = rotb (Kreweras (P))
    if KR != Q :
        return False
    
    tmp, trp, trq = A, rp, rq
    for m in (1..b - 1) :
        tmp, trp, trq = abrot (tmp, trp, trq)
        for B in tmp.P :
            if not rank_cond (tmp, trp, trq, B) :
                return False
    
    return True

from itertools import *

def generate_rank_abpnc (a, b) :    
    g = list (generate_mut (b))
    L = [i for i in (0..a)]

    for (P, Q) in g :
        A = ABPNC (a, b, P, Q)
        np, nq = len (P), len (Q)
        Sp = list (product (L, repeat = np))
        Sq = list (product (L, repeat = nq))

        for rps in Sp :
            rp = {}
            for i in range (np) :
                rp [i] = rps [i]
            
            for rqs in Sq :
                rq = {}
                for i in range (nq) :
                    rq [i] = rqs [i]

                if is_rank_abpnc (A, rp, rq) :
                    yield (A, rp, rq)