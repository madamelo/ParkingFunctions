load fp.sage

class FPT :
    E = []
    val = []
    children = []

    def __init__(self, E, val, children) :
        self.E = E
        self.val = val
        self.children = children

    def get_list_val (self) :
        val = self.val
        children = self.children

        if children == [] : 
            return val

        R = val
        for c in children :
            l = c.get_list_val ()
            R = R + l
        return R

    def is_FPT (self) :
        E = self.E
        val = self.val
        children = self.children

        if len (val) != len (children) :
            return False

        if sorted (self.get_list_val ()) != sorted (E) :
            return False

        for c in children :
            if not c.is_FPT () :
                return False

        return True
    
    def pretty_print (self, ec = 1) :
        val = self.val
        children = self.children
        debv = "*" * ec * 2
        print (debv, val)
        for c in children :
            c.pretty_print (ec + 1)

def pref (T) :
    if not T.is_FPT () :
        return False

    E, val, children = T.E, T.val, T.children
    
    R = []
    R.append (val)

    for c in children :
        R = R + pref (c)
    return R

def fpt_to_fp (T) :
    if not T.is_FPT () :
        return None
    
    n = len (T.E)
    L = [0] * n
    P = pref (T)

    for i, B in enumerate (P) :
        for b in B :
            L [b - 1] = i + 1
    return ParkingFunction (L)

def make_fpt_aux (R, idx) :
    
    if len (R) <= idx :
        return FPT ([], [], []), idx
    
    v = R [idx]
    idx = idx + 1
    n = len (v)
    c = []
    tmp = n + 1
    E = v

    for i in (1..n) :
        vci = R [i]
        F, idxi = make_fpt_aux (R, idx)
        idx = idxi
        c.append (F)
        E = E + F.E

    return FPT (sorted (E), v, c), idx

def make_fpt (R) :
    F, idx = make_fpt_aux (R, 0)
    if idx == len (R) :
        return F
    return None


def fp_to_fpt (L) :
    if not is_fp (L) :
        return None

    R = []
    for r in range (len (L)) :
        R.append ([])

    for i, e in enumerate (L) :
        R [e - 1].append (i + 1)

    R.append ([])
    F = make_fpt (R)

    if F.is_FPT () :
        return F
    return None

def generate_fpt (n) :
    it = generate_fp (n)
    for f in it :
        if f != None :
            yield fp_to_fpt (f)

