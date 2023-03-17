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
   
   % MÉTODOS MÉTODOS MÉTODOS MÉTODOS
   methods
       % CINEMÁTICA INVERSA CINEMÁTICA INVERSA CINEMÁTICA INVERSA CINEMÁTICA INVERSA
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
                   % Calcula os valores trigonométricos para theta2
                   c2 = (px^2 + py^2 - obj.links(1).size^2 - obj.links(2).size^2) / (2 * obj.links(1).size * obj.links(2).size);

                   % Confere se o ponto esta na area de trabalho do robo
                   if (c2 > 1) || (c2 < -1)
                       error('The given end effector position is outside of the arm reachable space');
                   end

                   s2 = sqrt(1 - c2^2);

                   ang_theta2 = atan2(s2, c2);

                   % Cacula os valores trigonométricos para theta1
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
       % CINEMÁTICA INVERSA CINEMÁTICA INVERSA CINEMÁTICA INVERSA CINEMÁTICA INVERSA
       
       
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

               [theta1, theta2] = obj.inverseKinematics(pDesloc,...
                                                        'deg',...
                                                        'algebraic');

               obj.links(1).updateEndPos(rM('z', theta1, 'deg'), theta1);
               obj.links(2).updateEndPos(rM('z', (theta1 + theta2), 'deg'), theta2);

               obj.plotArm();
               obj.plotAllMovement();
               
               subplot(2,4,3)
               %figure(3)
               plot((obj.links(1).endPos(1) + obj.links(2).endPos(1)),...
                    (obj.links(1).endPos(2) + obj.links(2).endPos(2)),...
                    '.', 'linewidth', 0.0001);
               xlabel('eixo x')
               ylabel('eixo y')
               grid on
               hold on
               title('Movimento de deslocamento')
               axis([-6 6 -6 6])

               pause(5e-12);
           end
       end
       % MOVER MANIPULADOR MOVER MANIPULADOR MOVER MANIPULADOR MOVER MANIPULADOR       
       
       
       % MOVER MANIPULADOR MOVER MANIPULADOR MOVER MANIPULADOR MOVER MANIPULADOR
       function moveManipulatorToRest(obj)
           obj.moveManipulator(obj.links(1).restPos + obj.links(2).restPos);
       end
       % MOVER MANIPULADOR MOVER MANIPULADOR MOVER MANIPULADOR MOVER MANIPULADOR
       
       
       % GRAFICAR BRACO GRAFICAR BRACO GRAFICAR BRACO GRAFICAR BRACO GRAFICAR BRACO
       function plotArm(obj)
           subplot(2,4,1)
           %figure(1)
           plot([0 obj.links(1).endPos(1)], [0 obj.links(1).endPos(2)], 'r',...
                [obj.links(1).endPos(1) (obj.links(1).endPos(1) + obj.links(2).endPos(1))], [obj.links(1).endPos(2) (obj.links(1).endPos(2) + obj.links(2).endPos(2))], 'b',...
               'linewidth', 5);
           xlabel('eixo x')
           ylabel('eixo y')
           grid on
           title('Movimento dos elos (x, y)')
           axis([-6 6 -6 6]);
           pause(5e-12)
       end
       % GRAFICAR BRACO GRAFICAR BRACO GRAFICAR BRACO GRAFICAR BRACO GRAFICAR BRACO
       

       % GRAFICAR DESENHO GRAFICAR DESENHO GRAFICAR DESENHO GRAFICAR DESENHO
       function plotDraw(obj)
           subplot(2,4,4)
           %figure(2)
           plot((obj.links(1).endPos(1) + obj.links(2).endPos(1)),...
                (obj.links(1).endPos(2) + obj.links(2).endPos(2)),...
                '.');
           xlabel('eixo x')
           ylabel('eixo y')
           grid on
           hold on
           title('Movimento de desenho')
           axis([-6 6 -6 6]);
           pause(5e-12)
       end
       % GRAFICAR DESENHO GRAFICAR DESENHO GRAFICAR DESENHO GRAFICAR DESENHO
       
       
       % GRAFICAR DESENHO LIVRE GRAFICAR DESENHO LIVRE GRAFICAR DESENHO LIVRE
       function plotFreeDraw(obj, pDesired)   
           startPos = obj.links(1).endPos + obj.links(2).endPos;
           
           % Vetor de distancia do deslocamento
           dist = pDesired - startPos;
           
           % Magnitude da hipotenusa para avancar sobre
           hipMag = sqrt(dist(1)^2 + dist(2)^2 + dist(3)^2);

           for p = 0:0.1:hipMag
               % Decompoe a hipotenusa em x e y atraves do uso de cossenos e senos
               % Posicao atual + ou -, cosseno ou seno da posicao atual na hipotenusa
               pDesloc = startPos + p * (dist / hipMag);

               [theta1, theta2] = obj.inverseKinematics(pDesloc,...
                                                        'deg',...
                                                        'algebraic');

               obj.links(1).updateEndPos(rM('z', theta1, 'deg'), theta1);
               obj.links(2).updateEndPos(rM('z', (theta1 + theta2), 'deg'), theta2);

               obj.plotArm();
               obj.plotAllMovement();
               obj.plotDraw();
               
               %subplot(2,4,3)
               %figure(3)
               %plot((obj.links(1).endPos(1) + obj.links(2).endPos(1)),...
               %     (obj.links(1).endPos(2) + obj.links(2).endPos(2)),...
               %     '.', 'linewidth', 0.0001);
               %xlabel('eixo x')
               %ylabel('eixo y')
               %grid on
               %hold on
               %title('Movimento de deslocamento')
               %axis([-6 6 -6 6])
               
               pause(5e-12);
           end
       end
       % GRAFICAR DESENHO LIVRE GRAFICAR DESENHO LIVRE GRAFICAR DESENHO LIVRE
       
       
       % GRAFICAR TODO MOVIMENTO GRAFICAR TODO MOVIMENTO GRAFICAR TODO MOVIMENTO
       function plotAllMovement(obj)
           subplot(2,4,2)
           %figure(4)
           plot((obj.links(1).endPos(1) + obj.links(2).endPos(1)),...
                (obj.links(1).endPos(2) + obj.links(2).endPos(2)),...
                '.', 'linewidth', 0.0001);
           xlabel('eixo x')
           ylabel('eixo y')
           grid on
           hold on
           title('Movimento total')
           axis([-6 6 -6 6]);
           pause(5e-12)
       end
       % GRAFICAR TODO MOVIMENTO GRAFICAR TODO MOVIMENTO GRAFICAR TODO MOVIMENTO
       
  
       % DESENHAR CIRCULO DESENHAR CIRCULO DESENHAR CIRCULO DESENHAR CIRCULO
       function drawCircle(obj, xOffset, yOffset, radius)
           % Equacao parametrica para o circulo
           p_circulo = [(xOffset + radius * cos(0));
                        (yOffset + radius * sin(0));
                                    0];
           
           obj.moveManipulator(p_circulo);
           obj.plotAllMovement();
     
           for phi = 0:0.1:(2 * pi)
               % Equacao parametrica para o circulo
               p_circulo = [(xOffset + radius * cos(phi));
                            (yOffset + radius * sin(phi));
                                        0];
                                            
               [theta1, theta2] = obj.inverseKinematics(p_circulo,...
                                                        'deg',...
                                                        'algebraic');

               obj.links(1).updateEndPos(rM('z', theta1, 'deg'), theta1);
               obj.links(2).updateEndPos(rM('z', (theta1 + theta2), 'deg'), theta2);
               
               obj.plotArm();
               obj.plotDraw();
               obj.plotAllMovement();
           end
       end
       % DESENHAR CIRCULO DESENHAR CIRCULO DESENHAR CIRCULO DESENHAR CIRCULO
       
       
       % DESENHAR ROSACEA DESENHAR ROSACEA DESENHAR ROSACEA DESENHAR ROSACEA
       function drawRose(obj, xOffset, yOffset, petalPairs)
           r_rosa = cos(2 * petalPairs * 0);
           
           % Equacao parametrica para a rosacea
           p_rosa = [xOffset + (r_rosa * cos(0));
                     yOffset + (r_rosa * sin(0));
                                0];
           
           obj.moveManipulator(p_rosa);
           obj.plotAllMovement();
           
           for phi = 0:0.01:(2 * pi)
               r_rosa = cos(2 * petalPairs * phi);
               
               p_rosa = [xOffset + (r_rosa * cos(phi));
                         yOffset + (r_rosa * sin(phi));
                                    0];
                                            
               [theta1, theta2] = obj.inverseKinematics(p_rosa,...
                                                        'deg',...
                                                        'algebraic');

               obj.links(1).updateEndPos(rM('z', theta1, 'deg'), theta1);
               obj.links(2).updateEndPos(rM('z', (theta1 + theta2), 'deg'), theta2);
               
               obj.plotArm();
               obj.plotDraw();
               obj.plotAllMovement();
           end
       end
       % DESENHAR ROSACEA DESENHAR ROSACEA DESENHAR ROSACEA DESENHAR ROSACEA
   end
   % MÉTODOS MÉTODOS MÉTODOS MÉTODOS
end
