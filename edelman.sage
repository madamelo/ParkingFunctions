load pnc.sage

def sigb (b, m) :
    if b < 1 or b > m :
        return None
    L = [i for i in (b..m)] + [i for i in range(1,b)]
    return L

def reorder_part (part, order) :
    res = []
    new_order = []
    for e in order :
        if e in part :
            res.append (e)
        else :
            new_order.append (e)
    return res, new_order

def reorder (P, b, m) :
    P1 = SetPartition (P)
    if not is_pnc (P1) :
        return None

    n = P1.base_set_cardinality ()
    if n != m :
        return None

    P2 = []

    s = sigb (b, m)
    while (s != []) :
        e = s [0]
        for p in P :
            if e in p :
                r, s = reorder_part (p, s)
                P2.append (r)

    return P2

def sigb_hat (L, R, b, m) :
    s = sigb (b, m)

    allR = []
    for Ri in R :
        allR = allR + Ri

    if len (L) != len (allR) + 1 :
        return None

    res = []

    for e in s :
        if e in L :
            res.append ("(")

        res.append (e)

        c = allR.count (e)
        res = res + [")"] * c

    return res

def good_par (L) :
    if L [0] != '(' :
        return None, False

    s = ""
    for e in L :
        s = s + str (e)
        if e != '(' and e != ')' :
            s = s + ','
    s = s [1:]

    open = 0
    for e in s :
        if e == '(' :
            open = open + 1
        if e == ')' :
            open = open - 1
            if open < 0 :
                return None, False

    return s, (open == 0)

def to_part (L, R, m) :
    good = ""
    b_good = 0

    for b in (1..m) :
        s = sigb_hat (L, R, b, m)
        s2, r = good_par (s)
        if r :
            good = s2
            b_good = b
            break

    print (good)

    Parts = []

    while (good != '') :
        c = good.count('(')

        if c == 0 :
            part = []
            for e in good :
                if e != ',' :
                    part.append (int (e))
            good = ''
            Parts.append (part)

        else :
            idx = (good [: : -1]).index ('(')
            i = len (good) - idx - 1
            j = i
            part = []
            while (good [j] != ')') :
                e = good [j]
                if e != ',' and e != '(' :
                    part.append (int (e))
                j = j + 1
            Parts.append (part)
            good = good [:i] + good [j+1:]

    return reorder (Parts, b_good, m)

def generate_pnc_k (m, k) :
    g = generate_pnc (m)
    for P in g :
        if len(P) == k :
            yield P

def par_to_pnc_b (L, R, m) :
    k = len (L)
    if k != len (R) + 1 :
        return None
    
    P = to_part (L, [R], m)
    b = P [0] [0]
    return P, b

def pnc_b_to_par (P, b, m) :
    P2 = reorder (P, b, m)
    L = []
    R = []
    first = True

    for p in P2 :
        if first :
            first = False
            L.append (p [0])
        else :
            L.append (p [0])
            R.append (p [-1])
    
    return (sorted (L), sorted (R))
