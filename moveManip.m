%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para desenhar o deslocamento do 
manipulador até o ponto de inicio do desenho

@param a1 - Comprimento do elo 1
Numero indicando o tamanho do elo 1

@param a2 - Comprimento do elo 2
Numero indicando o tamanho do elo 2

@param a1_position - Vetor indicando as posicoes do elo 1
Vetor no formato [posicao_x; posicao_y] 

@param a2_position - Vetor indicando as posicoes do elo 2
Vetor no formato [posicao_x; posicao_y 

@param p_final - Posicao final desejada para o efetuador final sem realizar
desenho
Vetor no formato [posicao_x; posicao_y] para o efetuador final
%}

function moveManip(a1, a2, point_a1, point_a2, p_final, a)
    % Vetor de distancia do deslocamento
    dist = p_final - (point_a1(1:2,:) + point_a2(1:2,:));
    dist
    % Magnitude da hipotenusa para avancar sobre
    hip_mag = sqrt(dist(1)^2 + dist(2)^2);
    hip_mag
    for p = 0:0.1:hip_mag
        % Decompoe a hipotenusa em x e y atraves do uso de cossenos e senos
        % Posicao atual + ou -, cosseno ou seno da posicao atual na hipotenusa
        p_desloc = (point_a1(1:2, :) + point_a2(1:2,:)) + p * (dist / hip_mag);
        
        if isequal(a, 1)
            % MOVE O BRACO DE VOLTA PARA SUA POSICAO ORIGINAL (TODO)
            p_desloc = (point_a1(1:2, :) + point_a2(1:2,:)) + p / hip_mag * [dist(2); dist(1)]
        end
        [theta1, theta2] = invKin(p_desloc, a1, a2, 'deg', 'algebraic');

        position_1 = rM('z', theta1, 'deg') * point_a1;
        position_2 = rM('z', (theta1 + theta2), 'deg') * point_a2;

        figure(1)
        plotArm(position_1, position_2);

        figure(3)
        plot((position_1(1) + position_2(1)), (position_1(2) + position_2(2)), 'o', 'linewidth', 0.5);
        grid on
        hold on
        axis([-6 6 -6 6]);

        %pause(1)
        pause(5e-12);
    end
    
    position_1
    position_2
end