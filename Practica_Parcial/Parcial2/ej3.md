3. Dado el siguiente archivo dispersado, dibuje los estados sucesivos para las siguiente raciones: +18,+34,-25,-11.
   Función de dispersión: Clave **MOD** 11. Técnica de resolución de colisiones: Saturación progresiva encadenada.
   Calcule la densidad de empaquetamiento y justifique brevemente cada operación.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 11       |
| 1         | 2      | 12       |
| 2         | -1     | 23       |
| 3         | 5      | 25       |
| 4         | -1     | 37       |
| 5         | 6      | 47       |
| 6         | -1     | 58       |
| 7         | -1     |          |
| 8         | -1     |          |
| 9         | -1     |          |
| 10        | -1     |          |

- **Op +18:** 18 _MOD_ 11 = 7. Como la dirección 7 esta libre entonces coloco la clave alli.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 11       |
| 1         | 2      | 12       |
| 2         | -1     | 23       |
| 3         | 5      | 25       |
| 4         | -1     | 37       |
| 5         | 6      | 47       |
| 6         | -1     | 58       |
| 7         | -1     | 18       |
| 8         | -1     |          |
| 9         | -1     |          |
| 10        | -1     |          |

$$DE = \frac{8}{11}\cdot 100\% = 72.72\%$$

- **Op +34:** 34 _MOD_ 11 = 1. Como en la dirección 1 el registro esta ocupado por un sinonimo del 34 entonces debemos ubicar al 34 en la primer dirección libre desde la dirección 1 recorriendo secuencialmente, cambiando luego los enlaces de ambas direcciones.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 11       |
| 1         | 8      | 12       |
| 2         | -1     | 23       |
| 3         | 5      | 25       |
| 4         | -1     | 37       |
| 5         | 6      | 47       |
| 6         | -1     | 58       |
| 7         | -1     | 18       |
| 8         | 2      | 34       |
| 9         | -1     |          |
| 10        | -1     |          |

$$DE = \frac{9}{11}\cdot 100\% = 81.81\%$$

- **Op -25:** 25 _MOD_ 11 = 3. Como la clave 25 se encuentra en su dirección base podemos eliminarla ubicando alli a la clave almacenada en la direccón que indica el enlace de la dirección base de ambos sinonimos (dirección 3).

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 11       |
| 1         | 8      | 12       |
| 2         | -1     | 23       |
| 3         | 6      | 47       |
| 4         | -1     | 37       |
| 5         | -1     |          |
| 6         | -1     | 58       |
| 7         | -1     | 18       |
| 8         | 2      | 34       |
| 9         | -1     |          |
| 10        | -1     |          |

$$DE = \frac{8}{11}\cdot 100\% = 72.72\%$$

- **Op -11:** 11 _MOD_ 11 = 0. Como la clave 11 se encuentra en su dirección base podemos eliminarla, como actualmente no existen sinonimos en la tabla, alli termina la operación.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     |          |
| 1         | 8      | 12       |
| 2         | -1     | 23       |
| 3         | 6      | 47       |
| 4         | -1     | 37       |
| 5         | -1     |          |
| 6         | -1     | 58       |
| 7         | -1     | 18       |
| 8         | 2      | 34       |
| 9         | -1     |          |
| 10        | -1     |          |

$$DE = \frac{7}{11}\cdot 100\% = 63.63\%$$
