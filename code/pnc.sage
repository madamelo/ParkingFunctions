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
    return P.is_noncrossing ()

def generate_pnc (n) :
    L = SetPartitions (n).list ()
    for P in L :
        if P.is_noncrossing () :
            yield P

def is_subset (S1, S2) :
    for e in S1 :
        if not e in S2 :
            return False
    return True

def couvre_part (P1, P2) :
    d = {}
    cpt_in = {}
    for i1, b1 in enumerate (P1) :
        cpt_in [i1] = 0

    for i2, b2 in enumerate (P2) :
        d [i2] = 0
        for i1, b1 in enumerate (P1) :
            if is_subset (b1, b2) :
                d [i2] = d [i2] + 1
                cpt_in [i1] = cpt_in [i1] + 1

    for k in cpt_in :
        v = cpt_in [k]
        if v != 1 :
            return False
            
    found = False
    for k in d :
        v = d [k]
        if v < 1 or v > 2 :
            return False
        if v == 2 :
            if found :
                return False
            found = True
    return found

def couvre_pnc (P1, P2) :
    if not is_pnc (P1) :
        return False
    if not is_pnc (P2) :
        return False
        
    return couvre_part (P1, P2)

def pnc_to_perm (P) :
    if not is_pnc (P) :
        return None
    return P.to_permutation ()

def Kreweras (P) :
    if not is_pnc (P) :
        return None

    n = P.base_set_cardinality ()
    lom = [n] + [i for i in range (1, n)]
    om = Permutation (lom)
    pi = P.to_permutation ()

    k = om.left_action_product (pi)
    B = blocs_perm (k)
    return SetPartition (B)

def krew_mins (P) :
    if not is_pnc (P) :
        return None
    
    mins = []
    for i, b in enumerate (P) :
        l = sorted (list (b))
        if i == 0 :
            mins = mins + l
        else :
            mins = mins + l [:-1]
    
    return sorted (mins)

def find_part (P, e) :
    for p in P :
        if e in p :
            return p

def krew_sizes (P) :
    if not is_pnc (P) :
        return None
    
    n = P.base_set_cardinality ()
    mins = krew_mins (P)
    sizes = {}

    for i, m in enumerate (mins) :
        cpt = 1

        tmp = m + 1
        if tmp > n :
            tmp = tmp - n

        p = find_part (P, m)

        while (tmp not in p) :
            p2 = find_part (P, tmp)

            tmp = max (p2) + 1
            if tmp > n :
                tmp = tmp - n

            cpt = cpt + 1
        sizes [m] = cpt
    
    return sizes

def label (P1, P2) :
    if not couvre_pnc (P1, P2) :
        return None

    p1 = pnc_to_perm (P1)
    p2 = pnc_to_perm (P2)
    p1i = p1.inverse ()
    t = p2.left_action_product (p1i)
    return t

def rot (P) :
    if not is_pnc (P) :
        return None

    n = P.base_set_cardinality ()
    Parts = []

    for p in P :
        part = []
        for e in p :
            if e == n :
                part.append (1)
            else :
                part.append (e + 1)
        Parts.append (part)
    
    return SetPartition (Parts)

def rotb (P) :
    if not is_pnc (P) :
        return None
    
    n = P.base_set_cardinality ()
    Parts = []

    for p in P :
        part = []
        for e in p :
            if e == 1 :
                part.append (n)
            else :
                part.append (e - 1)
        Parts.append (part)
    
    return SetPartition (Parts)