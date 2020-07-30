load ../code/fptree.sage

# TESTS FPT
print ("Tests FPT")

T1 = FPT (
    [1, 2, 3, 4, 5, 6],
    [2, 5],
    [
        FPT (
            [1, 3, 4],
            [1, 3, 4],
            [
                FPT ([], [], []),
                FPT ([], [], []),
                FPT ([], [], [])
            ]
            ),
        FPT (
            [6],
            [6],
            [FPT ([], [], [])]
        )
    ]
)

T2 = FPT (
    [1, 2, 3, 4, 5, 6],
    [2, 5],
    [
        FPT (
            [1, 3, 4, 5],
            [1, 3, 4, 5],
            [
                FPT ([], [], []),
                FPT ([], [], []),
                FPT ([], [], []),
                FPT ([], [], [])
            ]
            ),
        FPT (
            [6],
            [6],
            [FPT ([], [], [])]
        )
    ]
)

T3 = FPT (
    [1, 2, 3, 4, 5, 6],
    [2, 5],
    [
        FPT (
            [1, 3, 5],
            [1, 3, 4],
            [
                FPT ([], [], []),
                FPT ([], [], []),
                FPT ([], [], [])
            ]
            ),
        FPT (
            [6],
            [6],
            [FPT ([], [], [])]
        )
    ]
)

T4 = FPT (
    [1, 2, 3, 4, 5, 6],
    [2, 5],
    [
        FPT (
            [1, 3, 4],
            [1, 3, 4],
            [
                FPT ([], [], []),
                FPT ([], [], [])
            ]
            ),
        FPT (
            [6],
            [6],
            [FPT ([], [], [])]
        )
    ]
)

print (T1.is_FPT ())
print (T2.is_FPT ())
print (T3.is_FPT ())
print (T4.is_FPT ())

T1.pretty_print ()

print (pref (T1))
print (fpt_to_fp (T1))
print ()

L = ParkingFunction ([1, 6, 2, 2, 3, 5, 3])
T5 = fp_to_fpt (L)
T5.pretty_print ()
print ()

T6 = fp_to_fpt (fpt_to_fp (T1))
T6.pretty_print ()
print ()

n = 3
g = generate_fpt (n)
k = 0
for e in g :
    e.pretty_print ()
    print ()
    k = k + 1
print (k)
print ((n + 1)^(n - 1))
