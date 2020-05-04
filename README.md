1 - Permutations
    Fichiers : 
        * perm.sage
        * tests_perm.sage
    Test de cyclicité (représente une bijection circulaire)
    Découpage d'une permutation en ses blocs (cycles)
    Composition de 2 permutations
    Génération de la permutation inverse
    Généraiton des permutations de {1, ..., n}
    Génération du code d'une permutation (nombre minimal de transpositions dans sa décomposition)
    Relation de couverture sur les codes des permutations

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

9 - Posets
    Fichier :
        * posets.sage
    Génération de posets exemples des objets ci-avant par leurs relations de couverture

10 - Cycles
    Fichiers :
        * cycle.sage
        * tests_cycle.sage
    Forme (M, c, m)
        * M : ensemble
        * c : bijection cyclique sur M
        * m : #M
    Génération de la trace d'un cycle sur A inclus dans M
    Calcul de la distance entre 2 points du cycle
    Tests de croisement entre paires et parties d'une partition de M
    Test d'adjacence de deux parties d'une partition de M
    Test de correspondance d'un cycle à une partition non-croisée
    Génération de la partition non-croisée la plus fine possible à partir d'une partition quelconque
    Tests de serrage / dilution
    Composition d'un cycle et d'une partition de M
    Génération de la lacune d'un cycle par A inclus dans M
    Générations des lacunes d'un cycle par une partition de M
    Génération de l'arc d'un cycle par A inclus dans M
    Génération des arcs d'un cycle par une partition de M
    Génération de la trace des arcs d'un cycles

11 - Chemins de Dyck rationnels
    Fichiers :
        * rdyck.sage
        * tests_rdyck.sage
    Forme (a, b, p)
        * a et b premiers entre eux
        * pente y = a/b x
        * p : pas 0 (Est) ou 1 (Nord)
    Génération de la réprésentation d'un chemin de Dyck rationnel sous forme de liste
    Calcul de la liste des coordonnées d'un chemin de Dyck rationnel
    Affichage d'un chemin de Dyck rationnel
    Génération des a, b - chemins de Dyck rationnels
    Calcul des parcours verticaux d'un chemin de Dyck rationnel
    Calcul des vallées d'un chemin de Dyck rationnel (angles droits orientés Nord-Ouest)
    Calcul des lasers d'un chemin de Dyck rationnel ( segments parallèles à l'axe partant d'une vallée)
    Calcul des hauteurs de chaque pas Est d'un chemin de Dyck rationnel
    Génération des partitions non-croisées P et Q correspondant à un chemin de Dyck rationnel
    Calcul du chemin transposé

12 - Partitions non-croisées rationnelles
    Fichiers :
        * abpnc.sage
        * tests_abpnc.sage
    Forme (a, b, P, Q)
        * a et b premiers entre eux
        * |P| = |Q| = b - 1
        * P et Q : pnc mutuellement non-croisées
    Test de non-croisement mutuel entre deux partitions non-croisées
    Génération des paires de pnc mutuellement non-croisées de {1, ..., a}
    Génération des a, b - partitions non-croisées rationnelles