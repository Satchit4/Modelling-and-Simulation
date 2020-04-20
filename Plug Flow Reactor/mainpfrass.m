clc
clear all
close all
global n   % No of CVs
global nc  % No of Components
global nr  % No of Reactions 
global u   % input variables
global mu  % Stochiometric coefficents matrix
global p   % constant parameters
global delx % Length of each element

% Assume unit cross sectional area
n  = 100;  % Number of CVs (elements)
nc = 6;    
nr = 3;
V_in = 10;  % Volumetric flow rate
V  = 50;   % Volume of the reactor
vx = V_in; % x-velocity

delx = V/n; 
% Entering input variables
u = [1.5; 2; 0; 0; 0; 0];  % [C_Ain C_Bin C_Cin C_Din C_Ein C_Fin ]
% Entering constant parameters
p = [0.25; 0.1; 5; vx];   %[K1 K2 K3 K4 vx]

% Entering Stochiometric coefficients
mu = [-1 -3 0; ...    
      -2 0 -1; ...
       1 1 -2;   ...
       1 -2 1;  ...
       0 1 0; ...
       0 0 1];
% Initial Conditions of the PFR
C0 = zeros(n*nc,1);

% Entering intergrating time span
tspan = [0 1000];

%ODE Solver
[t,C] = ode15s(@multipfr,tspan, C0);

% Segregating the concentrations of each Component
% A-----------------
C_A = C(:,1:n);
% B-----------------
C_B = C(:,n+1:2*n);
% B-----------------
C_C = C(:,2*n+1:3*n);
% B-----------------
C_D = C(:,3*n+1:4*n);
% B-----------------
C_E = C(:,4*n+1:5*n);
% B-----------------
C_F = C(:,5*n+1:6*n);


%Surface plots
%---------------------------
figure(1)
surf(delx:delx:n*delx,t,C_A)
figure(2)
surf(delx:delx:n*delx,t,C_B)
figure(3)
surf(delx:delx:n*delx,t,C_C)
figure(4)
surf(delx:delx:n*delx,t,C_D)
figure(5)
surf(delx:delx:n*delx,t,C_E)
figure(6)
surf(delx:delx:n*delx,t,C_F)
figure(7)
plot(delx:delx:n*delx,C_A);
