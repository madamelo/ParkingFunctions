load fp.sage
load fptree.sage

class DDYCK :
    W = []
    labels = []

    def __init__ (self, W, labels) :
        self.W = W
        self.labels = labels
    
    def is_ddyck (self) :
        W = self.W
        labels = self.labels
        L = sorted (labels)
        n = len (L)

        try :
            WW = DyckWord (W)
        except :
            return False

        L2 = [i for i in (1..n)]

        if L != L2 :
            return False

        if 2 * n != len (W) :
            return False

        return True

    def pretty_print (self) :
        if not self.is_ddyck () :
            return
  
        W = self.W
        l = self.labels
        i = 0
        r = ""
        re = ""
        x = ""
        x_next = ""

        for e in W :
            if e == 1 :
                st = str (l [i])
                n = 10 - len (st)
                st = st + " " * n
                r = st + x + re + "|" + "\n" + r
                re = ""
                x = x_next
                i = i + 1
            else :
                if re == "" :
                    x = x + " "
                    x_next = x_next + " "
                re = "_" + re
                x_next = x_next +  " "

        if re != "" :
            r = " " * 10 + x + re + "\n" + r
    
        print (r)

    def flat_print (self) :
        if not self.is_ddyck () :
            return

        W = self.W
        labels = self.labels

        i = 0
        s1 = ""
        s2 = ""
        for e in W :
            if e == 0 :
                s1 = s1 + "\\ "
                s2 = s2 + "  "
            else :
                l = str (labels [i])
                r = 2 - len (l)
                s1 = s1 + "/ "
                s2 = s2 + l + " " * r
                i = i + 1
        
        print (s1)
        print (s2)

    def to_list (self) :
        W, labels = self.W, self.labels
        i = 0
        R = []
        for e in W :
            if e == 1 :
                R.append (labels [i])
                i = i + 1
            else :
                R.append (0)
        return R

def fp_to_ddyck (L) :
    if not is_fp (L) :
        return None
    
    T = fp_to_fpt (L)
    P = pref (T) [:-1]
    labels = []
    W = []
    for b in P :
        for e in b :
            labels.append (e)
            W.append (1)
        W.append (0)
    
    D = DDYCK (W, labels)
    if not D.is_ddyck () :
        return None
    return D

def blocks (D) :
    if not D.is_ddyck () :
        return None
    
    W, labels = D.W, D.labels
    B = []
    b = []
    i = 0
    for e in W :
        if e == 0 :
            B.append (b)
            b = []
        else :
            b.append (labels [i])
            i = i + 1
    return B

def ddyck_to_fp (D) :
    if not D.is_ddyck () :
        return None

    n = len (D.labels)
    L = [0] * n
    B = blocks (D)

    for i, b in enumerate (B) :
        for e in b :
            L [e - 1] = i + 1 
    return L

def couvre_ddyck (D1, D2) :
    if not D1.is_ddyck () :
        return False
    if not D2.is_ddyck () :
        return False

    L1 = ddyck_to_fp (D1)
    L2 = ddyck_to_fp (D2)
    
    res = couvre_fp (L1, L2)
    return res