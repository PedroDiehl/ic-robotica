%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Exemplo de uso com desenho de um barco
%}

format short
clc, close all, clear all

% Parametros dos elos do robo
a1 = 3; % Comprimento do primeiro elo
a2 = 3; % Comprimento do segundo elo

% Cria uma instancia do robo
robot = RobotRR(a1, a2);

robot.moveManipulator([3; 0; 0]);

robot.drawLine([1; -1; 0]);
robot.drawLine([-1; -1; 0]);
robot.drawLine([-3; 0; 0]);
robot.drawLine([0; 0; 0]);
robot.drawLine([0; 3.5; 0]);
robot.moveManipulator([0; 3; 0]);
robot.drawLine([2; 2; 0]);
robot.drawLine([0; 2; 0]);

robot.moveManipulator([0; 0; 0]);
robot.drawLine([3; 0; 0]);
robot.moveManipulatorToRest();
