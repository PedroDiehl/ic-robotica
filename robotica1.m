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
y_ee = 2;
p_ee = [x_ee; y_ee];

[theta1, theta2] = invKin(p_ee, a1, a2, 'deg', 'algebraic')

posicao_1 = rM('z', theta1, 'deg') * point_a1
posicao_2 = rM('z', (theta1 + theta2), 'deg') * point_a2

plot([0 posicao_1(1)],  [0 posicao_1(2)], 'r', [posicao_1(1) (posicao_1(1) + posicao_2(1))], [posicao_1(2) (posicao_1(2) + posicao_2(2))], 'b', 'linewidth', 3);
grid on
axis([-3 3 -3 3]);

