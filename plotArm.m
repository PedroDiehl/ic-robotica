%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para plotar o braco do manipulador.

@param a1_position - Vetor indicando as posicoes do elo 1
Vetor no formato [posicao_x; posicao_y; posicao_z] 

@param a2_position - Vetor indicando as posicoes do elo 2
Vetor no formato [posicao_x; posicao_y; posicao_z] 
%}

function plotArm(a1_position, a2_position)
    plot([0 a1_position(1)], [0 a1_position(2)], 'r',...
        [a1_position(1) (a1_position(1) + a2_position(1))], [a1_position(2) (a1_position(2) + a2_position(2))],...
        'b', 'linewidth', 3);
    grid on
    axis([-6 6 -6 6]);
end