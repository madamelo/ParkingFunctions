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

def mcd_case_1 (d, e) :
    w = d.to_list ()
    w2 = e.to_list ()
    n = len (w)

    for i in range (n - 1) :
        if w [i] == 0 and w2 [i + 1] == 0 :
            x = w [ : i]
            x2 = w2 [ : i + 1]
            y = w [i + 1]
            r = w [i + 2 : ]
            r2 = w2 [ i + 2 : ]
            if r == r2 :
                if correctly_inserted (x, x2, y) :
                    return True

    return False

def mcd_case_2 (d, e) :
    w = d.to_list ()
    w2 = e.to_list ()
    n = len (w)

    for i in range (n - 1) :
        for j in range (i + 1, n - 1) :
            if w [i] == 0 and w2 [i] == 0 :
                if w [j] == 0 and w2 [j + 1] == 0 :
                    l = w [ : i]
                    l2 = w2 [ : i]
                    x = w [i + 1 : j]
                    x2 = w2 [i + 1 : j + 1]
                    y = w [j + 1]
                    r = w [j + 2 : ]
                    r2 = w2 [j + 2 : ]
                    if l == l2 and r == r2 :
                        if correctly_inserted (x, x2, y) :
                            return True

    return False

def mcd_case_3 (d, e) :
    w = d.to_list ()
    w2 = e.to_list ()
    n = len (w)

    for i in range (n - 2) :
        if w [i] == 0 and w[i + 1] == 0 :
            if w2 [i] == 0 and w2 [i + 2] == 0 :
                l = w [ : i]
                l2 = w2 [ : i]
                y = w [i + 2]          
                r = w [i + 3 : ]
                r2 = w2 [ i + 3 : ]
                if l == l2 and r == r2 :
                    return True

    return False

def my_cov_ddyck (d, e) :
    if not d.is_ddyck () :
        return False
    if not e.is_ddyck () :
        return False

    if mcd_case_3 (d, e) :
        return True
    if mcd_case_2 (d, e) :
        return True
    if mcd_case_1 (d, e) :
        return True

    return False