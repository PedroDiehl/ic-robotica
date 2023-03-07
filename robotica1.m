%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para resolver as questoes referentes ao estudo de robotica.
%}

format short
clc, close all, clear all

% Parametros dos elos do robo e do destino para o efetuador final
a1 = 1;
a2 = 2;

x_ee = 2;
y_ee = 2;

% Representacao incial (ponto) do elo 1 em repouso partindo da origem
point_a1 = [a1;
            0;
            0];
        
% Representacao incial (ponto) do elo 2 em repouso partindo da origem
point_a2 = [a2;
            0;
            0];

% Representacao do destino desejado para o efetuador final
p_ee = [x_ee;
        y_ee];

% Calcula os angulos para as juntas com base na posicao desejada para o ee
[theta1, theta2] = invKin(p_ee, a1, a2, 'deg', 'algebraic')

% Aplica a matriz de rotacao com os resultados obtidos nos pontos
posicao_1 = rM('z', theta1, 'deg') * point_a1
posicao_2 = rM('z', (theta1 + theta2), 'deg') * point_a2

% Apresenta a combinacao resultante dos elos + juntas
plotArm(posicao_1, posicao_2);
