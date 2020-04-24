def generate_pnc (n) :
    if n == 0 :
        yield set ({frozenset ({})})
    else :
        S = generate_pnc (n - 1)
        for e in S :
            print (e)
            S_l = set ({})
            S_r = e
            print (S_l)
            print (S_r)
            for e2 in e :
                S_r = S_r - e2
                tmp = e2.union ({n})                
                yield (S_l.union (set ({tmp}).union (S_r)))
                S_l = S_l + {e2}

g = generate_pnc (4)
print (g.send (None))
while True :
    try :
        print (g.send (0))
    except :
        break

def generate_fp (n) :
    k = 0
    if n == 0 :
        yield []
    else :
        L = generate_fp (n - 1)
        for l in L :
            for i in (1..n) :
                for j in range (len (l) + 1) :
                    r = l[:j] + [i] + l[j:]
                    if len (r) == n :
                        k = k + 1
                        yield r
    print (k)