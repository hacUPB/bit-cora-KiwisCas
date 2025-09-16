# RAES

## **1. Prueba de cada requisito de forma independiente**

### Requisito 1: Combinación de estructuras de datos
**Explicación:**  
El programa utiliza dos estructuras de datos diferentes:  
- **`std::vector`** para almacenar las partículas activas en la escena.  
- **`std::stack`** para mantener una pila de partículas eliminadas, que pueden recuperarse más adelante.  

**Prueba realizada:**  
1. Se ejecutó el programa y se presionó la tecla `+` varias veces para agregar partículas → se almacenaron en el vector.  
2. Se presionó la tecla `-` para eliminar partículas → se retiraron del vector y se apilaron en la pila `removed`.  
3. Se presionó `r` para recuperar → las partículas volvieron desde la pila al vector.  

**Evidencia:**  
![Partículas activas y en pila](<VideosYFotos/Captura de pantalla 2025-09-16 105749.png>)
---

### Requisito 2: Interactividad
**Explicación:**  
El usuario interactúa con la obra de arte digital de varias maneras:  
- Movimiento del mouse → cambia la posición del *attractor* (bolita roja).  
- Tecla `+` → agrega partículas nuevas.  
- Tecla `-` → elimina partículas y las apila en la pila.  
- Tecla `r` → recupera partículas desde la pila.  

**Prueba realizada:**  
1. Se movió el mouse a distintas posiciones, observando cómo las partículas seguían la posición del attractor.  
2. Se agregaron y eliminaron partículas, comprobando el cambio en los contadores y en la visualización.  
3. Se recuperaron partículas desde la pila y volvieron a moverse en la escena.  

**Evidencia:**
En caso de que el video no se observe, revisar en la carpeta de [VideosYFotos](C:\Users\thoma\Documents\GitHub\bit-cora-KiwisCas\Actividad4\Reto\VideosYFotos)  
<video controls src="VideosYFotos/Requisito2Video.mp4" title="Requisito2Video"></video>
---

### Requisito 3: Gestión de memoria
**Explicación:**  
Cada partícula se crea dinámicamente con `new`. Para evitar fugas de memoria:  
- Al eliminar con `-`, las partículas se mueven a la pila (`stack`) y no se pierden.  
- Al cerrar la aplicación, el destructor de `ofApp` libera todas las partículas del vector y de la pila, garantizando que no queden fugas.  

**Prueba realizada con Visual Studio 2022:**  
1. Se tomó un **snapshot inicial** al comenzar el programa → ~32 MB de uso de memoria.  
2. Se agregaron partículas (`+`) → la memoria subió (+111 KB).  
3. Se eliminaron partículas (`-`) → la memoria se mantuvo (+39 KB), ya que las partículas no se liberan inmediatamente sino que pasan a la pila.  
4. Se recuperaron partículas (`r`) → la memoria no aumentó significativamente, pues se reutilizaron objetos ya existentes.  
5. Se eliminó y se volvió a agregar varias veces → se observaron pequeños cambios en la memoria pero sin fugas permanentes.  
6. Al cerrar la aplicación, el destructor libera todas las partículas, confirmando que no quedan *memory leaks*.  

**Evidencia:**  
![Capturas de Diagnostico](<VideosYFotos/Captura de pantalla 2025-09-16 105128.png>)
*En la captura se observan los snapshots tomados durante la ejecución. Se aprecia el incremento al agregar, estabilidad al eliminar y recuperar, y ausencia de fugas permanentes.*
---

## **2. Prueba del programa completo**
**Flujo probado:**  
1. Se ejecutó el programa.  
2. Se movió el attractor con el mouse → partículas reaccionaron.  
3. Se agregaron partículas con `+`.  
4. Se eliminaron con `-` (y pasaron a la pila).  
5. Se recuperaron con `r`.  
6. Se cerró el programa → sin fugas de memoria.  

**Evidencias:**  
![Flujo 1 y 2](<VideosYFotos/Captura de pantalla 2025-09-16 105728.png>)
![Flujo 3](<VideosYFotos/Captura de pantalla 2025-09-16 105740.png>)
![Flujo 4](<VideosYFotos/Captura de pantalla 2025-09-16 105749.png>)
![Flujo 5](<VideosYFotos/Captura de pantalla 2025-09-16 105801.png>)
---
