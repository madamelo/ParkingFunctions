load pnc.sage

def is_edelrat (P) :
    A = []
    B = []
    B1 = []
    for (a, b) in P :
        if len (a) != len (b) :
            return False
        A.append (a)
        B.append (b)
        B1 = B1 + b

    if not is_pnc (A) :
        return False

    A1 = SetPartition (A)    
    n = A1.base_set_cardinality ()
    L = [i for i in (1..n)]
    if sorted (B1) != L :
        return False

    return True