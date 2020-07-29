load dyckfp.sage

def my_cov (f, g) :
    if not is_fp (f) :
        return False
    if not is_fp (g) :
        return False

    n = len (f)
    if n != len (g) :
        return False

    found = False
    for i in range (n) :
        if not found and f[i] == g[i] + 1 :
            found = True
        elif f[i] != g[i] :
            return False

    return found

def correctly_inserted (x, x2, y) :
    if 0 in x :
        return False
    if 0 in x2 :
        return False
    if y == 0 :
        return False

    x3 = x + [y]
    return sorted (x3) == x2

def correctly_removed (z, z2, y) :
    if 0 in z :
        return False
    if 0 in z2 :
        return False
    if y == 0 :
        return False

    z3 = z2 + [y]
    return sorted (z3) == z

def my_cov_ddyck (d, e) :
    if not d.is_ddyck () :
            return False
    if not e.is_ddyck () :
        return False

    bd = blocks (d)
    be = blocks (e)
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