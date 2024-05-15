**Arbol B de orden M = 6 con política de resolución de underflow izquierda.**
|Características|
|:----|
|Max. Hijos: $M = 6$|
|Min. Hijos: $\lfloor M/2 \rfloor = 3$|
|Max. Claves: $M - 1 = 5$|
|Min. Claves: $\lfloor M/2 \rfloor - 1 = 2$|

**Arbol Inicial:**

    Nodo 0: 5, i, 1(38)2(60)3(87)4(187)5(300)6

        Nodo 1: 2, h, (12)(31)

        Nodo 2: 2, h, (50)(53)

        Nodo 3: 2, h, (65)(77)

        Nodo 4: 5, h, (96)(99)(103)(115)(120)

        Nodo 5: 2, h, (224)(249)

        Nodo 6: 3, h, (329)(345)(486)



* **Op -65:** L0, L3, L2, E2, E0 -- 3 Libre

        Nodo 0: 5, i, 1(38)2(87)4(187)5(300)6

            Nodo 1: 2, h, (12)(31)

            Nodo 2: 4, h, (50)(53)(60)(77)

            Nodo 4: 5, h, (96)(99)(103)(115)(120)

            Nodo 5: 2, h, (224)(249)
            
            Nodo 6: 3, h, (329)(345)(486)


* **Op +97:** L0, L4, E3, E4, E0

        Nodo 0: 5, i, 1(38)2(87)3(103)4(187)5(300)6

            Nodo 1: 2, h, (12)(31)

            Nodo 2: 4, h, (50)(53)(60)(77)

            Nodo 3: 3, h, (96)(97)(99)

            Nodo 4: 2, h, (115)(120)

            Nodo 5: 2, h, (224)(249)
            
            Nodo 6: 3, h, (329)(345)(486)


* **Op -187:** L0, L5, L4, E4, E0 -- 5 Libre

        Nodo 0: 5, i, 1(38)2(87)3(103)4(300)6

            Nodo 1: 2, h, (12)(31)

            Nodo 2: 4, h, (50)(53)(60)(77)

            Nodo 3: 3, h, (96)(97)(99)

            Nodo 4: 2, h, (115)(120)(224)(249)
            
            Nodo 6: 3, h, (329)(345)(486)