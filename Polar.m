% Juan R. Robles Gómez %

% CÁLCULO DE LA POLAR  %
% Supemarine Spitfire  %

%% Variables definidas
%Avión (Supermarine Spitfire)
w = 3000;
cma = 2.16;
s = 22.5;
l = 9.1;
AR = 5.575;
Swet = 97.5;
%Aire
gamma = 1.4;
e = 1;
R = 287;
mu0 = 3.65*10^(-7); %(lb*s)/ft^2
T0 = 518.7; %Rankine
KaR = 9/5; %1 Rankine = 5/9 Kelvin
%Variables
T = input('Introduce la temperatura(K): ');
v = input('Introduce la velocidad de vuelo(m/s): ');
h = input('Introduce la altitud de vuelo(m): ');
ro = input('Introduce la densidad del aire(kg/m^3): ');

%% Viscosidad
mu = mu0 * ((KaR*T)/T0)^(1.5) * ((T0+198.72)/((KaR*T)+198.72)); %(lb*s)/ft^2
mu = mu * (0.453592*9.8)/(0.092903);
fprintf('Viscosidad (mu): %d\n', mu);

%% Mach
M = v/sqrt((R*gamma*T));
fprintf('Mach: %d\n', M);

%% Reynolds
Re = (cma*ro*v)/mu;
fprintf('Reynolds: %d\n', Re);

%% Porcentajes
plam = input('Introduce el porcentaje de capa límite laminar (0.~): ');
pturb = 1 - plam;

%% Coeficiente de sustentación
Cl = (w*9.8)/(ro*(v^2)*s/2);
fprintf('Cl: %d\n', Cl);

%% Coeficientes de fricción
cflam = 1.328/sqrt(Re);
fprintf('Cf laminar: %d\n', cflam);

cfturb = 0.445/((log10(Re)^(2.58))*((1+0.144*M^2)^0.65))
fprintf('Cf turbulento: %d\n', cfturb);

cf = cflam*plam + cfturb*pturb;
fprintf('Cf : %d\n', cf);

%% Factor de forma
tipo = input('Introduce el elemento para calcular FF (a/f/m), motor aun no: ','s');

if tipo == 'a'
    disp('Ala o establizador');
    
    tipo2 = input('Introduce el tipo de ala o estabilizador (a/eh/ev): ','s');
    
    %ALA
    if tipo2 == 'a'
        disp('Ala');
        
        FI = 1.25; %Por las metralletas de las alas
        x = 0.95;
        t = 0.35;
        c = 2.009; 
        lambdam = 0; %AJUSTAR
    
    %ESTABILIZADOR HORIZONTAL
    elseif tipo2 == 'eh'
        disp('Estabilizador horizontal');
        
        FI = 1.04;
        x = 1;
        t = 1;
        c = 1;
        lambdam = 0; %AJUSTAR
        
    %ESTABILIZADOR VERTICAL
    elseif tipo2 == 'ev'
        disp('Estabilizador vertical');
        
        FI = 1.04;
        x = 1;
        t = 1;
        c = 1;
        lambdam = 0; %AJUSTAR
        
    else
        disp('Error en el tipo de ala');
    end
    
    FF = (1+(0.6/(x/c))*(t/c)+100*(t/c)^4)*(1.34*M^0.18*(cosd(lambdam))^0.28);
    
elseif tipo == 'f'
        disp('Fuselaje');
        Amax = 1;
        
        d = sqrt((4/pi)*Amax);
        f = l/d;
        fprintf('f: %d\n', f);
        
        FF = (1+(60/f^3)+(f/400));
        
else
        disp('Error en la elección de la parte del avión: ');
end

fprintf('FF: %d\n', FF);

%% Coeficiente de resistencia

Cdo = (Swet*cf*FF*FI)/s;
fprintf('Cdo: %d\n', Cdo);

Cdi = Cl^2/(pi*AR*e);
fprintf('Cdi: %d\n', Cdi);

Cd = Cdo + Cdi;
fprintf('Cd: %d\n', Cd);

%% Resistencia

D = (Cd*ro*v^2*s)/2;
fprintf('D: %d\n',D);