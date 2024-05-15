**Arbol B de orden M = 6 con política de resolución de underflow izquierda y derecha.**
|Características|
|:----|
|Max. Hijos: $M = 6$|
|Min. Hijos: $\lfloor M/2 \rfloor = 3$|
|Max. Claves: $M - 1 = 5$|
|Min. Claves: $\lfloor M/2 \rfloor - 1 = 2$|

**Arbol Inicial:**

    Nodo 0: 5, i, 2(60)1(90)3(107)4(287)5(400)6

        Nodo 2: 2, h, (12)(22)

        Nodo 1: 2, h, (63)(66)

        Nodo 3: 2, h, (94)(95)

        Nodo 4: 3, h, (116)(129)(280)

        Nodo 5: 2, h, (328)(358)

        Nodo 6: 5, h, (403)(404)(506)(518)(620)

- **Op +425:** L0, L6, E6, E7, E8, E9, E0

        Nodo 0: 1, i, (8)287(9)

            Nodo 8: 3, i, 2(60)1(90)3(107)4

                Nodo 2: 2, h, (12)(22)

                Nodo 1: 2, h, (63)(66)

                Nodo 3: 2, h, (94)(95)

                Nodo 4: 3, h, (116)(129)(280)

            Nodo 9: 2, i, 5(400)6(506)7

                Nodo 5: 2, h, (328)(358)

                Nodo 6: 2, h, (403)(404)

                Nodo 7: 2, h, (518)(620)

- **Op -60:** L0, L8, L1, E2, E8 -- 1 Libre

        Nodo 0: 1, i, (8)287(9)

            Nodo 8: 3, i, 2(90)3(107)4

                Nodo 2: 2, h, (12)(22)(63)(66)

                Nodo 3: 2, h, (94)(95)

                Nodo 4: 3, h, (116)(129)(280)

            Nodo 9: 2, i, 5(400)6(506)7

                Nodo 5: 2, h, (328)(358)

                Nodo 6: 2, h, (403)(404)

                Nodo 7: 2, h, (518)(620)

- **Op -22:** L0, L8, L2, E2

        Nodo 0: 1, i, (8)287(9)

            Nodo 8: 3, i, 2(90)3(107)4

                Nodo 2: 2, h, (12)(63)(66)

                Nodo 3: 2, h, (94)(95)

                Nodo 4: 3, h, (116)(129)(280)

            Nodo 9: 2, i, 5(400)6(506)7

                Nodo 5: 2, h, (328)(358)

                Nodo 6: 2, h, (403)(404)

                Nodo 7: 2, h, (518)(620)