%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para desenhar um circulo utilizando o manipulador.
%}

format short
clc, close all, clear all

a1 = 2;
a2 = 2;

robot = RobotRR(a1, a2);

% Defasagem
h = 1; % em x
k = -1; % em y

% Raio do circulo
r = 1;


for phi = 0:0.1:(2 * pi)
    % Equacao parametrica para o circulo
    p_circulo = [(h + r * cos(phi));
                 (k + r * sin(phi))];
 
    %p_circulo = [1; 2];
    [theta1, theta2] = invKin(p_circulo,...
                        robot.links(1).size,...
                        robot.links(2).size,...
                        'deg',...
                        'algebraic');

    %position_1 = rM('z', theta1, 'deg') * rest_a1;
    %position_2 = rM('z', (theta1 + theta2), 'deg') * rest_a2;
    robot.links(1).updateEndPos(rM('z', theta1, 'deg'), theta1);
    robot.links(2).updateEndPos(rM('z', (theta1 + theta2), 'deg'), theta2);
    
    figure(1)
    plotArm(robot.links(1).endPos, robot.links(2).endPos);
    
    figure(2)
    plot((robot.links(1).endPos(1) + robot.links(2).endPos(1)),...
         (robot.links(1).endPos(2) + robot.links(2).endPos(2)),...
         '.');
    grid on
    hold on
    axis([-3 3 -3 3]);
  
    pause(5e-12);
end
