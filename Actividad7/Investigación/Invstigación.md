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


## Ejemplo 1

- ¿Cómo funciona?

ofApp::setup() carga el shader correcto (GL3 si el renderer programable está activo; si no, carga GL2). En draw() se llama shader.begin(), se dibuja un rectángulo que cubre la ventana y se llama shader.end(). El efecto visual lo genera el fragment shader (colores en función de gl_FragCoord). 

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

---
## Ejemplo 2

![alt text](Imagenes/2.png)


- ¿Cómo funciona?

    En setup cargas el shader (GL3) y creas un plano mallado (grid).

    En draw:

    - Calculas el centro de pantalla y trasladas la escena allí.

    - A partir de la posición del ratón mezclas entre magenta y azul (según mouseX) y pasas ese color al shader como uniform mouseColor.

    - Comienzas el shader y dibujas el plano en modo alámbrico (wireframe).

- ¿Qué resultados obtuviste?

Se ve una malla (solo líneas) centrada en pantalla.
Todo el dibujo toma un color uniforme que cambia de magenta a azul cuando mueves el ratón de izquierda a derecha.
No hay iluminación ni texturas; el color lo define directamente el shader a partir del uniform.

- ¿Estás usando un vertex shader?

Sí. Cargas un programa con shader.vert + shader.frag. El VS suele transformar la posición de cada vértice (MVP) y dejar listo el dibujo. En tu app no se ve que el VS añada efectos extra.

- ¿Estás usando un fragment shader?

Sí. Es el archivo activo (shader.frag) y decide el color final de cada fragmento (píxel).

- Analiza el código de los shaders. ¿Qué hace cada uno?

    - Fragment shader (shader.frag):
    - OF_GLSL_SHADER_HEADER: inserta la cabecera correcta de GLSL según el contexto.
    - out vec4 outputColor: salida del color del fragmento.
    - uniform vec4 mouseColor: color que le pasas desde C++.
    - main: simplemente asigna outputColor = mouseColor; es decir, pinta todo con ese color uniforme.

Nota: Aunque en C++ se pasa mousePos y mouseRange, aquí no se usan.


## Ejemplo 3

- ¿Cómo funciona?

El programa dibuja una cuadricula que resalta con una especie de circulo o esfera, donde al mover el mouse esta esfera se mueve con el, y dependiendo del lado que se este cambia de color.

- ¿Qué resultados obtuviste?

![alt text](Imagenes/3.png)

- ¿Estás usando un vertex shader?

Si, este se encarga de darle esa deformación al plano

- ¿Estás usando un fragment shader?

Este es el que se encarga del color dependiendo de la posición del mouse.

- Analiza el código de los shaders. ¿Qué hace cada uno?


### shader.vert

Como se dijo anteriormente, este es el shader que se encarga de deformar el plano usando el cursor. Solo hace eso

```cpp
OF_GLSL_SHADER_HEADER

// these are for the programmable pipeline system
uniform mat4 modelViewProjectionMatrix;
in vec4 position;

uniform float mouseRange;
uniform vec2 mousePos;
uniform vec4 mouseColor;

void main()
{
    // copy position so we can work with it.
    vec4 pos = position;
    
    // direction vector from mouse position to vertex position.
	vec2 dir = pos.xy - mousePos;
    
    // distance between the mouse position and vertex position.
	float dist =  sqrt(dir.x * dir.x + dir.y * dir.y);
    
    // check vertex is within mouse range.
	if(dist > 0.0 && dist < mouseRange) {
		
		// normalise distance between 0 and 1.
		float distNorm = dist / mouseRange;
        
		// flip it so the closer we are the greater the repulsion.
		distNorm = 1.0 - distNorm;
		
        // make the direction vector magnitude fade out the further it gets from mouse position.
        dir *= distNorm;
        
		// add the direction vector to the vertex position.
		pos.x += dir.x;
		pos.y += dir.y;
	}

	// finally set the pos to be that actual position rendered
	gl_Position = modelViewProjectionMatrix * pos;
}
```
### shader.frag

Este se encarga del color que se ve en la pantalla dependiendo de la posición del mouse, osea, genera un cambio de color que se ve en la pantalla cuando movemos el mouse de un lado a otro o de arriba hacia abajo.

# Actividad 3

### ¿Qué es un uniform?

Un uniform es una variable que le manda información al shader desde el programa principal, como por ejemplo el color o el tiempo. Esa información no cambia mientras se dibuja, así que el shader usa el mismo valor para todos los puntos o píxeles del dibujo. Sirve para que el shader sepa cosas del programa y pueda hacer efectos como animaciones o cambios de color.

## Ejemplo 4

![alt text](Imagenes/4.png)

### ¿Cómo funciona el código de aplicación, los shaders y cómo se comunican estos?
el programa principal crea una imagen y un plano para mostrarla, y usa un shader para cambiar cómo se ve. El vertex shader se encarga de mover los puntos (vértices) del plano y también de cambiar las coordenadas de la textura usando la posición del mouse. Luego, le pasa esa información al fragment shader, que se encarga de pintar cada píxel de la imagen en pantalla usando esas coordenadas.

Estos se comunican por medio de uniforms, que sirven para enviar datos, como la posición del mouse o el tamaño de la pantalla, al shader. Así, cuando movemos el mouse, el shader recibe ese valor y hace que la textura se desplace, creando un efecto visual en tiempo real. En el caso de este ejemplo es una imagen grande que se puede ver sisigo moviendo el mouse

## Modificación
![alt text](Imagenes/5.png)

Modifique el `shader.frag` y el `shader.vert`

**Shader.vert**
```cpp
#version 150

uniform mat4 modelViewProjectionMatrix;

in vec4 position;
in vec2 texcoord;

out vec2 vTexCoord;

void main() {
    vTexCoord = texcoord;
    gl_Position = modelViewProjectionMatrix * position;
}

```
**Shader.frag**

```cpp
#version 150

uniform sampler2DRect tex0;
uniform float mouseX;
uniform vec2 resolution;

in vec2 vTexCoord;
out vec4 outputColor;

void main() {
    // Normalizamos las coordenadas (0.0 a 1.0)
    vec2 uv = vTexCoord / resolution;

    // Tomamos el color original de la textura
    vec3 color = texture(tex0, vTexCoord).rgb;

    // Creamos un patrón de color dinámico en función de la posición y el mouse
    float r = abs(sin(uv.x * 10.0 + mouseX * 0.01));
    float g = abs(sin(uv.y * 10.0 - mouseX * 0.01));
    float b = abs(sin((uv.x + uv.y) * 5.0));

    // Combinamos el color original con nuestro patrón
    color = mix(color, vec3(r, g, b), 0.6);

    outputColor = vec4(color, 1.0);
}
```


## Ejemplo 5

![alt text](Imagenes/6.png)
### ¿Cómo funciona el código de aplicación, los shaders y cómo se comunican estos?

Funciona igual que el anterior ejemplo, solo que  esta vez se usa un uniform demas para decirle al programa que use la mask para darle efecto a la imagen.

### Modificación

![alt text](Imagenes/7.png)

```cpp
OF_GLSL_SHADER_HEADER

uniform sampler2D tex0;
uniform sampler2D imageMask;
uniform vec2 resolution;

in vec2 texCoordVarying;
out vec4 outputColor;

void main()
{
    // Color base y máscara
    vec4 texel0 = texture(tex0, texCoordVarying);
    vec4 texel1 = texture(imageMask, texCoordVarying);

    // Normalizar coordenadas de textura (0.0 - 1.0)
    vec2 uv = texCoordVarying / resolution;

    // Generar un color dinámico según la posición del píxel
    vec3 dynamicColor;
    dynamicColor.r = abs(sin(uv.x * 6.2831));
    dynamicColor.g = abs(sin(uv.y * 6.2831));
    dynamicColor.b = abs(sin((uv.x + uv.y) * 3.1416));

    // Mezclar el color original con el color generado
    vec3 mixedColor = mix(texel0.rgb, dynamicColor, 0.6);

    // Aplicar máscara al canal alpha
    float alpha = texel0.a * texel1.a;

    outputColor = vec4(mixedColor, alpha);
}
```

## Ejemplo 6

![alt text](Imagenes/8.png)

### ¿Cómo funciona el código de aplicación, los shaders y cómo se comunican estos?

El código hace que la aplicación use tres imágenes o videos (una de la cámara, una imagen y un video) y una máscara para mezclarlos con ayuda de un shader. El vertex shader pasa la posición y coordenadas de textura de cada punto, y el fragment shader decide el color final de cada píxel mezclando los colores según la máscara. Así, la app y los shaders trabajan juntos: la app envía las texturas al shader y el shader calcula cómo se combinan para mostrar la imagen final.

### Modificación

![alt text](Imagenes/9.png)

```cpp
OF_GLSL_SHADER_HEADER

uniform sampler2D tex0;
uniform sampler2D tex1;
uniform sampler2D tex2;
uniform sampler2D imageMask;
uniform vec2 resolution; // para saber el tamaño de la pantalla

in vec2 texCoordVarying;

out vec4 outputColor;

void main()
{
    // --- Texturas base ---
    vec4 rTxt = texture(tex0, texCoordVarying);
    vec4 gTxt = texture(tex1, texCoordVarying);
    vec4 bTxt = texture(tex2, texCoordVarying);
    vec4 mask = texture(imageMask, texCoordVarying);

    // --- Mezcla original según máscara RGB ---
    vec4 color = vec4(0.0);
    color = mix(color, rTxt, mask.r);
    color = mix(color, gTxt, mask.g);
    color = mix(color, bTxt, mask.b);

    // --- Personalización del color ---
    // Calculamos un efecto tipo gradiente o tonalidad variable según posición
    vec2 pos = gl_FragCoord.xy / resolution;
    float brightness = dot(color.rgb, vec3(0.299, 0.587, 0.114));

    // Cambiamos el tono según posición y brillo
    vec3 newColor = vec3(
        color.r * (0.5 + 0.5 * sin(pos.x * 6.2831)),
        color.g * (0.5 + 0.5 * cos(pos.y * 6.2831)),
        color.b * brightness
    );

    // Resultado final
    outputColor = vec4(newColor, 1.0);
}

```

y agregué esto último antes de inicializar en `Draw()` a `maskFbo`

```cpp
shader.setUniform2f("resolution", ofGetWidth(), ofGetHeight());
```

# Actividad 4

## Ejemplo 7

![alt text](Imagenes/10.png)

### ¿Qué hace el código del ejemplo?

El código crea una aplicación interactiva de pintura digital en OpenFrameworks que permite al usuario dibujar con un pincel sobre una máscara y aplicar efectos visuales mediante shaders.

**Funcionalidades principales:**

Permite dibujar o borrar con un pincel (brush.png) sobre una superficie (FBO).

Genera las letras “O” y “F” a partir de una fuente (Batang.ttf), que se dibujan de manera animada siguiendo trayectorias predefinidas.

Combina diferentes texturas o colores en función del nivel de gris de la máscara.

El usuario puede:

- Cambiar el tamaño y la opacidad del pincel.

- Alternar entre modo pincel y borrador.

- Activar o desactivar el uso de texturas.

- Limpiar la pantalla con la barra espaciadora.


### ¿Cómo funciona el código de aplicación, los shaders y cómo se comunican estos?

**Flujo general:**

1. ofApp.cpp (CPU):

- Carga imágenes (tex0.jpg a tex4.jpg) y el pincel.

- Crea un FBO (maskFbo) donde se guarda la máscara pintada.

- Calcula los trazos de las letras O y F y mueve el pincel siguiendo esas trayectorias.

- Envía al shader todas las texturas y parámetros mediante shader.setUniform...().

2. Vertex Shader (GPU – Etapa 1)

- Recibe posiciones (position) y coordenadas de textura (texcoord).

- Calcula la posición final de cada vértice multiplicando por la modelViewProjectionMatrix.

- Pasa las coordenadas de textura al fragment shader.

3. Fragment Shader (GPU – Etapa 2)

- Recibe la máscara (maskTex) y las texturas.

- Usa el valor de gris del píxel de la máscara para decidir qué textura o color mostrar.

- Mezcla dos texturas o colores usando mix(back, fore, mixAmnt) para lograr transiciones suaves.

- Devuelve el color final al framebuffer de OpenGL.

### Comunicación entre CPU y GPU:

- ofApp envía uniforms al shader:

- maskTex: textura de la máscara.

- tex0–tex4: texturas de muestra.

- uUseTextures: indica si se usan texturas o solo colores.

- uMaskSize y uTexSize: tamaños de texturas.

Los shaders procesan esos datos en la GPU para componer la imagen final.

### Cambios del shader.vert

En `offApp::draw()` agregué lo siguiente

```cpp
shader.begin();

shader.setUniform1f("uTime", ofGetElapsedTimef());

```

Y en `shader.vert` agregué lo siguiente:

```cpp
OF_GLSL_SHADER_HEADER

// matrices y atributos del pipeline
uniform mat4 modelViewProjectionMatrix;
uniform float uTime; // Recibe el tiempo desde ofApp

in vec4 position;
in vec2 texcoord;

out vec2 texCoordVarying;

void main() {
    vec4 pos = position;

    // Aplicar una onda senoidal a los vértices
    pos.z += sin(pos.x * 0.05 + uTime * 2.0) * 20.0;
    pos.y += cos(pos.x * 0.03 + uTime) * 10.0;

    texCoordVarying = texcoord;
    gl_Position = modelViewProjectionMatrix * pos;
}
```

El resultado fue el siguiente:

<video controls src="Imagenes/Grabación de pantalla 2025-10-30 074956.mp4" title="Title"></video>

### Cambios del shader.frag

Hice el siguiente cambio 

```cpp
OF_GLSL_SHADER_HEADER

uniform float uUseTextures;
uniform vec2 uMaskSize;
uniform vec2 uTexSize;
uniform sampler2D maskTex;

uniform float uTime; 

// Texturas (si están activadas)
uniform sampler2D tex0;
uniform sampler2D tex1;
uniform sampler2D tex2;
uniform sampler2D tex3;
uniform sampler2D tex4;

in vec2 texCoordVarying;
out vec4 outputColor;

void main() {
    float mask = texture(maskTex, texCoordVarying).r;


    vec3 rainbow = vec3(
        0.5 + 0.5 * sin(uTime + texCoordVarying.x * 5.0),
        0.5 + 0.5 * sin(uTime + texCoordVarying.y * 5.0 + 2.0),
        0.5 + 0.5 * sin(uTime + 4.0)
    );

    // Combina el arcoíris con la máscara pintada
    outputColor = vec4(rainbow, mask);
}
```

## Ejemplo 8 

![alt text](Imagenes/11.png)

### ¿Qué hace el código del ejemplo?

El código crea una superficie 3D deformable en OpenFrameworks que simula el movimiento de olas animadas mediante el uso de ruido de Perlin. Este ruido se genera en la CPU como una textura dinámica en escala de grises, que luego es enviada al shader para desplazar los vértices del plano de acuerdo con los valores de brillo de esa textura.

**Funcionalidades principales:**

- Genera una textura dinámica usando ofNoise(), que cambia con el tiempo simulando movimiento.

- Crea un plano 3D subdividido en vértices, los cuales se elevan o descienden según el valor del ruido.

- Usa shaders (vertex y fragment) para aplicar el desplazamiento y el color del plano directamente en la GPU.

**Permite al usuario:**

- Mover el mouse en X para cambiar la escala del ruido (el nivel de detalle del movimiento).

- Mover el mouse en Y para rotar el plano y visualizar las deformaciones desde diferentes ángulos.

- Renderiza la textura de ruido en una esquina de la pantalla para visualizar su patrón base.


### ¿Cómo funciona el código de aplicación, los shaders y cómo se comunican estos?

**Flujo general:**

**ofApp.cpp (CPU):**

1. setup():

- Desactiva las texturas ARB para usar coordenadas UV normalizadas (ofDisableArbTex()).

- Carga el shader adecuado según la versión de OpenGL (shadersGL2 o shadersGL3).

- Crea una textura de 120×90 píxeles en escala de grises (img.allocate()).

- Define un plano 3D de 800×600 unidades, subdividido en 200×150 vértices.

- Asocia la textura del ruido con las coordenadas UV del plano.

2. update():

- Genera una textura de ruido en tiempo real usando ofNoise(x * noiseScale, y * noiseScale, time).

- El parámetro noiseScale depende de la posición del mouse en X.

- El tiempo (ofGetElapsedTimef()) se usa como tercera dimensión del ruido, creando movimiento constante.

- Los valores del ruido (0–1) se almacenan como brillo (0–255) en la textura img, que se actualiza en cada frame.

3. draw():

- Activa la textura (img.getTexture().bind()).

- Inicia el shader (shader.begin()).

- Centra el plano en pantalla y lo rota según la posición del mouse en Y.

- Dibuja el plano con la deformación y el color aplicados por el shader.

- Desactiva el shader (shader.end()).

- Muestra la textura de ruido en una esquina para referencia.

4. Vertex Shader (GPU – Etapa 1)

- Recibe los vértices (position) y coordenadas de textura (texcoord) del plano.

- Lee el valor de brillo del píxel correspondiente en la textura (texture(tex0, texcoord).r).

- Usa ese valor como desplazamiento vertical, multiplicado por una escala (h * 80.0).

- Calcula la posición final del vértice con la matriz de transformación (modelViewProjectionMatrix).

- Envía las coordenadas de textura al fragment shader para el color posterior.



5. Fragment Shader (GPU – Etapa 2)

- Recibe las coordenadas de textura (texCoordVarying) y la textura (tex0).

- Obtiene el valor de ruido del píxel (h), que representa la altura.

- Calcula un color mezclando tonos de azul y blanco según ese valor:

- vec3 color = mix(vec3(0.0, 0.3, 0.8), vec3(0.9, 0.9, 1.0), h);


- Devuelve el color resultante en outputColor.


### Modificaciones

<video controls src="Imagenes/Grabación de pantalla 2025-10-30 091508.mp4" title="Title"></video>

```cpp
void ofApp::draw(){
	ofBackground(0);
	img.getTexture().bind();
	shader.begin();

	ofPushMatrix();
	ofTranslate(ofGetWidth()/2, ofGetHeight()/2);
	float percentY = mouseY / (float)ofGetHeight();
	float rotation = ofMap(percentY, 0, 1, -60, 60, true) + 60;
	ofRotateDeg(rotation, 1, 0, 0);

	ofSetColor(255);     // Color del plano
	plane.draw();        // Cambio de wireframe a sólido

	ofPopMatrix();

	shader.end();
	img.getTexture().unbind();

	// Mostramos la textura como vista previa
	ofSetColor(255);
	img.draw(0, 0, 160, 120);
}
```
```cpp
OF_GLSL_SHADER_HEADER

uniform mat4 modelViewProjectionMatrix;
in vec4 position;
in vec2 texcoord;
uniform sampler2D tex0;

out vec2 texCoordVarying;

void main()
{
    vec4 modifiedPosition = position;
    float scaleY = 100.0;
    float scaleZ = 50.0;

    // Tomamos dos canales distintos del mapa de ruido
    float displacementY = texture(tex0, texcoord).r;
    float displacementZ = texture(tex0, texcoord).g;

    // Movemos en Y y Z
    modifiedPosition.y += displacementY * scaleY;
    modifiedPosition.z += displacementZ * scaleZ;

    gl_Position = modelViewProjectionMatrix * modifiedPosition;
    texCoordVarying = texcoord;
}

```

```cpp
OF_GLSL_SHADER_HEADER

uniform sampler2D tex0;
in vec2 texCoordVarying;
out vec4 outputColor;

void main()
{
    float val = texture(tex0, texCoordVarying).r;
    // Mapear ruido a un degradado azul-rosado
    vec3 color = mix(vec3(0.1, 0.2, 0.8), vec3(1.0, 0.3, 0.6), val);
    outputColor = vec4(color, 1.0);
}

```