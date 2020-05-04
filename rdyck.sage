class RDYCK :
    a = 0
    b = 0
    p = []

    def __init__ (self, a, b, p) :
        self.a = a
        self.b = b
        self.p = p
    
    def is_rdyck (self) :
        a = self.a
        b = self.b
        p = self.p

        if a <= 0 :
            return False
        if b <= 0 :
            return False
        
        if gcd (a, b) != 1 :
            return False
        
        y = 0
        x = 0

        for e in p :
            if e == 1 : # pas NORD
                y = y + 1
            else : # pas EST
                x = x + 1

            if y < x * a / b :
                return False
        
        if a != y :
            return False
        if b != x :
            return False

        return True

    def rdyck_to_list (self) :
        if not self.is_rdyck () :
            return None
        
        p = self.p

        x = 0
        l = []

        for e in p :
            if e == 1 :
                l.append ('*')
            else :
                x = x + 1
                l.append (x)
        
        return l

    def rdyck_coord (self) :
        if not self.is_rdyck () :
            return None
        
        p = self.p

        x = 0
        y = 0
        l = []

        for e in p :
            l.append ((x, y))
            if e == 1 :
                y = y + 1
            else :
                x = x + 1

        l.append ((x, y))
        return l
    
    def pretty_print (self) :
        if not self.is_rdyck () :
            return

        p = self.p
        r = ""
        re = ""
        x = ""
        x_next = ""

        for e in p :
            if e == 1 :
                r = x + re + "|" + "\n" + r
                re = ""
                x = x_next
            else :
                if re == "" :
                    x = x + " "
                    x_next = x_next + " "
                re = "_" + re
                x_next = x_next +  " "

        if re != "" :
            r = x + re + "\n" + r
    
        print (r)

def generate_rdyck (a, b) :
    if a <= 0 :
        yield
    if b <= 0 :
        yield
    
    if gcd (a, b) != 1 :
        yield

    n = a + b
    l = [i for i in range (n)]
    S = Subsets (l, a)

    for s in S :
        p = []
        for i in range (n) :
            if i in s :
                p.append (1)
            else :
                p.append (0)
        R = RDYCK (a, b, p)
        if R.is_rdyck () :
            yield R

def parcours (R) :
    if not R.is_rdyck () :
        return None
    
    L = R.rdyck_to_list ()
    P = []
    l = []
    x = 0
    for e in L :
        if e == '*' :
            x = x + 1
            l.append (x)
        else :
            P.append (l)
            l = []
    return P

def vallees (R) :
    if not R.is_rdyck () :
        return None
    
    L = R.rdyck_to_list ()
    V = []
    x = 0
    y = 0

    for i, e in enumerate (L [:-1]) :
        if e == '*' :
            y = y + 1
        else :
            x = x + 1
            if L [i + 1] == '*' :
                V.append ((x, y))
    
    return V

def laser (R, p) :
    if not R.is_rdyck () :
        return None
    
    if p not in vallees (R) :
        return None

    (c, d) = p

    L = R.rdyck_coord ()
    a = R.a
    b = R.b

    for (x, y) in L :
        if x <= c :
            continue
        if y <= d :
            continue
        
        if y - d < (x - c) * (a / b) :
            return x - 1

def lasers (R) :
    if not R.is_rdyck () :
        return None
    
    V = vallees (R)
    L = {}

    for v in V :
        x, y = v
        l = laser (R, v)
        L [x] = l
    
    return L

def hauteurs (R) :
    if not R.is_rdyck () :
        return None
    
    L = {}
    h = 0
    for e in R.rdyck_to_list () :
        if e == '*' :
            h = h + 1
        else :
            L [e] = h
    return L

def P (R) :
    if not R.is_rdyck () :
        return None

    a = R.a
    b = R.b

    L = lasers (R)
    c = R.rdyck_coord ()
    H = hauteurs (R)

    und = {}
    ov = {}

    for (u, v) in c :
        und [(u, v)] = []
        ov [(u, v)] = []

    for x in L :
        y = L [x]
        cx = H [x]
        cy = H [y + 1]

        for (u, v) in c :
            if v <= cx :
                und [(u, v)].append ((x, y))
            elif v <= cy :
                if v - cx <= (a / b) * (u - x) :
                    und [(u, v)].append ((x, y))
            else :
                ov [(u, v)].append ((x, y))

    done = {}
    for u in H :
        if u != b :
            done [u] = False

    Parts = []

    for u in H :
        if u == b :
            continue
        if done [u] :
            continue

        done [u] = True
        v = H [u]
        part = [u]

        for u2 in H :
            if u2 == b :
               continue
            if done [u2] :
                continue

            v2 = H [u2]
            if und [(u, v)] == und [(u2, v2)] :
                 part.append (u2)
                 done [u2] = True

        Parts.append (part)
    
    S = SetPartition (Parts)
    SL = {}
    H [0] = 0
    for (i, s) in enumerate (S) :
        m = min (s)
        h = H [m] - H [m - 1]
        SL [i] = h

    return S, SL 

def Q (R) :
    if not R.is_rdyck () :
        return None

    a = R.a
    b = R.b
    
    H = hauteurs (R)
    L = lasers (R)
    rdl = R.rdyck_to_list ()
    qr = {}
    qrise = 0

    for i, e in enumerate (rdl) :
        if e == '*' :
            qrise = qrise + 1
        else :
            if qrise < a / b :
                qr [e] = True
            else :
                qr [e] = False
            qrise = 0

    rel = {}
    for u in H :
        for v in H :
            if u != b and v != b :
                if u in L and L [u] == v :
                    rel [(u, v)] = True
                elif v in L and L [v] == u :
                    rel [(u, v)] = True
                elif u in L and v in L :
                    eu = L [u]
                    ev = L [v]
                    if eu == ev and qr [eu] :
                        rel [(u, v)] = True
                    else :
                        rel [(u, v)] = False
                else :
                    rel [(u, v)] = False

    Parts = []

    done = {}
    lenH = 0
    for u in H :
        if u != b :
            done [u] = False
            lenH = lenH + 1

    for u in H :
        if u == b :
            continue
        if done [u] :
            continue
        
        part = [u]
        done [u] = True
        for i in range (lenH) :
            for p in part :
                for u2 in H :
                    if u2 == b :
                        continue
                    if done [u2] :
                        continue
                    if rel [(p, u2)] :
                        part.append (u2)
                        done [u2] = True
        Parts.append (part)

    S = SetPartition (Parts)
    SL = {}
    H [0] = 0
    H [-1] = 0
    for i, s in enumerate (S) :
        j = next (iter (s))
        if j in L :
            k = L [j] + 1
            SL [i] = H [k] - H [k - 1]
        else :
            SL [i] = 0

    return S, SL