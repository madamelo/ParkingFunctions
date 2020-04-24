load perm.sage

def is_pnc (P) :
    L = []
    for b in P :
        for e in b :
            L.append (e)
    n = len (L)
    L2 = [i for i in (1..n)]
    if not (sorted (L) == L2) :
        return False

    S = Subsets (P, 2)
    for e1, e2 in S :
        S1 = Subsets (e1, 2)
        S2 = Subsets (e2, 2)
        for a, b in S1 :
            for c, d in S2 :
                if a < c and c < b and b < d :
                    return False
                if c < a and a < d and d < b :
                    return False
    return True

def generate_pnc (n) :
    k = 0
    L = SetPartitions (n).list ()
    for p in L :
        if is_pnc (p) :
            k = k + 1
            yield p
    print (k)

def couvre_pnc (P1, P2) :
    S = Subsets (P1, 2)
    for e1, e2 in S :
        for e3 in P2 :
            if e3 == e1.union (e2) :
                P2_ = copy (P2)
                P2_.remove (e3)
                P1_ = copy (P1)
                P1_.remove (e1)
                P1_.remove (e2)
                if (P1_ == P2_) :
                    return True
    return False

def pnc_to_perm (P) :
    if not is_pnc (P) :
        return []
    n = 0
    for b in P :
        n = n + len (list (b))
    P2 = [0] * n
    for b in P :
        L = list (b)
        n = len (L)
        for (i, e) in enumerate (L) :
            if i == n - 1 :
                P2[e - 1] = L [0]
            else :
                P2 [e - 1] = L [i + 1]
    return P2

def Kreweras (P) :
    n = 0
    for b in P :
        n = n + len (list (b))

    om = [i for i in (2..n)] + [1]
    pi = pnc_to_perm (P)
    pib = inv_perm (pi)
    k = comp_perm (om, pib)
    B = blocs_perm (k)
    return SetPartition (B)