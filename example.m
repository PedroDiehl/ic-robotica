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

% Cria uma instancia do robo
robot = RobotRR(a1, a2);

%robot.drawHorizontalHalfCircle(1, 1, 1, 1, -1)
robot.drawVerticalHalfCircle(1, 1, 1, -1, 1)
robot.moveManipulatorToRest();
