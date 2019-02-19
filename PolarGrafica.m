% Juan R. Robles Gómez %

% CÁLCULO DE LA POLAR  %
% GRÁFICOS             %
% Supemarine Spitfire  %

%% Variables definidas
%Avión (Supermarine Spitfire)
w = 3000;
AR = 5.575;
s = 22.5;
l = 9.1;

%Aire
gamma = 1.4;
e = 1; %Alas elípticas
R = 287;
mu0 = 3.65*10^(-7); %(lb*s)/ft^2
T0 = 518.7; %Rankine
KaR = 9/5; %1 Rankine = 5/9 Kelvin
%Variables
v = input('Introduce la velocidad de vuelo(m/s): ');
h = input('Introduce la altitud de vuelo(m): ');
ISA = input('Introduce variación en ISA: ');

T = 288.15 - (6.5*(h/1000))+ISA; %ISA
fprintf('T: %g\n',T);
ro = 1.2250*((T/288.15)^((9.8/(0.0065*R))-1)); %ISA
fprintf('ro: %g\n',ro);

%% Viscosidad
mu = mu0 * ((KaR*T)/T0)^(1.5) * ((T0+198.72)/((KaR*T)+198.72)); %(lb*s)/ft^2
mu = mu * (0.453592*9.8)/(0.092903);
fprintf('Viscosidad (mu): %d\n', mu);

%% Mach
M = v/sqrt((R*gamma*T));
fprintf('Mach: %g\n', M);

%% Coeficiente de sustentacion
Cl = (2*w*9.8)/(ro*(v^2)*s);

%% ALA
fprintf('\n');
disp('ALA -----------------');
Swet = 45;
x = 0.95;
t = 0.35;
c = 2.009; 
lambdam = 0; %AJUSTAR 

% Reynolds
Re = (c*ro*v)/mu;
Recutoff = 38.25*(c/(3.33*10^-5))^1.053;
fprintf('Reynolds, Recutoff: %d, %d\n', Re,Recutoff);

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

%Factor de forma y de interferencia        
FI = 1.25; %Por las metralletas de las alas
   
FF = (1+(0.6/(x/c))*(t/c)+100*(t/c)^4)*(1.34*M^0.18*(cosd(lambdam))^0.28);
fprintf('FF, FI: %g %g\n', FF, FI);

% Coeficiente de resistencia

Cdoa = (Swet*cf*FF*FI);
fprintf('Cdo: %g\n', Cdoa);

%% ESTABILIZADOR HORIZONTAL
fprintf('\n');
disp('ESTABILIZADOR HORIZONTAL ----------');

Swet = 7.4;
FI = 1.04;
x = 0.71;
t = 0.12;
c = 2.3;
lambdam = 0; %AJUSTAR

% Reynolds
Re = (c*ro*v)/mu;
Recutoff = 38.25*(c/(3.33*10^-5))^1.053;
fprintf('Reynolds, Recutoff: %d, %d\n', Re,Recutoff);

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
fprintf('FF, FI: %g %g\n', FF, FI);

% Coeficiente de resistencia

Cdoeh = (Swet*cf*FF*FI);
fprintf('Cdo: %g\n', Cdoeh);

%% ESTABILIZADOR VERTICAL
fprintf('\n');
disp('ESTABILIZADOR VERTICAL --------');

Swet = 2.6;
FI = 1.04;
x = 0.35;
t = 0.24;
c = 2.5;
lambdam = 0; %AJUSTAR
        
% Reynolds
Re = (c*ro*v)/mu;
Recutoff = 38.25*(c/(3.33*10^-5))^1.053;
fprintf('Reynolds, Recutoff: %d, %d\n', Re,Recutoff);

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
fprintf('FF, FI: %g %g\n', FF, FI);

% Coeficiente de resistencia

Cdoev = (Swet*cf*FF*FI);
fprintf('Cdo: %g\n', Cdoev);

%% Fuselaje
fprintf('\n');
disp('FUSELAJE ------------');
Amax = 2.3;
FI = 1;
c = 1.7; %Diámetro

% Reynolds
Re = (c*ro*v)/mu;
Recutoff = 38.25*(c/(3.33*10^-5))^1.053;
fprintf('Reynolds, Recutoff: %d, %d\n', Re,Recutoff);

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
fprintf('FF, FI: %g %g\n', FF, FI);

% Coeficiente de resistencia

Cdof = (Swet*cf*FF*FI);
fprintf('Cdo: %g\n', Cdof);
fprintf('\n');

disp('RESULTADOS FINALES --------');

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
CL = linspace(0,1.5,100);
CD = Cdo + CL.^2/(pi*AR*s);

plot(CD,CL);

legend('Nominal', 'ISA+10', 'ISA-10');
grid on;
title('Curva polar');
xlabel('CD');
ylabel('CL');
hold on;