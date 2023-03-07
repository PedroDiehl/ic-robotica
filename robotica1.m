%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para resolver as questoes referentes ao estudo de robotica.
%}

format short
clc, close all, clear all

a1 = 1;
a2 = 2;

point_a1 = [a1; 0; 0];
point_a2 = [a2; 0; 0];

x_ee = 2;
y_ee = 1;

% Defasagem do circulo
h = 1;
k = 1;

% Raio do circulo
r = 0.5;


for phi = 0:0.1:(2 * pi)
    % Equacao parametrica para o circulo
    p_circulo = [(h + r * cos(phi));
                 (k + r * sin(phi))];
 
    
    %p_circulo = [1; 2];
    [theta1, theta2] = invKin(p_circulo, a1, a2, 'deg', 'algebraic')

    posicao_1 = rM('z', theta1, 'deg') * point_a1;
    posicao_2 = rM('z', theta2, 'deg') * point_a2;
    
    hold on
    grid on
    %quiver(0, 0, posicao_1(1), posicao_1(2), 'r', 'LineWidth', a1);
    %quiver(posicao_1(1), posicao_1(2), posicao_2(1), posicao_2(2), 'b', 'LineWidth', a2);
    plot(posicao_1(1), posicao_1(2), 'o');
    plot(posicao_2(1), posicao_2(2), '*');
    
    %angle_between = rad2deg(atan2(norm(cross([posicao_1(1) posicao_1(2) 0],[posicao_2(1), posicao_2(2) 0])), dot([posicao_1(1), posicao_1(2) 0],[posicao_2(1), posicao_2(2) 0])));
    %text(0, 0, [num2str(theta1), '\circ']);
    %text(posicao_1(1), posicao_1(2), [num2str(angle_between), '\circ']);

    axis([-3 3 -3 3]);
    pause(0.5);
    %plot(x1, y1, '-ro')
end

