load dyckfp.sage

def my_prim_cov (f, g) :
    if not is_primitive (f) :
        return False
    if not is_primitive (g) :
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

def my_prim_cov_dyck (d, e) :
    try :
        w1 = DyckWord (d)
    except :
        return False
    try :
        w2 = DyckWord (e)
    except :
        return False

    n = len (d)
    if n != len (e) :
        return False

    for i in range (n - 1) :
        ld = d [:i]
        le = e [:i]
        rd = d [i+2:]
        re = e [i+2:]

        if ld == le and rd == re :
            if d[i] == 0 and d[i+1] == 1 :
                if e[i] == 1 and e[i+1] == 0 :
                    return True
            else :
                return False
        
    return False