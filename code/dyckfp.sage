load fp.sage
load ddyck.sage

def fpp_to_dyck (L) :
    if not is_primitive (L) :
        return None

    n = len (L)

    tot0 = 0
    w = []
    prec = 1

    for e in L :
        diff = e - prec
        sub = [0] * diff + [1]
        w = w + sub
        prec = e
        tot0 = tot0 + diff

    prec = n - tot0
    w = w + [0] * prec

    return w

def pretty_print_dfp (w) :
    n = len (w)
    n = n // 2
    L = [i for i in (1..n)]
    D = DDYCK (w, L)
    D.pretty_print ()

def dyck_to_fpp (w) :
    try :
        W = DyckWord (w)
    except :
        return None

    L = []
    cpt_left = 1

    for e in w :
        if e == 1 :
            L.append (cpt_left)
        else :
            cpt_left = cpt_left + 1

    return L

def fp_to_ddyck (L) :
    if not is_fp (L) :
        return None

    L2 = sorted (L)
    W = fpp_to_dyck (L2)

    labels = []    
    n = len (L)
    for k in (1..n) :
        for (j, e) in enumerate (L) :
            if e == k :
                labels.append (j + 1)

    D = DDYCK (W, labels)
    return D

def ddyck_to_fp (D) :
    if not D.is_ddyck () :
        return None

    w, labels = D.W, D.labels

    L = []
    cpt_left = 1

    for e in w :
        if e == 1 :
            L.append (cpt_left)
        else :
            cpt_left = cpt_left + 1

    n = len (L)
    L2 = [0] * n
    
    for (i, e) in enumerate (labels) :
        L2 [e - 1] = L [i]

    return L2