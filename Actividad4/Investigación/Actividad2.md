## **Actividad 2 – Pilas y Colas en Arte Generativo**

---

### **1. Entendiendo la aplicación**

En esta actividad se experimenta con dos estructuras de datos dinámicas: **pila (stack)** y **cola (queue)**. Ambas se implementan manualmente en C++ y se utilizan dentro de OpenFrameworks para representar círculos en pantalla.  

- **Stack (pila):**  
  - Los nodos se insertan en la parte superior (`push`) y se eliminan también desde allí (`pop`), siguiendo el principio **LIFO (Last In, First Out)**.  
  - Al presionar la tecla **a**, se apila un círculo en la posición del mouse.  
  - Al presionar la tecla **d**, se desapila el círculo más reciente.  

- **Queue (cola):**  
  - Los nodos se insertan al final (`enqueue`) y se eliminan desde el frente (`dequeue`), siguiendo el principio **FIFO (First In, First Out)**.  
  - Con la tecla **a** se encola un círculo en la posición actual del mouse.  
  - Con la tecla **d** se desencola el círculo más antiguo.  

En ambos casos, la función `display()` recorre los nodos para dibujarlos en la ventana, y la función `clear()` asegura que toda la memoria dinámica se libere al destruir la estructura.  

---

### **2. Evaluaciones formativas**

Durante el estudio del código y con ayuda del depurador, se realizaron preguntas guiadas y comprobaciones:  

1. **¿Qué ocurre en memoria al crear un nodo con `push` o `enqueue`?**  
   Se confirmó que cada nodo se crea en el *heap* con `new`, lo que garantiza su persistencia mientras no sea eliminado.  

2. **¿Qué pasa si se omite `delete` en `pop` o `dequeue`?**  
   El depurador mostró que los nodos eliminados permanecen ocupando espacio, lo que genera **fugas de memoria**.  

3. **¿Por qué la pila requiere solo un puntero (`top`) mientras que la cola necesita dos (`front` y `rear`)?**  
   Porque la pila siempre inserta y elimina desde el mismo extremo, mientras que la cola necesita diferenciar dónde entran los elementos y desde dónde salen.  

4. **¿Qué sucede al encolar y luego desencolar todos los nodos?**  
   Se verificó que cuando la cola queda vacía, tanto `front` como `rear` apuntan a `nullptr`, garantizando que no existan referencias inválidas.  

---

### **3. Pruebas**

Se diseñaron pruebas para validar el comportamiento de cada estructura:  

- **Stack (pila):**  
  - Apilar cinco círculos con la tecla **a** y desapilar tres con **d**.  
  - Resultado esperado: permanecen en pantalla los dos círculos más antiguos.  
  - Resultado observado: se cumple la regla LIFO correctamente.  

- **Queue (cola):**  
  - Encolar cinco círculos con la tecla **a** y desencolar tres con **d**.  
  - Resultado esperado: permanecen en pantalla los dos círculos más recientes.  
  - Resultado observado: se cumple la regla FIFO correctamente.  

- **Liberación de memoria:**  
  - Al cerrar la aplicación, los destructores llaman a `clear()`.  
  - Con el depurador se comprobó que no quedaron nodos sin liberar.  

---

### **4. Preguntas de reflexión – Stack**

1. **¿Cómo se gestiona la memoria en una pila manual en C++?**  
   Mediante `new` para crear nodos y `delete` para liberarlos en `pop` y `clear`. Esto otorga control total pero requiere cuidado para evitar fugas.  

2. **¿Por qué es importante liberar memoria al desapilar?**  
   Si no se hace, los nodos eliminados seguirán ocupando memoria, lo cual puede causar problemas en aplicaciones de larga ejecución.  

3. **¿Qué diferencias existen con `std::stack`?**  
   La STL abstrae la gestión de memoria y reduce el riesgo de errores, mientras que la implementación manual otorga flexibilidad y control.  

4. **¿Cómo afecta el orden LIFO?**  
   Permite resolver problemas donde el último elemento ingresado debe procesarse primero, como en el manejo de historial o expresiones matemáticas.  

5. **¿Cómo almacenar datos más complejos?**  
   Sería necesario gestionar correctamente constructores, destructores y copias profundas, para evitar accesos inválidos o fugas.  

---

### **5. Autoevaluación – Stack**

1. Se comprendió cómo funcionan las operaciones `push` y `pop`, así como la gestión de memoria con `new` y `delete`.  
2. Se identificó la importancia de corregir fugas de memoria mediante la liberación oportuna de nodos.  
3. Se reconoció la posibilidad de implementar funciones adicionales, como búsqueda, sin alterar el orden de los elementos.  
4. Se entendió la naturaleza LIFO y sus aplicaciones prácticas.  
5. Se consideró viable extender la implementación a objetos más complejos con un manejo cuidadoso de memoria.  

---

### **6. Preguntas de reflexión – Queue**

1. **¿Cómo se maneja la memoria en una cola manual en C++?**  
   Al encolar se reserva memoria con `new`; al desencolar se libera con `delete`. Esto mantiene la estructura dinámica y eficiente.  

2. **¿Qué desafíos presenta frente al stack?**  
   La coordinación de los punteros `front` y `rear` es crítica para mantener la integridad de la cola.  

3. **¿Cómo influye la naturaleza FIFO?**  
   Es ideal para problemas donde el orden de llegada debe preservarse, como en colas de atención o buffers de datos.  

4. **¿Cómo se podría implementar una cola circular?**  
   Haciendo que el puntero `rear->next` apunte de nuevo a `front`. Esto optimiza el uso de memoria al reutilizar nodos.  

5. **¿Qué problemas surgen si `front` o `rear` no se actualizan bien?**  
   Podrían perderse referencias a nodos, generando fugas o accesos inválidos. Un manejo cuidadoso evita estas inconsistencias.  

---

### **7. Autoevaluación – Queue**

1. Se comprendió en detalle cómo funcionan `enqueue` y `dequeue`, con su correspondiente gestión de memoria.  
2. Se identificaron los posibles errores al manejar `front` y `rear`, y las estrategias para corregirlos.  
3. Se reconoció el valor de implementar una cola circular para mejorar la eficiencia.  
4. Se consolidó la comprensión de la estructura FIFO y sus aplicaciones prácticas.  
5. Se consideró factible extender la cola a objetos más complejos con un manejo adecuado de punteros y memoria.