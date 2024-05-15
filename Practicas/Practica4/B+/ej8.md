**Arbol B+ de orden M = 4 con política de resolución de underflow derecha.**
|Características|
|:----|
|Max. Hijos: $M = 4$|
|Min. Hijos: $\lfloor M/2 \rfloor = 2$|
|Max. Claves: $M - 1 = 3$|
|Min. Claves: $\lfloor M/2 \rfloor - 1 = 1$|

**Arbol Inicial:**

    Nodo 0: 1, i, 1(65)2
        Nodo 1: 2, i, 3(33)4(55)5
            Nodo 3: 3, h, (20)(22)(23) -> 4
            Nodo 4: 3, h, (34)(35)(37) -> 5
            Nodo 5: 3, h, (55)(62)(63) -> 6
        Nodo 2: 1, i, 6(79)7
            Nodo 6: 3, h, (74)(75)(76) -> 7
            Nodo 7: 1, h, (80) -> -1


- **Op -80:** L0, L2, L7, E6, E7, E2

        Nodo 0: 1, i, 1(65)2
            Nodo 1: 2, i, 3(33)4(55)5
                Nodo 3: 3, h, (20)(22)(23) -> 4
                Nodo 4: 3, h, (34)(35)(37) -> 5
                Nodo 5: 3, h, (55)(62)(63) -> 6
            Nodo 2: 1, i, 6(76)7
                Nodo 6: 3, h, (74)(75) -> 7
                Nodo 7: 1, h, (76) -> -1

- **Op -33:** L0, L1, L4. No es una clave.

        Nodo 0: 1, i, 1(65)2
            Nodo 1: 2, i, 3(33)4(55)5
                Nodo 3: 3, h, (20)(22)(23) -> 4
                Nodo 4: 3, h, (34)(35)(37) -> 5
                Nodo 5: 3, h, (55)(62)(63) -> 6
            Nodo 2: 1, i, 6(76)7
                Nodo 6: 2, h, (74)(75) -> 7
                Nodo 7: 1, h, (76) -> -1

- **Op +39:** L0, L1, L4, E4, E8, E1

        Nodo 0: 1, i, 1(65)2
            Nodo 1: 3, i, 3(33)4(37)8(55)5
                Nodo 3: 3, h, (20)(22)(23) -> 4
                Nodo 4: 2, h, (34)(35) -> 8
                Nodo 8: 2, h, (37)(39) -> 5
                Nodo 5: 3, h, (55)(62)(63) -> 6
            Nodo 2: 1, i, 6(76)7
                Nodo 6: 2, h, (74)(75) -> 7
                Nodo 7: 1, h, (76) -> -1

- **Op +57:**

        Nodo 0: 1, i, 1(65)2
            Nodo 1: 3, i, 3(33)4(37)8(55)5
                Nodo 3: 3, h, (20)(22)(23) -> 4
                Nodo 4: 2, h, (34)(35) -> 8
                Nodo 8: 2, h, (37)(39) -> 5
                Nodo 5: 3, h, (55)(62)(63) -> 6
            Nodo 2: 1, i, 6(76)7
                Nodo 6: 2, h, (74)(75) -> 7
                Nodo 7: 1, h, (76) -> -1