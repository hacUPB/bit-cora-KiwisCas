# Actividad 1

1. ¿Qué son los vértices?
Los vértices son puntos en el espacio 3D que definen la forma de un objeto. Cada vértice tiene una posición (x, y, z) y puede tener otros datos como color, normales o coordenadas de textura. Al unir varios vértices se forman las caras o triángulos de un modelo 3D.

2. ¿Con qué figura geométrica se dibuja en 3D?
Normalmente se usa el triángulo. Casi todos los objetos 3D están formados por muchos triángulos porque son la figura más simple que define una superficie en el espacio tridimensional.

3. ¿Qué es un shader?
Un shader es un pequeño programa que corre en la tarjeta gráfica (GPU) y se encarga de controlar cómo se dibujan los objetos en pantalla. Se usa para calcular la posición, el color, la luz o los efectos visuales.

4. ¿Cómo se le llaman a los grupos de píxeles de un mismo triángulo?
Se les llama fragmentos. Cada fragmento representa un posible píxel que formará parte del triángulo en la pantalla.

5. ¿Qué es un fragment shader?
Es el shader que se encarga de calcular el color final de cada fragmento (píxel). Aquí se aplican efectos como iluminación, sombras, reflejos o texturas.

6. ¿Qué es un vertex shader?
Es el shader que procesa cada vértice de un modelo. Se encarga de transformarlo de su posición 3D en el mundo a su posición en la pantalla, aplicando rotaciones, traslaciones, escalas y proyecciones.

7. ¿Al proceso de determinar qué pixels del display va a cubrir cada triángulo de una mesh se le llama?
Ese proceso se llama rasterización. Es cuando el triángulo se convierte en fragmentos (píxeles potenciales) que serán luego coloreados.

8. ¿Qué es el render pipeline?
Es el conjunto de pasos que sigue la tarjeta gráfica para convertir un modelo 3D en una imagen 2D en la pantalla. Incluye etapas como el vertex shader, la rasterización, el fragment shader y la escritura en el framebuffer.

9. ¿Hay alguna diferencia entre aplicar un color a una superficie de una mesh o aplicar una textura?
Sí. Aplicar un color es darle un tono uniforme a toda la superficie, mientras que una textura es una imagen que se “pega” sobre la superficie del objeto, lo que permite más detalle (como madera, metal o piel).

10. ¿Cuál es la diferencia entre una textura y un material?
Una textura es solo una imagen usada para dar detalles visuales. Un material combina una o más texturas con propiedades físicas (como brillo, reflexión, rugosidad) que definen cómo reacciona el objeto ante la luz.

11. ¿Qué transformaciones se requieren para mover un vértice del 3D world al View Screen?
Se aplican tres transformaciones principales:

Model: mueve el objeto a su posición en el mundo.

View: coloca la cámara o punto de vista.

Projection: convierte las coordenadas 3D en coordenadas 2D de pantalla.

12. ¿Al proceso de convertir los triángulos en fragmentos se le llama?
Se le llama rasterización, como se mencionó antes.

13. ¿Qué es el framebuffer?
Es una parte de la memoria de video donde se almacena la imagen final que se va a mostrar en pantalla. Contiene los valores de color de cada píxel.

14. ¿Para qué se usa el Z-buffer o depth buffer en el render pipeline?
Se usa para guardar la profundidad (la distancia a la cámara) de cada píxel. Sirve para determinar qué objetos están delante o detrás y así evitar que se dibujen partes que deberían quedar ocultas.


# Actividad 2

- ¿Cómo funciona?

ofApp::setup() carga el shader correcto (GL3 si el renderer programable está activo; si no, carga GL2). En draw() se llama shader.begin(), se dibuja un rectángulo que cubre la ventana y se llama shader.end(). El efecto visual lo genera el fragment shader (colores en función de gl_FragCoord). 

ofApp

- ¿Qué resultados obtuviste?

Al analizar el fragment shader, el resultado esperado es un degradado 2D: rojo varía horizontalmente (X), verde varía verticalmente (Y), azul fijo en 1.0. Esto produce desde azul en la esquina (0,0) hasta blanco en la esquina opuesta (1,1), con todos los tonos intermedios.

- ¿Estás usando un vertex shader?

Sí. El archivo de vertex shader existe y contiene la transformación estándar gl_Position = modelViewProjectionMatrix * position;. Ese vertex shader toma la posición del vértice y la transforma con la matriz MVP (modelo-vista-proyección) — es la versión mínima necesaria para el pipeline programable.

- ¿Estás usando un fragment shader?

Sí. El fragment shader calcula el color de cada fragmento usando gl_FragCoord y asigna outputColor = vec4(r,g,b,a);. Es el que genera el degradado dependiente de la posición de ventana.

Análisis detallado de los shaders

Explicaciones

```cpp
Vertex shader (shader.vert)
OF_GLSL_SHADER_HEADER

uniform mat4 modelViewProjectionMatrix;

in vec4 position;

void main(){
	gl_Position = modelViewProjectionMatrix * position;
}
```

Analicemos:

- `OF_GLSL_SHADER_HEADER`

    - Macro/placeholder que openFrameworks usa para expandir la cabecera GLSL apropiada (versión #version y precision según GL2/GL3). No es GLSL estándar por sí mismo; OF lo reemplaza cuando carga el shader.

- `uniform mat4 modelViewProjectionMatrix;`

    - Matriz 4x4 proporcionada por openFrameworks que combina modelo, vista y proyección.

- `in vec4 position;`

    - Entrada de posición del vértice (pipeline moderno). in indica atributo de vértice.

- `main()`

   - Multiplica la posición por la matriz MVP y asigna gl_Position. Es un vertex shader mínimo: no calcula normales, UVs ni pasa variables al fragment shader.

Ahora el `shader.frag`

```cpp
OF_GLSL_SHADER_HEADER

out vec4 outputColor;

void main()
{
    // gl_FragCoord contains the window relative coordinate for the fragment.
    // we use gl_FragCoord.x position to control the red color value.
    // we use gl_FragCoord.y position to control the green color value.
    // please note that all r, g, b, a values are between 0 and 1.
    
    float windowWidth = 1024.0;
    float windowHeight = 768.0;
    
	float r = gl_FragCoord.x / windowWidth;
	float g = gl_FragCoord.y / windowHeight;
	float b = 1.0;
	float a = 1.0;
	outputColor = vec4(r, g, b, a);
}
```
Explicación

- `OF_GLSL_SHADER_HEADER`

    - Igual que en el vertex: cabecera que OF inyecta.

- `out vec4 outputColor;`

    - Salida del color final del fragmento (para GL3 / GLSL moderno).

- Comentarios explican que usan gl_FragCoord (coordenada en ventanas).

- `float windowWidth = 1024.0; / float windowHeight = 768.0;`

    - Valores constantes hard-coded para normalizar las coordenadas X y Y. Problema/práctica mejorable: si la ventana no es esa resolución, el degradado no cubrirá la ventana de forma proporcional.

- `float r = gl_FragCoord.x / windowWidth;`

    - R varía de 0.0 a ~1.0 a lo largo del eje X.

- `float g = gl_FragCoord.y / windowHeight;`

    - G varía de 0.0 a ~1.0 a lo largo del eje Y.

- `float b = 1.0;`

    - Azul fijo al máximo.

- `float a = 1.0;`

    - Alfa = 1 (opaco).

- `outputColor = vec4(r, g, b, a);`

    - Salida final del color.
