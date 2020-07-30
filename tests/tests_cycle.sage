load ../code/cycle.sage

# TESTS CYCLE
print ("Tests Cycle")

M1 = ['a', 'b', 'c', 'd']
c1 = [4, 3, 1, 2]
c2 = [3, 2, 4, 1]
m1 = 4
C1 = Cycle (M1, c1, m1)
C2 = Cycle (M1, c2, m1)
print (C1.is_cycle ())
print (C2.is_cycle ())
print ()

A1 = ['a', 'c', 'd']
x1 = 'a'
dx1 = cycle_d (C1, A1, x1)
C3 = cycle_d_all (C1, A1)
print (dx1)
print (C3.M, C3.c)
print (C3.is_cycle ())
print ()

for s in Subsets (M1, 2) :
    s = sorted (s)
    e = s [0]
    f = s [1]
    print (e, f, dist (C1, e, f), dist (C1, f, e))
print ()

for s in Subsets (M1, 2) :
    xy = sorted (s)
    x = xy [0]
    y = xy [1]

    uv = copy (M1)
    uv.remove (x)
    uv.remove (y)
    u = uv [0]
    v = uv [1]
    print (x, y, u, v, paires_croisees (C1, x, y, u, v))
print ()

M4 = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
c4 = [5, 6, 8, 1, 7, 3, 2, 4]
m4 = 8
C4 = Cycle (M4, c4, m4)
A4 = ['a', 'b', 'g']
B4 = ['c', 'd', 'h']
B5 = ['d', 'e', 'f']
print (parts_non_croisees (C4, A4, B4))
print (parts_non_croisees (C4, A4, B5))
print ()

B6 = ['c', 'd', 'f']
print (parts_nc_adj (C4, A4, B4))
print (parts_nc_adj (C4, A4, B6))
print ()

P1 = [A4, B6, ['e'], ['h']]
P2 = [A4, B6, ['e', 'h']]
print (cycle_pnc (C4, P1))
print (cycle_pnc (C4, P2))
print ()

P3 = [A4, B4, ['e', 'f']]
print (make_pnc (C4, P3))
print ()

P4 = [['a', 'f', 'g'], ['b'], ['c', 'd'], ['e'], ['h']]
print (is_serree (C4, P3))
print (is_serree (C4, P4))
print ()

print (cycle_comp (C4, P4))
print ()

print (is_diluee (C4, P3))
print (is_diluee (C4, P4))
print ()

print (lacune (C4, A4))
print (lacunes (C4, P4))
print ()

print (arc (C4, A4))
print (arcs (C4, P3))
print ()

C5 = part_arcs (C4, P3)
print (C5.M, C5.c)
