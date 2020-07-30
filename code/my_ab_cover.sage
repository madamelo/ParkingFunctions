load rdyckfp.sage
load abfpp.sage
load my_cover.sage

def my_ab_cov (f, g) :
    if not f.is_abfpp () :
        return False
    if not g.is_abfpp () :
        return False

    af, bf, pf = f.a, f.b, f.p
    ag, bg, pg = g.a, g.b, g.p

    if af != ag or bf != bg :
        return False

    found = False
    for i in range (af) :
        if not found and pf[i] == pg[i] + 1 :
            found = True
        elif pf[i] != pg[i] :
            return False

    return found

class DRDYCK :
    D = None
    labels = []

    def __init__ (self, D, labels) :
        self.D = D
        self.labels = labels

    def is_drdyck (self) :
        D, labels = self.D, self.labels

        if not D.is_rdyck () :
            return False

        a, p = D.a, D.p
        L = [i for i in (1..a)]
        if sorted (labels) != L :
            return False
        return True


def my_ab_cov_dyck (D, E) :
    if not D.is_drdyck () :
        return False
    if not E.is_drdyck () :
        return False

    d, ld = D.D, D.labels
    e, le = E.D, E.labels

    bd = rblocks (d, ld)
    be = rblocks (e, le)
    n = len (bd)
    if len (be) != n :
        return False

    for i in range (n - 1) :
        ld = bd [ : i]
        le = be [ : i]

        wd = bd [i]
        zd = bd [i + 1]
        we = be [i]
        ze = be [i + 1]

        rd = bd [i + 2 : ]
        re = be [i + 2 : ]

        if ld == le and rd == re :
            for y in we : 
                if correctly_inserted (wd, we, y) :
                    if correctly_removed (zd, ze, y) :
                        return True
    return False