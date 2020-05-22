load pnc.sage
load dpnc.sage

def is_edeltwo (P) :
    A = []
    B = []
    B1 = []
    for (a, b) in P :
        if len (a) != len (b) :
            return False
        A.append (a)
        B.append (b)
        B1 = B1 + b

    try :
        A1 = SetPartition (A)
    except :
        return False
    if not is_pnc (A1) :
        return False
 
    n = A1.base_set_cardinality ()
    L = [i for i in (1..n)]
    if sorted (B1) != L :
        return False

    return True

def cov_edeltwo (P1, P2) :
    if not is_edeltwo (P1) :
        return False
    if not is_edeltwo (P2) :
        return False
    
    A1 = []
    B1 = []
    A2 = []
    B2 = []
    for (a1, b1) in P1 :
        A1.append (sorted (a1))
        B1.append (sorted (b1))
    for (a2, b2) in P2 :
        A2.append (sorted (a2))
        B2.append (sorted (b2)) 

    pi1 = SetPartition (A1)
    rho1 = SetPartition (B1)
    lam1 = {}
    for i1, e1 in enumerate (pi1) :
        for j1, f1 in enumerate (rho1) :
            e = sorted (list (e1))
            f = sorted (list (f1))
            if (e, f) in P1 :
                lam1 [i1] = j1

    pi2 = SetPartition (A2)
    rho2 = SetPartition (B2)
    lam2 = {}
    for i2, e2 in enumerate (pi2) :
        for j2, f2 in enumerate (rho2) :
            e = sorted (list (e2))
            f = sorted (list (f2))
            if (e, f) in P2 :
                lam2 [i2] = j2
    
    E1 = DPNC (pi1, rho1, lam1)
    E2 = DPNC (pi2, rho2, lam2)

    return couvre_dpnc (E2, E1)

def generate_edeltwo (n) :
    g = generate_dpnc (n)
    for e in g :
        pi, rho, lam = e.pi, e.rho, e.lam
        P = []
        for i1, e1 in enumerate (pi) :
            for i2, e2 in enumerate (rho) :
                if lam [i1] == i2 :
                    e3 = sorted (list (e1))
                    e4 = sorted (list (e2))
                    P.append ((e3, e4))
        yield P

def cpt_edeltwo (n) :
    return (n + 1) ^ (n - 1)

def L_pi (P) :
    if is_edeltwo (P) : 
        A = []
        for (a, b) in P :
            A.append (a)
        A1 = SetPartition (A)
        n = A1.base_set_cardinality ()
        
        g = generate_edeltwo (n)
        for e in g :
            if cov_edeltwo (P, e) :
                yield e

def type (P) :
    if not is_edeltwo (P) :
        return None

    n = 0

    s = {}
    for (a, _) in P :
        k = len (a)
        n = n + k

        if k in s :
            s [k] = s [k] + 1
        else :
            s [k] = 1

    L = []
    for i in (1..n) :
        if i in s :
            L.append (s [i])
        else :
            L.append (0)

    return L

def generate_edeltwo_s (s) :
    n = 0
    for i, e in enumerate (s) :
        k = (i + 1) * e
        n = n + k

    g = generate_edeltwo (n)

    for e in g :
        if type (e) == s :
            yield e

def cpt_edeltwo_s (s) :
    k = 0
    m = 0
    for i, e in enumerate (s) :
        k = k + e
        m = m + (i + 1) * e

    res = factorial (m)

    for i in ((m - k + 2)..m) :
        res = res * i

    for i, e in enumerate (s) :
        res = res / factorial (e)
        tmp = factorial (i + 1)
        tmp = tmp ^ (e)
        res = res / tmp

    return res

def type_part (P) :
    try :
        A = SetPartition (P)
    except :
        return None 

    n = 0

    s = {}
    for p in P :
        k = len (p)
        n = n + k

        if k in s :
            s [k] = s [k] + 1
        else :
            s [k] = 1

    L = []
    for i in (1..n) :
        if i in s :
            L.append (s [i])
        else :
            L.append (0)

    return L

def type_pnc (P) :
    try :
        A = SetPartition (P)
    except :
        return None 
    
    if not is_pnc (A) :
        return None

    return type_part (P)

def generate_pnc_s (s) :
    n = 0
    for i, e in enumerate (s) :
        k = (i + 1) * e
        n = n + k

    g = generate_pnc (n)

    for e in g :
        if type_pnc (e) == s :
            yield e

def cpt_pnc_s (s) :
    k = 0
    m = 0
    for i, e in enumerate (s) :
        k = k + e
        m = m + (i + 1) * e    

    res = 1
    for i in ((m - k + 2)..m) :
        res = res * i

    for e in s :
        if e != 0 :
            tmp = factorial (e)
            res = res / tmp

    return res

def type_part (P) :
    try :
        A = SetPartition (P)
    except :
        return None 

    n = 0

    s = {}
    for p in P :
        k = len (p)
        n = n + k

        if k in s :
            s [k] = s [k] + 1
        else :
            s [k] = 1

    L = []
    for i in (1..n) :
        if i in s :
            L.append (s [i])
        else :
            L.append (0)

    return L

def generate_part_s (s) :
    n = 0
    for i, e in enumerate (s) :
        k = (i + 1) * e
        n = n + k

    g = SetPartitions (n)

    for e in g :
        if type_part (e) == s :
            yield e

def cpt_part_s (s) :
    m = 0
    for i, e in enumerate (s) :
        m = m + (i + 1) * e

    res = factorial (m)

    for i, e in enumerate (s) :
        res = res / factorial (e)
        tmp = factorial (i + 1)
        tmp = tmp ^ e
        res = res / tmp

    return res

def cpt_edeltwo_s_alt (s) :
    c_pnc = cpt_pnc_s (s)
    c_part = cpt_part_s (s)
    div = 1
    for e in s :
        div = div * factorial (e)
    
    res = c_pnc * c_part / div
    return res

def generate_edeltwo_h (m, h) :
    g = generate_edeltwo (m)
    for e in g :
        if len (e) == h :
            yield e

def cpt_edeltwo_h (m, h) :
    res = stirling_number2 (m, h)
    for i in ((m - h + 2)..m) :
        res = res * i
    return res