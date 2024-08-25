%Abrir archivo
clc
close all
% D adquiere los datos del archivo, t el vector de tiempo en s y vel toma
% la columna de velocidades
D=load('integrauno.txt');
t=(1:1:length(D));
vel=D(:,5);
% Almacenaje de tipos de ráfagas detectadas fila-1=tiempoinicial y fila-2=velpromedio
rafagaa=zeros(1,10);
rafagab=zeros(1,10);
rafagac=zeros(1,10);
rafagad=zeros(1,10);
rafagae=zeros(1,10);
rafagaf=zeros(1,10);
%Almacenaje para tipo de ráfaga Coherente
rafagantea=zeros(1,10);
rafaganteb=zeros(1,10);
rafagantec=zeros(1,10);
rafaganted=zeros(1,10);
rafagantee=zeros(1,10);
rafagantef=zeros(1,10);
%Datos por ráfaga detectada a graficar
vf=zeros(10,length(D));
ve=zeros(10,length(D));
vd=zeros(10,length(D));
vc=zeros(10,length(D));
vb=zeros(10,length(D));
va=zeros(10,length(D));
%Datos por ráfaga detectada a graficar
Rcf=zeros(10,length(D));
Rce=zeros(10,length(D));
Rcd=zeros(10,length(D));
Rcc=zeros(10,length(D));
Rcb=zeros(10,length(D));
Rca=zeros(10,length(D));
%Almacenaje de Intensidad de T y Desviación S
iturbul=zeros(1,length(D));
ds=zeros(1,length(D));
%Umbral s y b del cambio de velocidad de detección y datos antes para velpromedio 

%Cambio mp y Ucg

mp=20;
dp=600;
Ucg=18.5;
for h=4:9 % Define 6 tipos de ráfagas (a-f) por el ts=tb 
    k=1; % contador de 1er criterio
    s=1; % contador coherente   
for i=1:length(D)-19 % i define el indice con el cual se calcula todo
          % Obtiene el cambio de vel s y b dependiendo tipo de ráfaga 
dif= vel(i+h)-vel(i);
difr= vel(i+h)-vel(i+(2*h)+1); % +1 porque el tiempo de bajada es mayor 

   if h==4 % caso ráfaga a
   if dif>=mp && difr>=mp %1er criterio DeltaV s y b
        rafagaa(1,k)=i;
        k=k+1;
   end
  % rágafa coherente a
  if dif>=Ucg %primer criterio de RC
  rafagantea(1,s)=i;
  s=s+1;
   end
   end
   
   if h==5 
    if dif>=mp && difr>=mp
      rafagab(1,k)=i;
         k=k+1;
    end
  % rágafa coherente b
  if dif>=Ucg %primer criterio de RC
  rafaganteb(1,s)=i;
  s=s+1;
  end
  end

   if h==6 
    if dif>=mp && difr>=mp
     rafagac(1,k)=i;
         k=k+1;
    end
  % rágafa coherente c
  if dif>=Ucg %primer criterio de RC
  rafagantec(1,s)=i;
  s=s+1;
   end
   end

   if h==7 
    if dif>=mp && difr>=mp
     rafagad(1,k)=i;
         k=k+1;
    end
  % rágafa coherente d
  if dif>=Ucg %primer criterio de RC
  rafaganted(1,s)=i;
  s=s+1;
   end  
   end

   if h==8 
    if dif>=mp && difr>=mp
       rafagae(1,k)=i;
         k=k+1;
    end
  % rágafa coherente e
  if dif>=Ucg %primer criterio de RC
  rafagantee(1,s)=i;
  s=s+1;
   end
   end 

   if h==9 
     if dif>=mp && difr>=mp
      rafagaf(1,k)=i;
         k=k+1;
     end
  % rágafa coherente f
  if dif>=Ucg %primer criterio de RC
  rafagantef(1,s)=i;
  s=s+1;
   end
   end 
end
end


%Almacena ráfagas f detectadas y agrega 21 datos (depende del tiempo de R) en vector vf (solo dos criterios¡¡¡)
for n=1:length(rafagaf) % obtiene del vector ráfagaf de su primera fila (siguiente for), no hace nada con las demás filas
    
for i=rafagaf(1,n):rafagaf(1,n)+21 % i=indice contiene el tiempo inicial de ráfaga detectada + 21 i más
    if rafagaf(1,n)~=0 % si no hay cero imprime en el vector vf la vel i + vel de 21 datos más
 vf(n,i)=vel(i); % n es columna (rafaga encontrada) por ello imprime vertical las 21 vel (filas=vel´s)
    end 
end
end
%Almacena ráfagas coherentes f detectadas y agrega 11 datos (depende del tiempo de R) en vector Rcf (solo dos criterios¡¡¡)
for n=1:length(rafagantef) % obtiene del vector ráfagaf de su primera fila (siguiente for), no hace nada con las demás filas
    
for i=rafagantef(1,n):rafagantef(1,n)+11 % i=indice contiene el tiempo inicial de ráfaga detectada + 21 i más
    if rafagantef(1,n)~=0 % si no hay cero imprime en el vector vf la vel i + vel de 11 datos más
 Rcf(n,i)=vel(i); % n es columna (rafaga encontrada) por ello imprime vertical las 11 vel (filas=vel´s)
    end 
end
end


%Almacena e
for n=1:length(rafagae)
    
for i=rafagae(1,n):rafagae(1,n)+19
    if rafagae(1,n)~=0
 ve(n,i)=vel(i);
    end
end
end

%Almacena ráfagas coherentes e detectadas y agrega 10 datos (depende del tiempo de R) en vector Rcf (solo dos criterios¡¡¡)
for n=1:length(rafagantee) % obtiene del vector ráfagaf de su primera fila (siguiente for), no hace nada con las demás filas
    
for i=rafagantee(1,n):rafagantee(1,n)+10 % i=indice contiene el tiempo inicial de ráfaga detectada + 10 i más
    if rafagantee(1,n)~=0 % si no hay cero imprime en el vector vf la vel i + vel de 10 datos más
 Rce(n,i)=vel(i); % n es columna (rafaga encontrada) por ello imprime vertical las 10 vel (filas=vel´s)
    end 
end
end


%Almacena d
for n=1:length(rafagad)
    
for i=rafagad(1,n):rafagad(1,n)+17
     if rafagad(1,n)~=0
 vd(n,i)=vel(i);
     end
end
end

%Almacena ráfagas coherentes d detectadas y agrega 9 datos (depende del tiempo de R) en vector Rcf (solo dos criterios¡¡¡)
for n=1:length(rafaganted) % obtiene del vector ráfagaf de su primera fila (siguiente for), no hace nada con las demás filas
    
for i=rafaganted(1,n):rafaganted(1,n)+9 % i=indice contiene el tiempo inicial de ráfaga detectada + 9 i más
    if rafaganted(1,n)~=0 % si no hay cero imprime en el vector vf la vel i + vel de 9 datos más
 Rcd(n,i)=vel(i); % n es columna (rafaga encontrada) por ello imprime vertical las 21 vel (filas=vel´s)
    end 
end
end

%Almacena c
for n=1:length(rafagac)
    
for i=rafagac(1,n):rafagac(1,n)+15
if rafagac(1,n)~=0
 vc(n,i)=vel(i);
end
end
end

%Almacena ráfagas coherentes c detectadas y agrega 8 datos (depende del tiempo de R) en vector Rcf (solo dos criterios¡¡¡)
for n=1:length(rafagantec) % obtiene del vector ráfagaf de su primera fila (siguiente for), no hace nada con las demás filas
    
for i=rafagantec(1,n):rafagantec(1,n)+8 % i=indice contiene el tiempo inicial de ráfaga detectada + 8 i más
    if rafagantec(1,n)~=0 % si no hay cero imprime en el vector vf la vel i + vel de 10 datos más
 Rcc(n,i)=vel(i); % n es columna (rafaga encontrada) por ello imprime vertical las 21 vel (filas=vel´s)
    end 
end
end

%Almacena b
for n=1:length(rafagab)
    
for i=rafagab(1,n):rafagab(1,n)+13
if rafagab(1,n)~=0
 vb(n,i)=vel(i);
end
end
end

%Almacena ráfagas coherentes b detectadas y agrega 7 datos (depende del tiempo de R) en vector Rcf (solo dos criterios¡¡¡)
for n=1:length(rafaganteb) % obtiene del vector ráfagaf de su primera fila (siguiente for), no hace nada con las demás filas
    
for i=rafaganteb(1,n):rafaganteb(1,n)+7 % i=indice contiene el tiempo inicial de ráfaga detectada + 7 i más
    if rafaganteb(1,n)~=0 % si no hay cero imprime en el vector vf la vel i + vel de 7 datos más
 Rcb(n,i)=vel(i); % n es columna (rafaga encontrada) por ello imprime vertical las 21 vel (filas=vel´s)
    end 
end
end

%Almacena a

for n=1:length(rafagaa)
    
for i=rafagaa(1,n):rafagaa(1,n)+11
if rafagaa(1,n)~=0
 va(n,i)=vel(i);
end
end
end

%Almacena ráfagas coherentes a detectadas y agrega 6 datos (depende del tiempo de R) en vector Rcf (solo dos criterios¡¡¡)
for n=1:length(rafagantea) % obtiene del vector ráfagaf de su primera fila (siguiente for), no hace nada con las demás filas
    
for i=rafagantea(1,n):rafagantea(1,n)+6 % i=indice contiene el tiempo inicial de ráfaga detectada + 6 i más
    if rafagantea(1,n)~=0 % si no hay cero imprime en el vector vf la vel i + vel de 6 datos más
 Rca(n,i)=vel(i); % n es columna (rafaga encontrada) por ello imprime vertical las 21 vel (filas=vel´s)
    end 
end
end

%Graficar
plot(t,vel,'cyan','LineWidth',1) % grafica general
title('Detección de ráfagas')
xlabel('t (s)')
ylabel('U(m/s)')

% Gráfica tipos de ráfagas
vf=vf';
hold on
for l=1:length(rafagaf) 
    for i=1:length(t)
    if vf(i,1)>0  % grafica si no es cero 
plot(t(i),vf(i,1),'*m','LineWidth',3) % Mueve la fila i y después la columna l (no eficiente), gráfica con color
    end
    end
end

% Gráfica tipos de ráfagas Coherente 
Rcf=Rcf';
hold on
for l=1:length(rafagantef) 
    for i=1:length(t)
    if Rcf(i,l)>0  % grafica si no es cero 
plot(t(i),Rcf(i,l),'om','LineWidth',3) % Mueve la fila i y después la columna l (no eficiente), gráfica con color
    end
    end
end

ve=ve';
hold on
for l=1:length(rafagae)
    for i=1:length(t)
    if ve(i,l)>0
    plot(t(i),ve(i,l),'*b','LineWidth',3)
    end
    end
end

% Gráfica tipos de ráfagas Coherente 
Rce=Rce';
hold on
for l=1:length(rafagantee) 
    for i=1:length(t)
    if Rce(i,l)>0  % grafica si no es cero 
plot(t(i),Rce(i,l),'ob','LineWidth',3) % Mueve la fila i y después la columna l (no eficiente), gráfica con color
    end
    end
end

vd=vd';
hold on
for l=1:length(rafagad)
    for i=1:length(t)
    if vd(i,l)>0
    plot(t(i),vd(i,l),'*k','LineWidth',3)
    end
    end
end

% Gráfica tipos de ráfagas Coherente 
Rcd=Rcd';
hold on
for l=1:length(rafaganted) 
    for i=1:length(t)
    if Rcd(i,l)>0  % grafica si no es cero 
plot(t(i),Rcd(i,l),'ok','LineWidth',3) % Mueve la fila i y después la columna l (no eficiente), gráfica con color
    end
    end
end

vc=vc';
hold on
for l=1:length(rafagac)
    for i=1:length(t)
    if vc(i,l)>0
    plot(t(i),vc(i,l),'*g','LineWidth',3)
    end
    end
end

% Gráfica tipos de ráfagas Coherente 
Rcc=Rcc';
hold on
for l=1:length(rafagantec) 
    for i=1:length(t)
    if Rcc(i,l)>0  % grafica si no es cero 
plot(t(i),Rcc(i,l),'og','LineWidth',3) % Mueve la fila i y después la columna l (no eficiente), gráfica con color
    end
    end
end

vb=vb';
hold on
for l=1:length(rafagab)
    for i=1:length(t)
    if vb(i,l)>0
    plot(t(i),vb(i,l),'*c','LineWidth',3)
    end
    end
end

% Gráfica tipos de ráfagas Coherente 
Rcb=Rcb';
hold on
for l=1:length(rafaganteb) 
    for i=1:length(t)
    if Rcb(i,l)>0  % grafica si no es cero 
plot(t(i),Rcb(i,l),'oc','LineWidth',3) % Mueve la fila i y después la columna l (no eficiente), gráfica con color
    end
    end
end

va=va';
hold on
for l=1:length(rafagaa)
    for i=1:length(t)
    if va(i,l)>0
plot(t(i),va(i,l),'*r','LineWidth',3)
    end
    end
end

% Gráfica tipos de ráfagas Coherente 
Rca=Rca';
hold on
for l=1:length(rafagantea) 
    for i=1:length(t)
    if Rca(i,l)>0  % grafica si no es cero 
plot(t(i),Rca(i,l),'or','LineWidth',3) % Mueve la fila i y después la columna l (no eficiente), gráfica con color
    end
    end
end

%Criterios de busqueda en base de datos
Itpro=mean(iturbul);
sdpro=mean(ds);
Vpro=mean(vel);