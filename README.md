1 - Permutations
    Fichiers : 
        * perm.sage
        * tests_perm.sage
    Découpage d'une permutation en ses blocs (cycles)
    Composition de 2 permutations
    Génération de la permutation inverse
    Génération du code d'une permutation (nombre minimal de transpositions dans sa décomposition)

2 - Partitions non-croisées
    Fichiers : 
        * pnc.sage
        * tests_pnc.sage
    Génération des partitions non-croisées de {1, ..., n}
    Relation de couverture
    Génération de la permutation associée à une partition non-croisée
    Complément de Kreweras
    Génération du label d'une relation de couverture

3 - 2-partitions non-croisées
    Fichiers :
        * dpnc.sage
        * tests_dpnc.sage
    Forme : (pi, rho, lam)
        * pi : partition non-croisée de {1, ..., n}
        * rho : partition de {1, ..., n}
        * lam : bijection entre les blocs de pi et les blocs de rho tq 2 blocs associés sont de même cardinal
    Calcul du rang d'une 2-partition non-croisée (#pi - 1)
    Générations des 2-partitions non-croisées de {1, ..., n}
    Relation de couverture
    Application d'une permutation à une 2-partition non-croisée

4 - 2-partitions non-croisées adaptées à l'espace de parking
    Fichiers :
        * epnc.sage
        * tests_epnc.sage
    Forme (pi, sig)
        * pi : partition non-croisée de {1, ..., n}
        * sig : permutation de {1, ..., n}
    Cette forme est équivalente aux 2-partitions non-croisées
    Calcul du rang d'une 2-partition non-croisée adaptée (#pi - 1)
    Génération des 2-partitions non-croisées adaptées de {1, ..., n}
    Relation de couverture
    Bijection entre EPNC et DPNC
    Génération du label d'une relation de couverture
    Relation d'ordre sur les labels couvrant une EPNC

5 - Fonctions de Parking
    Fichiers :
        * fp.sage
        * tests_fp.sage
    Test de primitivité ( = fonction de parking non-décroissante)
    Génération des fonctions de parking de longueur n
    Génération des fonctions de parking primitives de longueur n
    Application d'une permutation à une fonction de parking
    Génération de la fonction de parking associée à une 2-partition non-croisée

6 - Arbres de Parking
    Fichiers :
        * fptree.sage
        * tests_fptree.sage
    Génération des arbres de parking de {1, ..., n}
    Affichage d'un arbre de parking
    Parcours d'un arbre de parking (préfixe)
    Bijection entre fonctions de parking et arbres de parking

7 - Chaînes de Fonctions de Parking
    Fichiers :
        * cfp.sage
        * tests_cfp.sage
    Génération des k-chaînes de fonctions de parking : TODO (relation de couverture ???)

8 - Chemins de Dyck décorés
    Fichiers : 
        * ddyck.sage
        * tests_ddyck.sage
    Forme (W, labels)
        * W : mot de Dyck de longueur 2n
        * labels : permutation de {1, ..., n}
    Affichage d'un chemin de Dyck décoré
    Génération de la liste correspondant à un chemin de Dyck décoré
    Bijection entre fonctions de parking et chemins de Dyck décorés
    Relation de couverture : TODO