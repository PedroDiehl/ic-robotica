%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para computar a cinemática inversa.

@param eePosition - Posicao desejada para o efetuador final (vetor)
@param a1 - Comprimento do elo 1
@param a2 - Comprimento do elo 2
@param angleUM - Unidade de medida para o angulo
@param technique - Tecnica utilizada para calculo
%}

function [theta1, theta2] = invCin(eePosition, a1, a2, angleUM, technique)
    % Decompoe o vetor em x e y
    px = eePosition(1);
    py = eePosition(2);
 
    switch technique
        case 'algebraic'
            % Confere se o ponto esta na area de trabalho do robo
            if (px^2 + py^2) > (a1 + a2)
                error('The given end effector position is outside the arm reachable space');
            end
            
            % Calcula os valores trigonométricos para theta2
            c2 = (px^2 + py^2 - a1^2 - a2^2) / (2 * a1 * a2);
            s2 = sqrt(1 - c2^2);

            ang_theta2 = atan2(s2, c2);

            % Cacula os valores trigonométricos para theta1
            c1 = ((a1 + a2 * c2) * px - a2 * s2 * py) / (px^2 + py^2);
            s1 = ((a1 + a2 * c2) * py - a2 * s2 * px) / (px^2 + py^2);

            ang_theta1 = atan2(c1, s1); 
            
        case 'geometric'
            % Confere se o ponto esta na area de trabalho do robo
            if sqrt(px^2 + py^2) > (a1 + a2)
                error('The given end effector position is outside the arm reachable space');
            end
    
        otherwise
            error('Not valid technique informed');
    end
    
    switch angleUM
        case 'rad'
            theta1 = ang_theta1;
            theta2 = ang_theta2;
            
        case 'deg'
            theta1 = rad2deg(ang_theta1);
            theta2 = rad2deg(ang_theta2);
            
        otherwise
            error('Not valid angle unit informed.');
    end
end
