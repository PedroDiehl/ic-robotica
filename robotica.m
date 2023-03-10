%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para resolver as questoes referentes ao estudo de robotica.
%}

format short
clc, close all, clear all

% Parametros dos elos do robo e do destino para o efetuador final
a1 = 3;
a2 = 3;
x_ee = 2;
y_ee = 1;

[robot, endEffectorPos] = baseSetup(a1, a2, x_ee, y_ee);

% Calcula os angulos para as juntas com base na posicao desejada para o ee
[theta1, theta2] = invKin(endEffectorPos,...
                          robot.links(1).size,...
                          robot.links(2).size,...
                          'deg',...
                          'algebraic');

% Aplica a matriz de rotacao com os resultados obtidos nos pontos
%robot.links(1).updateEndPos(rM('z', theta1, 'deg'), theta1);
%robot.links(2).updateEndPos(rM('z', (theta1 + theta2), 'deg'), theta2);
moveManip(robot, endEffectorPos);

% Apresenta a combinacao resultante dos elos + juntas
figure(1)
plotArm(robot.links(1).endPos, robot.links(2).endPos);
