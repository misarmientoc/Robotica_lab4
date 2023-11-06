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
