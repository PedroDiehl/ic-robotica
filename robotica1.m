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

x_ee = 1;
y_ee = 1;

[theta1, theta2] = invKin([x_ee; y_ee], a1, a2, 'deg', 'algebraic')

x1 = a1 * cosd(theta1);
y1 = a1 * sind(theta1);

x2 = a2 * cosd(theta2);
y2 = a2 * sind(theta2);
