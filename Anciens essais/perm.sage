def is_perm (L) :
    n = len (L)
    L2 = [i for i in (1..n)]
    return (L2 == sorted (L))

def inv_perm (L) :
    if not is_perm (L) :
        return []
    n = len (L)
    L2 = [0] * n
    for i, a in enumerate (L) :
        L2 [a - 1] = i + 1
    return L2

def comp_perm (L1, L2) :
    L = []
    n = len (L1)
    m = len (L2)
    if n != m :
        return []
    if not is_perm (L1) :
        return []
    if not is_perm (L2) :
        return []
    for i in range (n) :
        L.append (L1 [L2 [i] - 1])
    return L

def blocs_perm (L) :
    if not is_perm (L) :
        return set ([])
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

    