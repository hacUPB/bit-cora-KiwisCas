## **Actividad 1**

---

### 1. Entendimiento de la aplicación  
El programa en C++ con openFrameworks representa una serpiente formada por una **lista enlazada**. Cada nodo (`Node`) guarda la posición en el plano (x, y) y un puntero al siguiente nodo. La clase `LinkedList` administra la estructura, manteniendo acceso al nodo inicial (**head**), al nodo final (**tail**) y al tamaño (**size**).  

El flujo principal es el siguiente:  
- En `setup()` se agregan 10 nodos en el centro de la ventana.  
- En `update()` la cabeza de la lista sigue al puntero del mouse, y los demás nodos siguen a los anteriores.  
- En `draw()` se dibuja cada nodo como un círculo rojo.  
- Al presionar la tecla **c**, se libera toda la memoria de los nodos mediante `clear()`.  

Este comportamiento fue comprobado con el depurador de Visual Studio, confirmando el recorrido de la lista y la actualización progresiva de posiciones.

---

### 2. Evaluaciones formativas  
Durante el análisis se formularon preguntas de verificación:  

- **¿Qué ocurre si no se ejecuta `clear()` en el destructor?**  
  → Se generan fugas de memoria porque los nodos creados con `new` nunca se liberan.  

- **¿Cómo cambia `tail` al agregar un nodo?**  
  → `tail` se actualiza para apuntar siempre al último nodo agregado, manteniendo acceso directo al final de la lista.  

- **¿Qué sucede con la memoria al usar `clear()`?**  
  → Cada nodo se elimina con `delete` en un ciclo, liberando la memoria dinámica y dejando `head` y `tail` en `nullptr`.  

Estas hipótesis se comprobaron paso a paso con el depurador, confirmando el comportamiento esperado.

---

### 3. Diferencia entre lista enlazada y arreglo  
- **Arreglo:** almacena los elementos en posiciones contiguas de memoria. Esto permite acceso rápido a cualquier índice (**O(1)**), pero dificulta inserciones y eliminaciones intermedias ya que requiere mover múltiples elementos.  
- **Lista enlazada:** almacena elementos en nodos distribuidos en memoria dinámica. Cada nodo apunta al siguiente. El acceso secuencial es más lento (**O(n)**), pero las inserciones y eliminaciones intermedias son más eficientes porque solo requieren cambiar punteros, sin desplazar elementos.  

---

### 4. Vinculación de nodos  
Los nodos se conectan entre sí mediante el puntero `next`. Este puntero permite enlazar dinámicamente cada nodo con el siguiente, construyendo así la estructura en forma de cadena. Esta vinculación es flexible, ya que no depende de que la memoria esté contigua.

---

### 5. Gestión de memoria en listas enlazadas  
Cada nodo se crea con el operador `new`, reservando espacio en memoria dinámica. Cuando ya no se necesita, se libera con `delete`.  
- Ejemplo: `Node* newNode = new Node(x, y);`  
- Liberación: `delete current;`  

El diseño de la clase `LinkedList` asegura que todos los nodos creados se liberen adecuadamente cuando se llama a `clear()` o al destructor, evitando fugas de memoria.

---

### 6. Ventajas frente a un arreglo  
En una lista enlazada:  
- Insertar un nodo en la mitad de la lista solo requiere ajustar dos punteros.  
- Eliminar un nodo es igualmente eficiente, sin necesidad de desplazar grandes bloques de memoria.  

En cambio, en un arreglo, cualquier inserción o eliminación intermedia exige mover todos los elementos posteriores para mantener la continuidad en memoria, lo cual tiene un costo mucho mayor.

---

### 7. Prevención de fugas de memoria  
El destructor de `LinkedList` llama al método `clear()`. Esto garantiza que antes de que el objeto se destruya, todos los nodos dinámicos se liberen de la memoria. Sin este paso, cada `Node` creado con `new` quedaría sin liberar, causando un consumo innecesario de memoria.

---

### 8. Ejecución de `clear()`  
El proceso de `clear()` es:  
1. Se crea un puntero `current` que apunta al nodo inicial (`head`).  
2. Mientras `current` no sea `nullptr`, se guarda la dirección del siguiente nodo (`current->next`).  
3. Se libera el nodo actual con `delete`.  
4. Se avanza al siguiente nodo.  
5. Una vez recorridos todos los nodos, `head` y `tail` se igualan a `nullptr` y el tamaño se reinicia en 0.  

Esto asegura una liberación completa de la memoria usada.

---

### 9. Agregar un nodo al final  
Cuando se invoca `addNode(x, y)`:  
- Se crea un nuevo nodo dinámico.  
- Si `tail` existe, se enlaza el nuevo nodo con `tail->next`.  
- Finalmente, `tail` se actualiza para apuntar al nuevo nodo.  

Este procedimiento tiene complejidad **O(1)**, ya que siempre se agrega al final sin necesidad de recorrer toda la lista.

---

### 10. Uso ventajoso de listas enlazadas  
Un caso práctico es un **editor de texto**, donde los caracteres se insertan y eliminan constantemente en distintas posiciones. Usar un arreglo sería muy costoso debido al movimiento de elementos, mientras que una lista enlazada facilita estas operaciones de manera más eficiente en memoria.

---

### 11. Aplicación en estructuras personalizadas  
El aprendizaje de gestión de memoria en listas enlazadas puede aplicarse al diseño de estructuras creativas como:  
- Sistemas de partículas que nacen y mueren dinámicamente.  
- Simulaciones donde los objetos cambian constantemente de posición o estado.  

Aspectos clave a considerar:  
- Implementar destructores robustos.  
- Liberar memoria de objetos obsoletos.  
- Evitar creaciones excesivas de nodos en bucles sin control.

---

### 12. Comparación con lenguajes con recolección de basura  
- **C++:** el programador controla explícitamente la memoria con `new` y `delete`. Esto ofrece eficiencia y optimización, pero aumenta el riesgo de fugas si se omite la liberación.  
- **C#:** el **garbage collector** libera automáticamente la memoria de objetos que ya no se usan. Esto simplifica la programación, pero reduce el control y puede implicar pausas en la ejecución para la recolección.  

En proyectos de arte generativo en tiempo real, C++ puede ser más eficiente, aunque exige más cuidado en la gestión manual de memoria.

---

### 13. Consideraciones en arte generativo  
Si se implementa una obra generativa con listas enlazadas, es importante:  
- Liberar memoria de elementos que desaparecen en la animación.  
- Evitar que nodos "huérfanos" permanezcan ocupando memoria.  
- Diseñar estructuras livianas que puedan crearse y destruirse rápidamente sin afectar la fluidez gráfica.  
- Usar punteros inteligentes (`unique_ptr`, `shared_ptr`) para automatizar parte de la gestión de memoria y reducir riesgos.  

---

### 14. Pruebas realizadas  
Se llevaron a cabo pruebas unitarias y globales:  

- **Inicialización:** al ejecutar `setup()`, se generan 10 nodos visibles en el centro de la pantalla.  
- **Movimiento:** al mover el mouse, los nodos siguen la trayectoria suavemente.  
- **Limpieza:** al presionar la tecla `c`, la lista se vacía y los nodos desaparecen, confirmando la liberación de memoria.  
- **Reagregado:** tras limpiar, se volvieron a agregar nodos manualmente y la lista funcionó correctamente, demostrando que el sistema se reinicia sin errores.  

---