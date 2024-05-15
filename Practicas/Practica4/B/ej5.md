**Arbol B de orden M = 6 con política de resolución de underflow derecha.**
|Características|
|:----|
|Max. Hijos: $M = 6$|
|Min. Hijos: $\lfloor M/2 \rfloor = 3$|
|Max. Claves: $M - 1 = 5$|
|Min. Claves: $\lfloor M/2 \rfloor - 1 = 2$|

**Arbol Inicial:**

    Nodo 0: (i, 3 elem.), 1(85)2(379)3(755)4

        Nodo 1: (h, 2 elem.), (14)(80)

        Nodo 2: (h, 2 elem.), (216)(300)

        Nodo 3: (h, 3 elem.), (601)(682)(695)

        Nodo 4: (h, 5 elem.), (771)(810)(853)(907)(964)

- **Op +756:** L0, L4, E4, E5, E0

        Nodo 0: (i, 4 elem.), 1(85)2(379)3(755)4(853)5

            Nodo 1: (h, 2 elem.), (14)(80)

            Nodo 2: (h, 2 elem.), (216)(300)

            Nodo 3: (h, 3 elem.), (601)(682)(695)

            Nodo 4: (h, 3 elem.), (756)(771)(810)

            Nodo 5: (h, 2 elem.), (907)(964)

- **Op -300:** L0, L2, L3, E2, E3, E0

        Nodo 0: (i, 4 elem.), 1(85)2(601)3(755)4(853)5

            Nodo 1: (h, 2 elem.), (14)(80)

            Nodo 2: (h, 2 elem.), (216)(379)

            Nodo 3: (h, 2 elem.), (682)(695)

            Nodo 4: (h, 3 elem.), (756)(771)(810)

            Nodo 5: (h, 2 elem.), (907)(964)

- **Op -85:** L0, L2, L3, E2, E0 -- 3 Libre

        Nodo 0: (i, 3 elem.), 1(216)3(755)4(853)5

            Nodo 1: (h, 2 elem.), (14)(80)

            Nodo 2: (h, 4 elem.), (379)(601)(682)(695)

            Nodo 4: (h, 3 elem.), (756)(771)(810)

            Nodo 5: (h, 2 elem.), (907)(964)