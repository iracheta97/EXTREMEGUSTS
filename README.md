Impact of the Extreme Operating Gusts on Power Converter Connected to PMSG–based Wind Turbine for Reliability Analysis

 	Detectar ráfagas extremas de viento EOG. Paso 1.
1.	Ejecutar el archivo llamado “DetectorMax.m” en Matlab o versiones posteriors. Este programa utiliza como datos de entrada el intregauno, datos concatenados de las ráfagas de viento durante un periodo de tiempo. 

 	Registrar los datos. Paso 2.
1.	Registrar los datos obtenidos con el código detector en el archivo llamado “Registro de datos” en Excel 2021, para tener un concentrado de valores que posteriormente se ocuparon para elaborar el diseño de experimentos (DOE) en Minitab.

 	Realizar DOE. Paso 3. 
1.	En el archivo llamado “Articulo”, se almacenan los datos del DOE. En Minitab 2019 o versiones posteriores, realizar el diseño de experimentos para obtener la combinación de los tratamientos.
2.	 En la barra de herramientas, seleccionar Herramientas/DOE/Factorial/Crear diseño factorial completo general/DOE/Factorial/Crear diseño factorial. 
3.	En la Ventana que aparece, seleccionar Diseño factorial completo general/seleccionar ‘2’ en número de factores; los factores de entrada son: Amplitud e Intensidad y las variables de salida son: Corriente, Voltaje y Potencia. 
4.	Finalmente al darle aceptar, se obtienen los 16 tratamientos para realizar la simulación.

 	Realizar simulación. Paso 4. 
1.	Ejecutar el archivo llamado EstructuraRáfagaEOG.psimsch, en donde se modifican los valores de las ráfagas EOG de acuerdo a los tratamientos.
2.	Simular los 16 tratamientos, donde se obtienen 16 resultados distintos en las variables de salida (corriente, voltaje y potencia).
3.	 Los datos obtenidos nuevamente se llevan al archivo llamado Artículo en Minitab 2019, para obtener las gráficas del DOE.

 	Analizar DOE. Paso 5.
1.	Vaciar los datos obtenidos en la simulación.
2.	Analizar el DOE. En la barra de herramientas, seleccionar Herramientas/DOE/Factorial/Analizar diseño factorial. En donde se obtiene el modelo lineal general de las variables de respuesta vs los factores de entrada. Así como las gráficas de interacción de las variables de respuesta. 
