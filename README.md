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
+---+-----------+-----------+-----------+-----------+-----------+
| j |     theta |         d |         a |     alpha |    offset |
+---+-----------+-----------+-----------+-----------+-----------+
|  1|         q1|       0.08|          0|    -1.5708|          0|
|  2|         q2|          0|     -0.105|          0|     1.5708|
|  3|         q3|          0|      0.105|          0|    -1.5708|
|  4|         q4|          0|          0|    -1.5708|    -1.5708|
+---+-----------+-----------+-----------+-----------+-----------+
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





 

