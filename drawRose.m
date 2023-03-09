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

rest_a1 = [a1; 0; 0];
rest_a2 = [a2; 0; 0];

% Defasagem
h = 1; % em x
k = 1; % em y

% Pares de petalas
n = 2;

for phi = 0:0.01:(2 * pi)
    % Equacao parametrica para o circulo
    r_rosa = cos(2 * n * phi);
    p_rosa = [h + (r_rosa * cos(phi));
                 k + (r_rosa * sin(phi))];

    if isequal(phi, 0)
        moveManip(a1, a2, rest_a1, rest_a2, p_rosa,0);
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
    axis([-3 3 -3 3]);
  
    pause(5e-12);
end

rest_pos = rest_a1 + rest_a2;
moveManip(rest_a1, rest_a2, rest_pos(1:2,:));
