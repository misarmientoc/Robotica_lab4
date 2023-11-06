# Robotica_lab4
Laboratorio 4 de robótica 2023-2


## Laboratorio 4 Robótica
### Integrantes: 
- Norma Lorena Martinez Zavala
- Miguel Angel Sarmiento Cabarcas
- Jaime Andres Sanchez Peralta

## Objetivos:
• Crear todos los Joint Controllers con ROS para manipular servomotores Dynamixel AX-12 del robot Phantom X Pincher. <br>
• Manipular los tópicos de estado y comando para todos los Joint Controllers del robot Phantom X Pincher. <br>
• Manipular los servicios para todos los Joint Controllers del robot Phantom X Pincher. <br>
• Conectar el robot Phantom X Pincher con MATLAB o Python usando ROS. <br>

## Descripción de la solución planteada
El primer paso para la elaboración de este laboratorio fué tomar las medidas de los estabones del robot, para ello se mide de junta a junta, como se muestra en la siguiente imagen:
[![IMG-20231105-WA0037.jpg](https://i.postimg.cc/3wGRwpRx/IMG-20231105-WA0037.jpg)](https://postimg.cc/CZFYPRk3)

Medidas de los eslabones:
[![IMG-20231105-213426.jpg](https://i.postimg.cc/RZcyVZmz/IMG-20231105-213426.jpg)](https://postimg.cc/hXtp2ghC)

### Desarrollo de la cinemática directa:
  Se hizo uso de SerialLink para la construcción del robot a partir de los parámetros DH estandar, también se calculó la matriz de transformación homogenea que relaciona el sistema de coordenadas de World con el sistema de coordendas del TCP (H0TCP).
   
PhantomII = 
 
PhantomII:: 4 axis, RRRR, stdDH, slowRNE    

![image](https://github.com/misarmientoc/Robotica_lab4/assets/66492359/843327aa-e4e1-46a6-a2d1-cabc713166d0)

tool:    t = (0, 0, 0.065), RPY/xyz = (0, 0, 0) deg              
H0TCP = 4×4    
         0         0    1.0000    0.1700
         0   -1.0000         0         0
    1.0000         0         0    0.1850
         0         0         0    1.0000
![image](https://github.com/misarmientoc/Robotica_lab4/assets/66492359/ff1c7bb9-377d-452d-9310-5b32cccaa4ff)

q1 = 1×4    
    0.4363    0.4363    0.3491   -0.3491

![image](https://github.com/misarmientoc/Robotica_lab4/assets/66492359/e0d103f8-926c-4bb7-a70d-9254cd78d199)

q2 = 1×4    
   -0.6109    0.6109   -0.5236    0.5236

![image](https://github.com/misarmientoc/Robotica_lab4/assets/66492359/237de157-f726-470d-93ea-dac8150d4ea1)

q3 = 1×4    
    1.4835   -0.3491    0.9599    0.4363

![image](https://github.com/misarmientoc/Robotica_lab4/assets/66492359/680b1cc3-031e-4e9c-a35e-d972ffa991c5)

q4 = 1×4    
    1.3963   -0.6109    0.9599   -0.7854

![image](https://github.com/misarmientoc/Robotica_lab4/assets/66492359/eaf9adae-992d-462c-97e7-76bd1df93aa4)

### Codigo
Para iniciar el control de los motores del pincher, se debe modificar el archivo de configuracion de dynamixel one motor que se encuentra en el sitio web del curso, agregando los parametros correspondientes a los 5 motores que forman parte del brazo robotico. Luego, se debe escribir el codigo en python que importe las siguientes dependencias.

![image](https://github.com/misarmientoc/Robotica_lab4/assets/47614570/958b992b-c6d7-441f-a657-740494cdee87)

Para trabajar con ROS en python, se necesita importar el módulo de rospy, que proporciona las funciones y clases esenciales para interactuar con el sistema. También se utiliza el módulo de numpy, que permite realizar cálculos numéricos y operaciones matriciales de forma eficiente. Además, se requieren varios tópicos y mensajes específicos de ROS, como el tipo JointTrajectory, que representa una secuencia de posiciones y velocidades de las articulaciones.

La función Join_publisher se encarga de crear un objeto Publisher que publica en el tópico joint_trajectory, que es usado por el controlador del brazo robótico. Dentro de un bucle, mientras rospy esté activo, se envían los puntos guardados al motor. Esta función es una función residual de pruebas anteriores y no se utiliza en el código principal del programa.

![image](https://github.com/misarmientoc/Robotica_lab4/assets/47614570/ba88d020-1ab9-424c-a642-13c2025a69a1)

Este código de python usa las funciones callback y listener para trabajar con los datos de los servomotores del robot. El listener inicializa el nodo de ROS y se suscribe al tópico de los estados de las articulaciones. El callback guarda una variable global con el ángulo de cada articulación en grados, usando una conversión simple de radianes a grados 180/pi.

![image](https://github.com/misarmientoc/Robotica_lab4/assets/47614570/3d024ba0-7000-4a51-9198-30e1567ef9ab)

La función jointCommand es una función que envía un comando de dynamixel al motor especificado, usando el servicio de transmitir al motor. El comando de dynamixel tiene cuatro parámetros: el número de comando, el identificador del motor, el nombre de la dirección de memoria y el valor nuevo. La función espera a que el servicio esté disponible y luego envía el comando. Después, espera un tiempo para ROS y devuelve el resultado del comando.

![image](https://github.com/misarmientoc/Robotica_lab4/assets/47614570/33878b69-5e9c-4a71-95d5-8dc469c4f5b9)



 

