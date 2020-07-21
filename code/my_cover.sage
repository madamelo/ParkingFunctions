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

def my_cov_ddyck (d, e) :
    if not d.is_ddyck () :
        return False
    if not e.is_ddyck () :
        return False

    wd, ld = d.W, d.labels
    we, le = e.W, e.labels
    #TODO : this is hard