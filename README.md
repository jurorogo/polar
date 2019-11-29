# Polar
*Juan R. Robles Gómez* 

2º Ingeniería aeroespacial 2018/2019. Universidad Politécnica de Valencia.

Cálculo de la curva polar para trabajo de Tecnología aeroespacial.

Aeronave: Supermarine Spitfire

-----------------------------------

## Guía de uso

### Parámetros

s: Superficie alar

l: Longitud del fuselaje

w: Masa del avión

AR: Alargamiento

Swet: Superficie mojada

c: Cuerda geométrica

e: Factor de Oswald

### Fundamento teórico

Todo el fundamento teórico empleado es el explicado en clase de Tecnología aeroespacial.

El programa calcula lo necesario para trazar las polares. Para ello, se tiene en cuenta:
- Sustentación = Peso
- Analogía de la placa plana: se calcula un coeficiente de fricción para cada parte de la aeronave y se ajustará teniendo en cuenta su superficie mojada y sus factores de forma e interferencia
- El vuelo del avión es subsónico (Supermarine Spitfire)
- Atmósfera Estándar Internacional: se calcula la densidad del aire y la temperatura a la altitud de crucero siguiendo la ISA
- Se asume 20% de capa límite laminar (plam) (pturb = 80% turbulento)

Para calcular los factores de forma (FF), teniendo en cuenta que el caso del Supermarine Spitfire es subsónico:

· Fuselaje y cabina: 
FF = (1+(60/f^3)+(f/400)) con f = l/sqrt((4/pi)*Amax)

· Alas y estabilizadores:
FF = (1+(0.6/(x/c))*(t/c)+100*(t/c)^4)*(1.34*M^0.18*(cosd(lambdam))^0.28)

El factor de forma se calcula para tener en cuenta los efectos tridimensionales.

### Guia de uso

Al ejecutar el código, se solicita la velocidad, la altitud de vuelo y una variación de temperatura respecto a la calculada mediante la Atmósfera Estándar Internacional.

En caso de utilizar otro avión diferente al Supermarine Spitfire, se deben actualizar los parámetros que se encuentran al inicio del código (%Avión) y los parámetros geométricos de cada una de las partes del avión (%Paramétros (ajustar)). También pude ser necesario cambiar el porcentaje de capa límite laminar (plam) y los factores de interferencia (FI) de cada una de las partes en función del tipo de aeronave.

Por otro lado, hay que actualizar el apartado %%Gráficas. El programa está preparado para comparar la curva polar en tres casos diferentes. Para conseguir esto, en primer lugar hay que actualizar el apartado %Leyenda con las tres gráficas que se van a comparar. Después, se ejecuta el programa y se obtiene la primera gráfica. Sin cerrar la ventana emergente en la que se dibuja la curva polar, se ejecuta el código nuevamente con otras condiciones de altitud, velocidad o variación de temperatura respecto al ISA y se obtiene la segunda gráfica en comparación con la primera. Se realiza la operación una tercera vez para terminar.

Si, por ejemplo, queremos obtener la polar y compararla con variaciones de temperatura de 10 grados, ejecutamos el programa con la altitud y la velocidad de vuelo que consideremos y, en primer lugar, introducimos variación en ISA = 0. La segunda vez que ejecutemos el código (sin cerrar la ventana de las gráficas), mantenemos la misma velocidad y altitud pero introducimos variación en ISA = 10. La tercera vez que ejecutemos el código, introduciremos variación en ISA = -10 para obtener la gráfica que nos permita comparar las curvas polares al variar la temperatura.

Por tanto, es posible realizar esta operación para evaluar las diferencias en la curva polar al variar la velocidad de vuelo, la altitud o la temperatura.
