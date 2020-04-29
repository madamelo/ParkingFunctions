load perm.sage

class Cycle :
    M = []
    c = []
    m = 0

    def __init__ (self, M, c, m) :
        self.M = M
        self.c = c
        self.m = m
    
    def is_cycle (self) :
        M = self.M
        c = self.c
        m = self.m

        if not is_perm (c) :
            return False
        
        if not is_cyclic (c) :
            return False
        
        if len (M) != m :
            return False
        
        if len (c) != m :
            return False
        
        return True

def cycle_d (C, A, x) :
    if not C.is_cycle () :
        return None

    if A == [] :
        return None
    
    if x not in A :
        return None
    
    M, c, m = C.M, C.c, C.m
    
    for e in A :
        if e not in M :
            return None
        
    idx = M.index (x)
    idk = c [idx] - 1
    k = M [idk]

    while k not in A :
        idx = idk
        idk = c [idx] - 1
        k = M [idk]

    return k 

def cycle_d_all (C, A) :
    c = []

    for x in A :
        k = cycle_d (C, A, x)
        if k == None :
            return None
        c.append (A.index (k) + 1)

    C2 = Cycle (A, c, len (A))
    return C2

def dist (C, x, y) :
    if not C.is_cycle () :
        return None
    
    if x == y :
        return None
    
    M, c = C.M, C.c

    if x not in M :
        return None
    if y not in M :
        return None

    idx = M.index (x)
    idk = c [idx] - 1
    k = M [idk]
    cpt = 1

    while (k != y) :
        idx = idk
        idk = c [idx] - 1
        k = M [idk]
        cpt = cpt + 1
    
    return cpt

def paires_croisees (C, x, y, u, v) :
    dxu = dist (C, x, u)
    dxy = dist (C, x, y)
    dxv = dist (C, x, v)

    if dxu == None :
        return False
    
    if dxy == None :
        return False
    
    if dxv == None :
        return False

    if dxu <= dxy and dxy <= dxv :
        return True
    
    if dxu >= dxy and dxy >= dxv :
        return True
    
    return False

def parts_non_croisees (C, A, B) :
    if not C.is_cycle () :
        return False
    
    M, c = C.M, C.c
    
    for e in A :
        if e in B :
            return False
        if e not in M :
            return False
    
    for e in B : 
        if e in A :
            return False
        if e not in M :
            return False
    
    for sA in Subsets (A, 2) :
        sA = sorted (sA)
        x = sA [0]
        y = sA [1]
        for sB in Subsets (B, 2) :
            sB = sorted (sB)
            u = sB [0]
            v = sB [1]
            if paires_croisees (C, x, y, u, v) :
                return False
    
    return True

def parts_nc_adj (C, A, B) :
    if not parts_non_croisees (C, A, B) :
        return False
    
    M, c = C.M, C.c

    for x in A :
        idx = M.index (x)
        idcx = c [idx] - 1
        cx = M [idcx]
        if cx in B :
            for y in B :
                idy = M.index (y)
                idcy = c [idy] - 1
                cy = M [idcy]
                if cy in A :
                    return True

    return False

def is_set_part (M, P) :
    R = []
    for p in P :
        R = R + p
    R = sorted (R)
    M2 = sorted (M)
    return (R == M2)

def cycle_pnc (C, P) :
    if not C.is_cycle () :
        return False
    
    M, c = C.M, C.c

    if not is_set_part (M, P) :
        return False
    
    n = len (P)
    l = [i for i in range (n)]

    for s in Subsets (l, 2) :
        p1 = P [s [0]]
        p2 = P [s [1]]
        if not parts_non_croisees (C, p1, p2) :
            return False
    
    return True

def get_crossing (C, P) :
    if not C.is_cycle () :
        return None, None
    
    M, c = C.M, C.c

    if not is_set_part (M, P) :
        return None, None
    
    n = len (P)
    l = [i for i in range (n)]

    for s in Subsets (l, 2) :
        p1 = P [s [0]]
        p2 = P [s [1]]
        if not parts_non_croisees (C, p1, p2) :
            return p1, p2
    
    return None, None
    
def make_pnc (C, P) : 
    if not C.is_cycle () :
        return None
    
    M, c = C.M, C.c

    if not is_set_part (M, P) :
        return None
    
    P2 = copy (P)
    
    while not cycle_pnc (C, P2) :
        A, B = get_crossing (C, P2)
        if A == None :
            return None
        if B == None :
            return None
        P2.remove (A)
        P2.remove (B)
        P2.append (sorted (A + B))
    
    return P2

def is_serree (C, P) :
    if not C.is_cycle () :
        return False
    
    M, c, m = C.M, C.c, C.m

    if m % 2 == 1 :
        return False
    
    if m == 0 :
        return True

    odd = []
    even = []

    idx = 0
    x = M [0]

    for i in range (m) :
        if i % 2 == 0 :
            even.append (x)
        else :
            odd.append (x)
        idx = c [idx] - 1
        x = M [idx]

    for p in P :
        has_even = False
        has_odd = False
        for x in p :
            if x in even :
                if has_odd :
                    return False
                has_even = True
            if x in odd :
                if has_even :
                    return False
                has_odd = True
    
    n = len (P)
    l = [i for i in range (n)]

    for s in Subsets (l, 2) :
        s = sorted (s)
        A = P [s [0]]
        B = P [s [1]]
        for x in A :
            for y in B :
                idx = M.index (x)
                ide = c [idx] - 1
                e = M [ide]
                if e == y :
                    if not parts_nc_adj (C, A, B) :
                        return False
                    
    return True

def cycle_comp (C, P) :
    if not C.is_cycle () :
        return None

    M, c = C.M, C.c

    if not is_set_part (M, P) :
        return None
    
    d = {}
    for p in P :
        for x in p :
            d [x] = cycle_d (C, p, x)
    
    c2 = []
    for e in M :
        x = d [e]
        idx = M.index (x)
        c2.append (idx + 1)

    p2 = inv_perm (c2)
    p3 = comp_perm (c, p2)

    B = blocs_perm (p3)
    R = []

    for b in B :
        r = []
        for e in b :
            x = M [e - 1]
            r.append (x)
        R.append (r)

    return R

def is_diluee (C, P) :
    if not C.is_cycle () :
        return False
    
    M, c = C.M, C.c

    if not is_set_part (M, P) :
        return False

    for p in P :
        for x in p :
            idx = M.index (x)
            idy = c [idx] - 1
            y = M [idy]
            if y in p :
                return False
    
    return True

def lacune (C, A) :
    if not C.is_cycle () :
        return None
    
    M, c = C.M, C.c

    for x in A :
        if x not in M :
            return None
    
    L = []

    for x in A :
        lx = []
        idx = M.index (x)
        idy = c [idx] - 1
        y = M [idy]
        while y not in A :
            lx.append (y)
            idx = idy
            idy = c [idx] - 1
            y = M [idy]
        if len (lx) > len (L) :
            L = lx
    
    return L

def lacunes (C, P) :
    if not C.is_cycle () :
        return None
    
    M, c = C.M, C.c

    if not is_set_part (M, P) :
        return None
    
    L = []
    for p in P :
        L.append (lacune (C, p))
    
    return L

def arc (C, A) :
    if not C.is_cycle () :
        return None
    
    M, c = C.M, C.c

    for x in A :
        if x not in M :
            return None
    
    L = []
    for x in A :
        lx = [x]
        idx = M.index (x)
        idy = c [idx] - 1
        y = M [idy]

        while y in A :
            lx.append (y)
            idx = idy
            idy = c [idx] - 1
            y = M [idy]
        
        if len (lx) > len (L) :
            L = lx
    
    return L

def arcs (C, P) :
    if not C.is_cycle () :
        return None
    
    M, c = C.M, C.c

    if not is_set_part (M, P) :
        return None
    
    L = []
    for p in P :
        L.append (arc (C, p))

    return L

def part_arcs (C, P) :
    if not C.is_cycle () :
        return None
    
    M, c = C.M, C.c

    if not is_set_part (M, P) :
        return None
    
    A = arcs (C, P)
    N = []
    for x in A :
        N.append (x [0])
    
    return cycle_d_all (C, N)