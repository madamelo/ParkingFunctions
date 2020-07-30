load rdyckfp.sage
load abfpp.sage

def my_prim_ab_cov (f, g) :
    if not f.is_abfpp () :
        return False
    if not g.is_abfpp () :
        return False

    af, bf, pf = f.a, f.b, f.p
    ag, bg, pg = g.a, g.b, g.p

    if af != ag or bf != bg :
        return False

    if not is_prim_rfp (pf, af, bf) :
        return False
    
    if not is_prim_rfp (pg, ag, bg) :
        return False

    found = False
    for i in range (af) :
        if not found and pf[i] == pg[i] + 1 :
            found = True
        elif pf[i] != pg[i] :
            return False

    return found

def my_prim_ab_cov_dyck (d, e) :
    if not d.is_rdyck () :
        return False
    if not e.is_rdyck () :
        return False

    ad, bd, pd = d.a, d.b, d.p
    ae, be, pe = e.a, e.b, e.p

    if ad != ae or bd != be :
        return False

    for i in range (ad + bd - 1) :
        ld = pd [:i]
        le = pe [:i]
        rd = pd [i+2:]
        re = pe [i+2:]

        if ld == le and rd == re :
            if pd[i] == 0 and pd[i+1] == 1 :
                if pe[i] == 1 and pe[i+1] == 0 :
                    return True
            else :
                return False
        
    return False