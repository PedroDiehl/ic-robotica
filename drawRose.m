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

point_a1 = [a1; 0; 0];
point_a2 = [a2; 0; 0];

x_ee = 2;
y_ee = 1;

% Defasagem
h = 1; % em x
k = 1; % em y

% Pares de petalas
n = 2;


for phi = 0:0.01:(2 * pi)
    % Equacao parametrica para o circulo
    r_rosa = cos(2 * n * phi);
    p_circulo = [h + (r_rosa * cos(phi));
                 k + (r_rosa * sin(phi))];
 
    %p_circulo = [1; 2];
    [theta1, theta2] = invKin(p_circulo, a1, a2, 'deg', 'algebraic');

    posicao_1 = rM('z', theta1, 'deg') * point_a1;
    posicao_2 = rM('z', (theta1 + theta2), 'deg') * point_a2;
    
    figure(1)
    plotArm(posicao_1, posicao_2);
    
    figure(2)
    plot((posicao_1(1) + posicao_2(1)), (posicao_1(2) + posicao_2(2)), '.', 'linewidth', 0.5);
    grid on
    hold on
    axis([-3 3 -3 3]);
  
    pause(5e-12);
end