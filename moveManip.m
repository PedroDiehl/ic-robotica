%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para desenhar o deslocamento do 
manipulador até o ponto de inicio do desenho

@param rest_a1 - Vetor indicando as posicoes em repouso do elo 1
Vetor no formato [posicao_x; posicao_y; posicao_z] 

@param rest_a2 - Vetor indicando as posicoes em repouso do elo 2
Vetor no formato [posicao_x; posicao_y; posicao_z]

@param p_final - Posicao final desejada para o efetuador final sem realizar
desenho
Vetor no formato [posicao_x; posicao_y; posicao_z] para o efetuador final
%}

function moveManip(robot, pDesired)
    startPos = robot.links(1).endPos + robot.links(2).endPos;
    
    % Vetor de distancia do deslocamento
    dist = pDesired - startPos;
    
    % Magnitude da hipotenusa para avancar sobre
    hipMag = sqrt(dist(1)^2 + dist(2)^2 + dist(3)^2);
    
    for p = 0:0.1:hipMag
        % Decompoe a hipotenusa em x e y atraves do uso de cossenos e senos
        % Posicao atual + ou -, cosseno ou seno da posicao atual na hipotenusa
        pDesloc = startPos + p * (dist / hipMag);

        [theta1, theta2] = invKin(pDesloc,...
                                  robot.links(1).size,...
                                  robot.links(2).size,...
                                  'deg',...
                                  'algebraic');
        
        robot.links(1).updateEndPos(rM('z', theta1, 'deg'), theta1);
        robot.links(2).updateEndPos(rM('z', (theta1 + theta2), 'deg'), theta2);

        figure(1)
        plotArm(robot.links(1).endPos, robot.links(2).endPos);

        figure(3)
        plot((robot.links(1).endPos(1) + robot.links(2).endPos(1)),...
             (robot.links(1).endPos(2) + robot.links(2).endPos(2)),...
             'o', 'linewidth', 0.5);
        grid on
        hold on
        axis([-6 6 -6 6]);

        %pause(1)
        pause(5e-12);
    end
end