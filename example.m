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

%x_ee = -2;
%y_ee = 2;
%endEffectorPos = [x_ee;
%                  y_ee;
%                  0];


% Move o manipulador para a posicao desejada
%{
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
%}

% Desenha um circulo
%robot.drawCircle(1, -1, 1, -1);
robot.drawHalfCircle(1, -1, 1, -1, 1);
% Desenha uma rosacea
%robot.drawRose(1, 2, 1);

robot.moveManipulatorToRest();

%robot.drawRose(1, -1, 1);
