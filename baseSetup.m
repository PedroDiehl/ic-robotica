%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para fazer a configuracao base para uso do robo.
%}


function [robot, endEffectorPos] = baseSetup(a1, a2, x_ee, y_ee)
    robot = RobotRR(a1, a2);
    endEffectorPos = [x_ee;
                      y_ee;
                      0];
end
