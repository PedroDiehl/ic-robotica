%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Classe para definir o robo.
%}

classdef RobotRR
   properties
      links
   end
   
   % CONSTRUTOR CONSTRUTOR CONSTRUTOR
   methods        
    function obj = RobotRR(a1, a2)
        obj.links = [Link(a1) Link(a2)];
    end
   end
   % CONSTRUTOR CONSTRUTOR CONSTRUTOR
   
   % M�TODOS M�TODOS M�TODOS M�TODOS
   methods
       % CINEM�TICA INVERSA CINEM�TICA INVERSA CINEM�TICA INVERSA CINEM�TICA INVERSA
       function [theta1, theta2] = inverseKinematics(obj, eePosition, angleUM, technique)
           % Decompoe o vetor em x e y 
           px = eePosition(1, 1);
           py = eePosition(2, 1);

           % Confere se o ponto esta na area de trabalho do robo
           if (sqrt(px^2 + py^2) > (obj.links(1).size + obj.links(2).size)) ||...
               (sqrt(px^2 + py^2) < (obj.links(1).size - obj.links(2).size))
               error('The given end effector position is outside of the arm reachable space');
           end

           switch technique
               case 'algebraic'
                   % Calcula os valores trigonom�tricos para theta2
                   c2 = (px^2 + py^2 - obj.links(1).size^2 - obj.links(2).size^2) / (2 * obj.links(1).size * obj.links(2).size);

                   % Confere se o ponto esta na area de trabalho do robo
                   if (c2 > 1) || (c2 < -1)
                       error('The given end effector position is outside of the arm reachable space');
                   end

                   s2 = sqrt(1 - c2^2);

                   ang_theta2 = atan2(s2, c2);

                   % Cacula os valores trigonom�tricos para theta1
                   c1 = ((obj.links(1).size + obj.links(2).size * c2) * px + obj.links(2).size * s2 * py) / (px^2 + py^2);
                   s1 = ((obj.links(1).size + obj.links(2).size * c2) * py - obj.links(2).size * s2 * px) / (px^2 + py^2);

                   ang_theta1 = atan2(s1, c1); 

               case 'geometric'
                   disp('TODO');

               otherwise
                   error('Not valid technique informed');
           end

           switch angleUM
               case 'rad'
                   theta1 = ang_theta1;
                   %theta1 = round(ang_theta1, 2);

                   theta2 = ang_theta2;
                   %theta2 = round(ang_theta2, 2);

               case 'deg'
                   theta1 = rad2deg(ang_theta1);
                   %theta1 = round(rad2deg(ang_theta1), 2);

                   theta2 = rad2deg(ang_theta2);
                   %theta2 = round(rad2deg(ang_theta2), 2);

               otherwise
                   error('Not valid angle unit informed.');
           end
       end
       % CINEM�TICA INVERSA CINEM�TICA INVERSA CINEM�TICA INVERSA CINEM�TICA INVERSA
       
       
       % MOVER MANIPULADOR MOVER MANIPULADOR MOVER MANIPULADOR MOVER MANIPULADOR
       function moveManipulator(obj, pDesired)
           startPos = obj.links(1).endPos + obj.links(2).endPos;

           % Vetor de distancia do deslocamento
           dist = pDesired - startPos;

           % Magnitude da hipotenusa para avancar sobre
           hipMag = sqrt(dist(1)^2 + dist(2)^2 + dist(3)^2);

           for p = 0:0.1:hipMag
               % Decompoe a hipotenusa em x e y atraves do uso de cossenos e senos
               % Posicao atual + ou -, cosseno ou seno da posicao atual na hipotenusa
               pDesloc = startPos + p * (dist / hipMag);

               [theta1, theta2] = invKin(pDesloc,...
                                         obj.links(1).size,...
                                         obj.links(2).size,...
                                         'deg',...
                                         'algebraic');

               obj.links(1).updateEndPos(rM('z', theta1, 'deg'), theta1);
               obj.links(2).updateEndPos(rM('z', (theta1 + theta2), 'deg'), theta2);

               grid on
               figure(1)
               obj.plotArm(obj.links(1).endPos, obj.links(2).endPos);
               axis([-3 3 -3 3]);
               
               figure(3)
               plot((obj.links(1).endPos(1) + obj.links(2).endPos(1)),...
                    (obj.links(1).endPos(2) + obj.links(2).endPos(2)),...
                    'o', 'linewidth', 0.5);
               hold on
               axis([-3 3 -3 3]);

               %pause(1)
               pause(5e-12);
           end
       end
       % MOVER MANIPULADOR MOVER MANIPULADOR MOVER MANIPULADOR MOVER MANIPULADOR
       
       function plotArm(obj)
           figure(1)
           plot([0 obj.links(1).endPos(1)], [0 obj.links(1).endPos(2)], 'r',...
               [obj.links(1).endPos(1) (obj.links(1).endPos(1) + obj.links(2).endPos(1))], [obj.links(1).endPos(2) (obj.links(1).endPos(2) + obj.links(2).endPos(2))], 'b',...
               'linewidth', 5);
           grid on
           axis([-3 3 -3 3]);
       end
   end
   % M�TODOS M�TODOS M�TODOS M�TODOS
end
