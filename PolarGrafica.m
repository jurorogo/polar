% Juan R. Robles Gómez %
% ---------------------------------------------------------
% CÁLCULO DE LA POLAR  %
% GRÁFICOS                       %
% Supemarine Spitfire      %
% ---------------------------------------------------------
% Puedes encontrar la guía de uso en GitHub:
% https://github.com/jurorogo/Polar/blob/master/README.md

%% Variables definidas
% Avión (Supermarine Spitfire)
w = 3000; % Masa (kg)
AR = 5.575; % Alargamiento (adimensional)
s = 22.5; % Superficie alar (m^2)
l = 9.1; % Longitud del fuselaje (m)
e = 1; % Alas elípticas 

% Aire
gamma = 1.4;
R = 287;
mu0 = 3.65*10^(-7); %(lb*s)/ft^2
T0 = 518.7; %Rankine
KaR = 9/5; %1 Rankine = 5/9 Kelvin

% Variables 
v = input('Introduce la velocidad de vuelo(m/s): ');
h = input('Introduce la altitud de vuelo(m): ');
ISA = input('Introduce variación en ISA: ');

fprintf('\n');
disp('------ CONDICIONES ATMOSFÉRICAS ------');

T = 288.15 - (6.5*(h/1000))+ISA; %ISA
fprintf('Temperatura (T): %g\n',T);
ro = 1.2250*((T/288.15)^((9.8/(0.0065*R))-1)); %ISA
fprintf('Densidad (ro): %g\n',ro);

%% Viscosidad
mu = mu0 * ((KaR*T)/T0)^(1.5) * ((T0+198.72)/((KaR*T)+198.72)); %(lb*s)/ft^2
mu = mu * (0.453592*9.8)/(0.092903); % Sistema internacional
fprintf('Viscosidad (mu): %d\n', mu);

%% Mach
M = v/sqrt((R*gamma*T));
fprintf('Mach: %g\n', M);

%% Coeficiente de sustentacion
Cl = (2*w*9.8)/(ro*(v^2)*s);

% PARTES DEL AVIÓN
fprintf('\n');
disp('------------ COEFICIENTES ------------');
%% ALA
disp('ALA -----------------');

% Parámetros (ajustar)
Swet = 45;  
x = 0.95;   
t = 0.35;
c = 2.009; 
lambdam = 0; 

% Reynolds
Re = (c*ro*v)/mu;
Recutoff = 38.25*(c/(3.33*10^-5))^1.053;
fprintf('Reynolds: %d, Recutoff: %d\n', Re, Recutoff);

% Porcentajes
%plam = input('Introduce el porcentaje de capa límite laminar (0.~): ');
plam = 0.2;
pturb = 1 - plam;

% Coeficientes de fricción
cflam = 1.328/sqrt(Re);
fprintf('Cf laminar: %g\n', cflam);

cfturb = 0.445/((log10(Re)^(2.58))*((1+0.144*M^2)^0.65));
fprintf('Cf turbulento: %g\n', cfturb);

cf = cflam*plam + cfturb*pturb;
fprintf('Cf : %g\n', cf);

% Factor de forma y de interferencia        
FI = 1.25; 
   
FF = (1+(0.6/(x/c))*(t/c)+100*(t/c)^4)*(1.34*M^0.18*(cosd(lambdam))^0.28);
fprintf('FF: %g, FI: %g \n', FF, FI);
% Se podría añadir una función de saturación de FF para evitar que salga
% del rango 1 a 1.35, como se expone en la teoría.

% Coeficiente de resistencia

Cdoa = (Swet*cf*FF*FI);
fprintf('Cdo: %g\n', Cdoa);

%% ESTABILIZADOR HORIZONTAL
fprintf('\n');
disp('ESTABILIZADOR HORIZONTAL ----------');

% Parámetros (ajustar)
Swet = 7.4;
FI = 1.04;
x = 0.71;
t = 0.12;
c = 2.3;
lambdam = 0;

% Reynolds
Re = (c*ro*v)/mu;
Recutoff = 38.25*(c/(3.33*10^-5))^1.053;
fprintf('Reynolds: %d, Recutoff: %d\n', Re, Recutoff);

% Porcentajes
%plam = input('Introduce el porcentaje de capa límite laminar (0.~): ');
plam = 0.2;
pturb = 1 - plam;

% Coeficientes de fricción
cflam = 1.328/sqrt(Re);
fprintf('Cf laminar: %g\n', cflam);

cfturb = 0.445/((log10(Re)^(2.58))*((1+0.144*M^2)^0.65));
fprintf('Cf turbulento: %g\n', cfturb);

cf = cflam*plam + cfturb*pturb;
fprintf('Cf : %g\n', cf);

%Factor de forma e interferencia
   
FF = (1+(0.6/(x/c))*(t/c)+100*(t/c)^4)*(1.34*M^0.18*(cosd(lambdam))^0.28);
fprintf('FF: %g, FI: %g \n', FF, FI);

% Coeficiente de resistencia

Cdoeh = (Swet*cf*FF*FI);
fprintf('Cdo: %g\n', Cdoeh);

%% ESTABILIZADOR VERTICAL
fprintf('\n');
disp('ESTABILIZADOR VERTICAL --------');

% Parámetros (ajustar)
Swet = 2.6;
FI = 1.04;
x = 0.35;
t = 0.24;
c = 2.5;
lambdam = 0;
        
% Reynolds
Re = (c*ro*v)/mu;
Recutoff = 38.25*(c/(3.33*10^-5))^1.053;
fprintf('Reynolds: %d, Recutoff: %d\n', Re, Recutoff);

% Porcentajes
%plam = input('Introduce el porcentaje de capa límite laminar (0.~): ');
plam = 0.2;
pturb = 1 - plam;

% Coeficientes de fricción
cflam = 1.328/sqrt(Re);
fprintf('Cf laminar: %g\n', cflam);

cfturb = 0.445/((log10(Re)^(2.58))*((1+0.144*M^2)^0.65));
fprintf('Cf turbulento: %g\n', cfturb);

cf = cflam*plam + cfturb*pturb;
fprintf('Cf : %g\n', cf);

%Factor de forma e interferencia
   
FF = (1+(0.6/(x/c))*(t/c)+100*(t/c)^4)*(1.34*M^0.18*(cosd(lambdam))^0.28);
fprintf('FF: %g, FI: %g \n', FF, FI);

% Coeficiente de resistencia

Cdoev = (Swet*cf*FF*FI);
fprintf('Cdo: %g\n', Cdoev);

%% Fuselaje
fprintf('\n');
disp('FUSELAJE ------------');

% Parámetros (ajustar)
Amax = 2.3;
FI = 1;
c = 1.7; %Diámetro

% Reynolds
Re = (c*ro*v)/mu;
Recutoff = 38.25*(c/(3.33*10^-5))^1.053;
fprintf('Reynolds: %d, Recutoff: %d\n', Re, Recutoff);

% Porcentajes
%plam = input('Introduce el porcentaje de capa límite laminar (0.~): ');
plam = 0.2;
pturb = 1 - plam;

% Coeficientes de fricción
cflam = 1.328/sqrt(Re);
fprintf('Cf laminar: %g\n', cflam);

cfturb = 0.445/((log10(Re)^(2.58))*((1+0.144*M^2)^0.65));
fprintf('Cf turbulento: %g\n', cfturb);

cf = cflam*plam + cfturb*pturb;
fprintf('Cf : %g\n', cf);

% Factor de forma e interferencia
d = sqrt((4/pi)*Amax);
f = l/d;
fprintf('f: %g\n', f);
        
FF = (1+(60/f^3)+(f/400));        
fprintf('FF: %g, FI: %g \n', FF, FI);

% Coeficiente de resistencia

Cdof = (Swet*cf*FF*FI);
fprintf('Cdo: %g\n', Cdof);
fprintf('\n');

disp('-------- RESULTADOS FINALES --------');

%% Coeficiente de resistencia
Cdot = [Cdoa Cdoeh Cdoev Cdof];
Cdo = sum(Cdot)/s;
fprintf('Cdo: %g\n', Cdo);

Cdi = Cl^2/(pi*AR*e);
fprintf('Cdi: %g\n', Cdi);

Cd = Cdo + Cdi;
fprintf('Cd: %g\n', Cd);

%% Coeficiente de sustentación
fprintf('Cl: %g\n', Cl);

%% Resistencia
D = (Cd*ro*v^2*s)/2;
fprintf('D: %g\n',D);

%% Eficiencia
Ef = Cl/Cd;
fprintf('Eficiencia: %g\n',Ef);

%% Gráficas
% CL entre 0 y 1.5
CL = linspace(0,1.5,100);

CD = Cdo + CL.^2/(pi*AR*s);

plot(CD,CL);

% Leyenda
graf1 = 'Nominal';
graf2 = 'ISA+10';
graf3 = 'ISA-10';
legend(graf1, graf2, graf3);
% Ajustes
grid on;
title('Curva polar');
xlabel('CD');
ylabel('CL');
hold on;