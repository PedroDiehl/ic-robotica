%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Exemplo de uso com desenho de um carro
%}

format short
clc, close all, clear all

% Parametros dos elos do robo
a1 = 3; % Comprimento do primeiro elo
a2 = 3; % Comprimento do segundo elo

% Cria uma instancia do robo
robot = RobotRR(a1, a2);

robot.moveManipulator([5; 0; 0]);
robot.drawLine([5; -1; 0]);
robot.drawLine([4; -2; 0]);
robot.drawLine([3; -2; 0]);
robot.drawHorizontalHalfCircle(2, -2, 1, 1, 1); 
robot.drawLine([-1; -2; 0]);
robot.drawHorizontalHalfCircle(-2, -2, 1, 1, 1); 
robot.drawLine([-4; -2; 0]);
robot.drawLine([-5; -1; 0]);
robot.drawLine([-5; 0; 0]);
robot.drawLine([-4; 0; 0]);
robot.drawLine([-3; 2; 0]);
robot.drawLine([3; 2; 0]);
robot.drawLine([4; 0; 0]);
robot.drawLine([5; 0; 0]);
robot.drawCircle(2, -2, 0.75, 1); 
robot.drawCircle(-2, -2, 0.75, 1); 

robot.moveManipulatorToRest();
