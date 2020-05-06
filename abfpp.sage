load perm.sage
load abfp.sage

class ABFPP :
    a = 0
    b = 0
    p = None

    def __init__ (self, a, b, p) :
        self.a = a
        self.b = b
        self.p = p
    
    def is_abfpp (self) :
        a = self.a
        b = self.b

        if gcd (a, b) != 1 :
            return False

        p = self.p
        if len (p) != a :
            return False

        p2 = sorted (p)

        for i, e in enumerate (p2) :
            lim = (b / a) * i + 1
            if e < 1 or e > lim :
                return False
        
        return True

from itertools import *

def generate_abfpp (a, b) :
    L = [i for i in (1..b)]
    P = product (L, repeat = a)
    for p in P :

        A = ABFPP (a, b, list (p))
        if A.is_abfpp () :
            yield A
    
def perm_abfpp (A, P) :
    if not A.is_abfpp () :
        return None
    
    if not is_perm (P) :
        return None
    
    a, b = A.a, A.b

    if len (P) != a :
        return False

    p = A.p
    print (p)
    p2 = []

    for e in P :
        p2.append (p [e - 1])
    
    A2 = ABFPP (a, b, p2)
    return A2

def abfp_to_abfpp (A) :
    if not A.is_abfp () :
        return None
    
    a, b = A.a, A.b
    P, Q = A.P, A.Q
    fP, fQ = A.fP, A.fQ

    p = [0] * a

    for i, B in enumerate (P) :
        j = min (B)
        for e in fP [i] :
            p [e - 1] = j
    
    for i, B in enumerate (Q) :
        j = max (B) + 1
        for e in fQ [i] :
            p [e - 1] = j
    
    A2 = ABFPP (a, b, p)
    return A2

def abfpp_to_rdyck (A) :
    if not A.is_abfpp () :
        return None
    
    a, b = A.a, A.b
    p = A.p

    rises = [0] * b
    for i in range (b) :
        j = p.count (i + 1)
        rises [i] = j
    
    p2 = []
    for e in rises :
        p2 = p2 + [1] * e + [0]
    
    R = RDYCK (a, b, p2)
    return R