**Arbol B de orden M = 5 con política de resolución de underflow derecha.**
|Características|
|:----|
|Max. Hijos: $M = 5$|
|Min. Hijos: $\lfloor M/2 \rfloor = 2$|
|Max. Claves: $M - 1 = 4$|
|Min. Claves: $\lfloor M/2 \rfloor - 1 = 1$|

**Arbol Inicial:**

    Nodo 0: ,4 i, 2(100)3(130)1(145)4(200)5

        Nodo 2: 2, h, (88)(89)

        Nodo 3: 2, h, (110)(112)

        Nodo 1: 2, h, (135)(136)

        Nodo 4: 3, h, (146)(147)(148)

        Nodo 5: 2, h, (201)(207)




* **Op +150:** L0, L4, E4

        Nodo 0: ,4 i, 2(100)3(130)1(145)4(200)5

            Nodo 2: 2, h, (88)(89)

            Nodo 3: 2, h, (110)(112)

            Nodo 1: 2, h, (135)(136)

            Nodo 4: 3, h, (146)(147)(148)(150)  

            Nodo 5: 2, h, (201)(207)




* **Op +157:** L0, L4, E4, E6, E7, E8, E0

        Nodo 0: ,4 i, (145)

            Nodo 7: 2, i, 2(100)3(130)1

                Nodo 2: 2, h, (88)(89)

                Nodo 3: 2, h, (110)(112)

                Nodo 1: 2, h, (135)(136)

            Nodo 8: 2, i, 4(148)4(200)5

                Nodo 4: 2, h, (146)(147)

                Nodo 6: 2, h, (150)(157)

                Nodo 5: 2, h, (201)(207)


* **Op -135:** L0, L7, L1, E1

        Nodo 0: ,4 i, (145)

            Nodo 7: 2, i, 2(100)3(130)1

                Nodo 2: 2, h, (88)(89)

                Nodo 3: 2, h, (110)(112)

                Nodo 1: 1, h, (136)

            Nodo 8: 2, i, 4(148)4(200)5

                Nodo 4: 2, h, (146)(147)

                Nodo 6: 2, h, (150)(157)

                Nodo 5: 2, h, (201)(207)


* **Op -136:** L0, L7, L1, L3, E1, E3

        Nodo 0: ,4 i, (145)

            Nodo 7: 2, i, 2(100)3(112)1

                Nodo 2: 2, h, (88)(89)

                Nodo 3: 1, h, (110)

                Nodo 1: 1, h, (130)

            Nodo 8: 2, i, 4(148)4(200)5

                Nodo 4: 2, h, (146)(147)

                Nodo 6: 2, h, (150)(157)

                Nodo 5: 2, h, (201)(207)


* **Op -145:** L0, L8, L4, E4, E0

        Nodo 0: ,4 i, (146)

            Nodo 7: 2, h, 2(100)3(112)1

                Nodo 2: 2, h, (88)(89)

                Nodo 3: 2, h, (110)

                Nodo 1: 1, h, (130)

            Nodo 8: 2, h, 4(148)4(200)5

                Nodo 4: 1, h, (147)

                Nodo 6: 2, h, (150)(157)

                Nodo 5: 2, h, (201)(207)