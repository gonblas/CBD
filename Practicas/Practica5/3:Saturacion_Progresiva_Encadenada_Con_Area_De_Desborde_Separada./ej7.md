
**7.** Dado el siguiente archivo dispersado, dibuje los estados sucesivos para las siguientes operaciones: +36, +62, -8, -41. Función de dispersión: **Clave MOD 7**. Técnica de resolución de colisiones: **Saturación progresiva encadenada con área de desborde separada.** Justifique brevemente cada operación.

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 14       |          |
| 1         | -1     | 8        | 22       |
| 2         | -1     |          |          |
| 3         | -1     | 24       |          |
| 4         | 1      | 11       | 18       |
| 5         | -1     |          |          |
| 6         | 2      | 20       | 27       |

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 34       |
| 1         | -1     | 60       |
| 2         | 0      | 41       |
| 3         | -1     |          |
| 4         | -1     |          |

## Resolución

* **Op +36:** 36 *MOD* 7 = 1 ➔ Como en la dirección 1 los registros estan ocupados almaceno la clave en el área de desborde separada, en el primer registro libre (el de la dir. 3), y modifico los enlaces correspondientes. 

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 14       |          |
| 1         | 3      | 8        | 22       |
| 2         | -1     |          |          |
| 3         | -1     | 24       |          |
| 4         | 1      | 11       | 18       |
| 5         | -1     |          |          |
| 6         | 2      | 20       | 27       |

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 34       |
| 1         | -1     | 60       |
| 2         | 0      | 41       |
| 3         | -1     | 36       |
| 4         | -1     |          |



* **Op +62:** 62 *MOD* 7 = 6 ➔ Como en la dirección 6 los registros estan ocupados almaceno la clave en el área de desborde separada, en el primer registro libre (el de la dir. 4), y modifico los enlaces correspondientes. 

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 14       |          |
| 1         | 3      | 8        | 22       |
| 2         | -1     |          |          |
| 3         | -1     | 24       |          |
| 4         | 1      | 11       | 18       |
| 5         | -1     |          |          |
| 6         | 4      | 20       | 27       |

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 34       |
| 1         | -1     | 60       |
| 2         | 0      | 41       |
| 3         | -1     | 36       |
| 4         | 2      | 62       |



* **Op -8:** 8 *MOD* 7 = 1 ➔ Borro el registro con valor 8, y pongo alli el valor 22. El área de desborde separada queda igual.

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 14       |          |
| 1         | 3      | 22       |          |
| 2         | -1     |          |          |
| 3         | -1     | 24       |          |
| 4         | 1      | 11       | 18       |
| 5         | -1     |          |          |
| 6         | 4      | 20       | 27       |

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 34       |
| 1         | -1     | 60       |
| 2         | 0      | 41       |
| 3         | -1     | 36       |
| 4         | 2      | 62       |



* **Op -41:** 41 *MOD* 7 = 6 ➔ Elimino el valor 41, el cual se encuentra en el área de desborde separada, y modifico los enlaces pertinentes.

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 14       |          |
| 1         | 3      | 22       |          |
| 2         | -1     |          |          |
| 3         | -1     | 24       |          |
| 4         | 1      | 11       | 18       |
| 5         | -1     |          |          |
| 6         | 4      | 20       | 27       |

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 34       |
| 1         | -1     | 60       |
| 2         | -1     |          |
| 3         | -1     | 36       |
| 4         | 0      | 62       |



**Densidad de empaquetamiento:** Se calcula una densidad por tabla:

* Tabla Main: 

    $$DE = \frac{\#registros}{RPN\cdot n}\cdot 100\% = \frac{7}{7\cdot 2}\cdot 100\% = 50\%$$


* Tabla de desborde: 

    $$DE = \frac{\#registros}{RPN\cdot n}\cdot 100\% = \frac{4}{5\cdot 1}\cdot 100\% = 80\%$$