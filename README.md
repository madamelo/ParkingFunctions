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
    Minimums du complément de Kreweras
    Tailles des blocs du complément de Kreweras
    Génération du label d'une relation de couverture
    Génération de la rotation d'une partition non-croisée
    Génération de la rotation inverse d'une partition non-croisée ( = double application de Kreweras )

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
    Calcul du rang d'une fonction de parking
    Génération des fonctions de parking de longueur n
    Génération des fonctions de parking primitives de longueur n
    Bijection entre partitions non-croisées et fonctions de parking
    primitives
    Application d'une permutation à une fonction de parking
    Bijection entre fonctions de parking et 2-partitions non-croisées
    Relation de couverture (basée sur la bijection ci-dessus)

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
    Génération des k-chaînes de fonctions de parking
    TODO : eviter doublons

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
    Relation de couverture

9 - Posets
    Fichier :
        * posets.sage
    Génération de posets exemples des objets ci-avant et ci-après par leurs relations de couverture

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
    Génération de la rotation d'un chemin de Dyck rationnel

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
    Génération de la rotation d'une partition non-croisée rationnelle
    Calcul de la séquence de rang d'une partition non-croisée rationnelle
    Génération du chemin de Dyck rationnel associé à une partition non-croisée raitonnelle

13 - Fonctions de parking rationnelles
    Fichiers :
        * abfp.sage
        * tests_abfp.sage
    Forme (a, b, P, Q, fP, fQ)
        * a et b premiers entre eux
        * P et Q mutuellement non-croisées
        * fP : bloc de P -> sous-ensemble de {1, ..., a}
        * fQ : bloc de Q -> sous-ensemble de {1, ..., a}
        * fP (P) + fQ (Q) = {1, ..., a}
        * (P, Q) : a, b - partition non-croisée
        * | fP (B) | = rang (B)
        * | fQ (B) | = rang (B)
    Générations des partitions de {1, ..., a} de taille k AVEC parts vides
    Génération des a, b - fonctions de parking

14 - Fonctions de parking à pente rationnelle
    Fichiers :
        * abfpp.sage
        * tests_abfpp.sage
    Forme (a, b, p)
        * a et b premiers entre eux
        * p' = p triée = (b1, ..., ba)
        * bi <= (a / b) (i - 1) + 1
    Générations des a, b - fonctions de parking à pente rationnelle
    Application d'une permutation à une fonction de parking à pente rationnelle
    Bijection entre fonctions de parking à pente rationnelle et fonctions de parking rationnelle
    Génération du chemin de Dyck rationnel associé à une fonction de parking à pente rationnelle (+ labels)

15 - Partitions non-croisées efficaces
    Fichiers :
        * eff_pnc.sage
        * tests_eff_pnc.sage
    Forme :
        * sizes = dictionnaire où un bloc est représenté par min : taille
    Bijection entre partitions non-croisées et partitions non-croisées efficaces
    Relation de couverture
    Génération du complément de Kreweras (en passant par la partition non-croisée)

16 - Enumération de chaînes selon Edelman
    Fichiers :
        * edelman.sage
        * tests_edelman.sage
    Calcul de sigma_b (m)
    Tri selon sigma_b (m)
    Calcul de sigma^_b (m)
    Bon parenthésage
    PNC associée à un bon parenthésage
    Génération des PNC à k blocs
    Bijection entre couples de parenthésages (L, R) et couples (P, b) avec P une partition, et b son premier élément pour le tri
    Calcul du rang
    Relation de couverture
    Génération et comptage des chaînes strictes pour une liste de rangs donnée
    Génération et comptage des chaînes maximales
    Comptage des chaînes faibles de longueur donnée
    Test de k-divisibilité
    Rang par k-divisibilité
    Génération des PNC k-divisibles de {1, ..., m * k} à h blocs
    Comptage des PNC k-divisibles de {1, ..., m * k} à h blocs
    Passage d'une PNC sur {1, ..., m} à une PNC k-divisible sur {1, ..., k*m}
    Génération et comptage des chaînes k-divisibles strictes pour une liste de rangs donnée
    Génération et comptage des chaînes k-divisibles maximales
    Comptage des chaînes k-divisibles faibles de longueur donnée

    