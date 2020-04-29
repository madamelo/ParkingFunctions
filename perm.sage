def is_perm (L) :
    n = len (L)
    L2 = [i for i in (1..n)]
    return (L2 == sorted (L))

def blocs_perm (L) :
    if not is_perm (L) :
        return None
    S = []
    for i, e in enumerate (L) :
        s = [e]
        tmp = L [e - 1]
        while (tmp != e) :
            s.append (tmp)
            tmp = L [tmp - 1]
        S.append (s)
    R = []
    for b in S :
        if not set (b) in R :
            R.append (set (b))
    return R

def comp_perm (L1, L2) :
    if not is_perm (L1) :
        return None
    if not is_perm (L2) :
        return None

    P1 = Permutation (L1)
    P2 = Permutation (L2)
    P = P1.left_action_product (P2)

    return P

def inv_perm (L) :
    if not is_perm (L) :
        return None
    
    p = Permutation (L)
    return p.inverse ()

def generate_perm (n) :
    for P in Permutations (n) :
        yield P    

def code (L) :
    if not is_perm (L) :
        return None

    C = [0] * len (L)

    for i, e in enumerate (L) :
        cpt = 0
        for e2 in L [i+1 :] :
            if e2 < e :
                cpt = cpt + 1
        C [e - 1] = cpt

    C.reverse ()
    return C

def couvre_perm (L1, L2) :
    if not is_perm (L1) :
        return False
    if not is_perm (L2) :
        return False
    
    c1 = code (L1)
    c2 = code (L2)

    if len (c1) != len (c2) :
        return False

    seen = False

    for e1, e2 in zip (c1, c2) :
        if e1 != e2 :
            if e1 == e2 + 1 :
                if seen :
                    return False
                seen = True
            else :
                return False
    return seen


    