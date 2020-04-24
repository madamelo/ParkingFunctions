def is_perm (L) :
    n = len (L)
    L2 = [i for i in (1..n)]
    return (L2 == sorted (L))

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

    