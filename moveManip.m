%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para desenhar o deslocamento do 
manipulador até o ponto de inicio do desenho

@param rest_a1 - Vetor indicando as posicoes em repouso do elo 1
Vetor no formato [posicao_x; posicao_y] 

@param rest_a2 - Vetor indicando as posicoes em repouso do elo 2
Vetor no formato [posicao_x; posicao_y 

@param p_final - Posicao final desejada para o efetuador final sem realizar
desenho
Vetor no formato [posicao_x; posicao_y] para o efetuador final
%}

function moveManip(rest_a1, rest_a2, pos_a1, pos_a2, p_final)

    % Vetor de distancia do deslocamento
    dist = p_final - (pos_a1(1:2,:) + pos_a2(1:2,:));
    
    % Magnitude da hipotenusa para avancar sobre
    hip_mag = sqrt(dist(1)^2 + dist(2)^2);

    for p = 0:0.1:hip_mag
        % Decompoe a hipotenusa em x e y atraves do uso de cossenos e senos
        % Posicao atual + ou -, cosseno ou seno da posicao atual na hipotenusa
        p_desloc = (pos_a1(1:2, :) + pos_a2(1:2,:)) + p * (dist / hip_mag);
       
        [theta1, theta2] = invKin(p_desloc, rest_a1(1), rest_a2(1), 'deg', 'algebraic');
        
        position_1 = rM('z', theta1, 'deg') * rest_a1;
        position_2 = rM('z', (theta1 + theta2), 'deg') * rest_a2; 

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
end