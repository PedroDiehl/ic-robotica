%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para computar a cinematica inversa.

@param eePosition - Posicao desejada para o efetuador final
Vetor no formato [posicao_x; posicao_y] para o efetuador final

@param a1 - Comprimento do elo 1
Numero indicando o tamanho do elo 1

@param a2 - Comprimento do elo 2
Numero indicando o tamanho do elo 2

@param angleUM - Unidade de medida para o angulo
String indicando a unidade de medida na se deseja obter o angulo das juntas
{deg, rad}

@param technique - Tecnica utilizada para calculo
String indicando a tecnica que deve ser empregada para realizar o calculo
{alebraic, geometric}
%}

function [theta1, theta2] = invKin(eePosition, a1, a2, angleUM, technique)

    % Decompoe o vetor em x e y
    if ~isequal(size(eePosition), size([1; 2]))
        error('The desired end effector position dimensions informed are not valid')
    end
    
    px = eePosition(1, 1);
    py = eePosition(2, 1);
 
    % Confere se o ponto esta na area de trabalho do robo
    if (sqrt(px^2 + py^2) > (a1 + a2)) || (sqrt(px^2 + py^2) < (a1 - a2))
        error('The given end effector position is outside of the arm reachable space');
    end
  
    switch technique
        case 'algebraic'
            % Calcula os valores trigonométricos para theta2
            c2 = (px^2 + py^2 - a1^2 - a2^2) / (2 * a1 * a2);
            
            % Confere se o ponto esta na area de trabalho do robo
            if (c2 > 1) || (c2 < -1)
                error('The given end effector position is outside of the arm reachable space');
            end
          
            s2 = sqrt(1 - c2^2);
            
            ang_theta2 = atan2(s2, c2);

            % Cacula os valores trigonométricos para theta1
            c1 = ((a1 + a2 * c2) * px + a2 * s2 * py) / (px^2 + py^2);
            s1 = ((a1 + a2 * c2) * py - a2 * s2 * px) / (px^2 + py^2);

            ang_theta1 = atan2(s1, c1); 
            
        case 'geometric'
            alpha = atan2(py, px);
            beta = acos((px^2 + py^2 + a1^2 - a2^2) / (2 * a1 * sqrt(px^2 + py^2)));
            
            ang_theta1 = alpha + beta;
            
            c2 = (px^2 + py^2 - a1^2 - a2^2) / (2 * a1 * a2);
            if ang_theta1 > 0
                ang_theta2 = -acos(c2);
            else
                ang_theta2 = acos(c2);
            end
    
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
