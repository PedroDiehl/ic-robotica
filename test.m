%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para desenhar uma rosacea utilizando o manipulador.
%}

format short
clc, close all, clear all

a1 = 3;
a2 = 3;
robot = RobotRR(a1, a2);

% Defasagem
h = 1; % em x
k = 1; % em y

% Pares de petalas
n = 2;

points = [[1   1]...
          [-1  1]...
          [-1 -1]...
          [1  -1]];

for item       
for phi = 0:0.01:(2 * pi)
    % Equacao parametrica para o circulo
    r_rosa = cos(2 * n * phi);
    p_rosa = [h + (r_rosa * cos(phi));
              k + (r_rosa * sin(phi))];

    if isequal(phi, 0)
        moveManip(rest_a1, rest_a2, rest_a1, rest_a2, p_rosa);
    end
    
    [theta1, theta2] = invKin(p_rosa, a1, a2, 'deg', 'algebraic');
   
    position_1 = rM('z', theta1, 'deg') * rest_a1;
    position_2 = rM('z', (theta1 + theta2), 'deg') * rest_a2;
    
    
    figure(1)
    plotArm(position_1, position_2);
    
    figure(2)
    plot((position_1(1) + position_2(1)), (position_1(2) + position_2(2)), '.', 'linewidth', 0.5);
    grid on
    hold on
    axis([-2 2 -2 2]);
  
    pause(5e-12);
end

%rest_pos = rest_a1 + rest_a2;
%moveManip(rest_a1, rest_a2, position_1, position_2, rest_pos(1:2,:));

k = -1;
n = 4;
for phi = 0:0.01:(2 * pi)
    % Equacao parametrica para o circulo
    r_rosa = cos(2 * n * phi);
    p_rosa = [h + (r_rosa * cos(phi));
              k + (r_rosa * sin(phi))];

    if isequal(phi, 0)
        moveManip(rest_a1, rest_a2, position_1, position_2, p_rosa);
    end
    
    [theta1, theta2] = invKin(p_rosa, a1, a2, 'deg', 'algebraic');
   
    position_1 = rM('z', theta1, 'deg') * rest_a1;
    position_2 = rM('z', (theta1 + theta2), 'deg') * rest_a2;
    
    
    figure(1)
    plotArm(position_1, position_2);
    
    figure(2)
    plot((position_1(1) + position_2(1)), (position_1(2) + position_2(2)), '.', 'linewidth', 0.5);
    grid on
    hold on
    axis([-2 2 -2 2]);
  
    pause(5e-16);
end

h = -1;
k = 1;
n= 6;
for phi = 0:0.01:(2 * pi)
    % Equacao parametrica para o circulo
    r_rosa = cos(2 * n * phi);
    p_rosa = [h + (r_rosa * cos(phi));
              k + (r_rosa * sin(phi))];

    if isequal(phi, 0)
        moveManip(rest_a1, rest_a2, position_1, position_2, p_rosa);
    end
    
    [theta1, theta2] = invKin(p_rosa, a1, a2, 'deg', 'algebraic');
   
    position_1 = rM('z', theta1, 'deg') * rest_a1;
    position_2 = rM('z', (theta1 + theta2), 'deg') * rest_a2;
    
    
    figure(1)
    plotArm(position_1, position_2);
    
    figure(2)
    plot((position_1(1) + position_2(1)), (position_1(2) + position_2(2)), '.', 'linewidth', 0.5);
    grid on
    hold on
    axis([-2 2 -2 2]);
  
    pause(5e-200);
end

h = -1;
k = -1;
n = 8;
for phi = 0:0.01:(2 * pi)
    % Equacao parametrica para o circulo
    r_rosa = cos(2 * n * phi);
    p_rosa = [h + (r_rosa * cos(phi));
              k + (r_rosa * sin(phi))];

    if isequal(phi, 0)
        moveManip(rest_a1, rest_a2, position_1, position_2, p_rosa);
    end
    
    [theta1, theta2] = invKin(p_rosa, a1, a2, 'deg', 'algebraic');
   
    position_1 = rM('z', theta1, 'deg') * rest_a1;
    position_2 = rM('z', (theta1 + theta2), 'deg') * rest_a2;
    
    
    figure(1)
    plotArm(position_1, position_2);
    
    figure(2)
    plot((position_1(1) + position_2(1)), (position_1(2) + position_2(2)), '.', 'linewidth', 0.5);
    grid on
    hold on
    axis([-2 2 -2 2]);
  
    pause(5e-1000);
end

rest_pos = rest_a1 + rest_a2;
moveManip(rest_a1, rest_a2, position_1, position_2, rest_pos(1:2,:));
