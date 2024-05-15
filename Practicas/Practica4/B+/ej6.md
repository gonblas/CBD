**Arbol B+ de orden M = 5 con política de resolución de underflow derecha.**
|Características|
|:----|
|Max. Hijos: $M = 5$|
|Min. Hijos: $\lfloor M/2 \rfloor = 2$|
|Max. Claves: $M - 1 = 4$|
|Min. Claves: $\lfloor M/2 \rfloor - 1 = 1$|

**Arbol Inicial:**

    Nodo 0 (i, 4 elemento/s) 2(23)1(54)3(62)4(79)5
        Nodo 2 (h, 4 elemento/s) (18) (20) (21) (22) -> 1
        Nodo 1 (h, 4 elemento/s) (23) (26) (33) (38) -> 3
        Nodo 3 (h, 1 elemento/s) (54) -> 4
        Nodo 4 (h, 2 elemento/s) (62) (63) -> 5
        Nodo 5 (h, 3 elemento/s) (79) (80) (91) -> -1

- **Op +19:** L0, L2, E2, E6, E7, E8, E0

        Nodo 0 (i, 4 elemento/s) 2(23)1(54)3(62)4(79)5

            Nodo 7 (i, 2 elemento/s) 2(20)6(23)1

                Nodo 2 (h, 2 elemento/s) (18) (19) -> 6

                Nodo 6 (h, 3 elemento/s) (20) (21) (22) -> 1

                Nodo 1 (h, 4 elemento/s) (23) (26) (33) (38) -> 3

            Nodo 8 (i, 2 elemento/s) 3(62)4(79)5

                Nodo 3 (h, 1 elemento/s) (54) -> 4

                Nodo 4 (h, 2 elemento/s) (62) (63) -> 5

                Nodo 5 (h, 3 elemento/s) (79) (80) (91) -> -1


- **Op +25:** L0, L7, L1, E1, E9, E7

        Nodo 0 (i, 1 elemento/s) 7(54)8

            Nodo 7 (i, 3 elemento/s) 2(20)6(23)1(26)9

                Nodo 2 (h, 2 elemento/s) (18) (19) -> 6

                Nodo 6 (h, 3 elemento/s) (20) (21) (22) -> 1

                Nodo 1 (h, 2 elemento/s) (23) (25) -> 9

                Nodo 9 (h, 4 elemento/s) (26) (33) (38) -> 3

            Nodo 8 (i, 2 elemento/s) 3(62)4(79)5

                Nodo 3 (h, 1 elemento/s) (54) -> 4

                Nodo 4 (h, 2 elemento/s) (62) (63) -> 5

                Nodo 5 (h, 3 elemento/s) (79) (80) (91) -> -1


- **Op -63:** L0, L8, L4, E4

        Nodo 0 (i, 1 elemento/s) 7(54)8

            Nodo 7 (i, 3 elemento/s) 2(20)6(23)1(26)9

                Nodo 2 (h, 2 elemento/s) (18) (19) -> 6

                Nodo 6 (h, 3 elemento/s) (20) (21) (22) -> 1

                Nodo 1 (h, 2 elemento/s) (23) (25) -> 9

                Nodo 9 (h, 4 elemento/s) (26) (33) (38) -> 3

            Nodo 8 (i, 2 elemento/s) 3(62)4(79)5

                Nodo 3 (h, 1 elemento/s) (54) -> 4

                Nodo 4 (h, 1 elemento/s) (62) -> 5

                Nodo 5 (h, 3 elemento/s) (79) (80) (91) -> -1


- **Op -62:** L0, L8, L4, L5, E4, E5, E8

        Nodo 0 (i, 1 elemento/s) 7(54)8

            Nodo 7 (i, 3 elemento/s) 2(20)6(23)1(26)9

                Nodo 2 (h, 2 elemento/s) (18) (19) -> 6

                Nodo 6 (h, 3 elemento/s) (20) (21) (22) -> 1

                Nodo 1 (h, 2 elemento/s) (23) (25) -> 9

                Nodo 9 (h, 4 elemento/s) (26) (33) (38) -> 3

            Nodo 8 (i, 2 elemento/s) 3(62)4(80)5

                Nodo 3 (h, 1 elemento/s) (54) -> 4

                Nodo 4 (h, 1 elemento/s) (79) -> 5

                Nodo 5 (h, 3 elemento/s) (80) (91) -> -1
