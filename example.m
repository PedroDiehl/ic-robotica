%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Exemplo de uso
%}

format short
clc, close all, clear all

% Parametros dos elos do robo
a1 = 3; % Comprimento do primeiro elo
a2 = 3; % Comprimento do segundo elo

x_ee = -2;
y_ee = 2;
endEffectorPos = [x_ee;
                  y_ee;
                  0];

% Cria uma instancia do robo
robot = RobotRR(a1, a2);

% Move o manipulador para a posicao desejada
robot.moveManipulator(endEffectorPos);

% Desenha um circulo
robot.drawCircle(1, -1, 1);
%robot.moveManipulatorToRest();
%robot.drawCircle(-2, -1, 0.5);
%robot.moveManipulatorToRest();
