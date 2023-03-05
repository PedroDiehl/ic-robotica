%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para resolver as questoes referentes ao estudo de robotica.
%}

format short
clc, close all, clear all

size([1; 3]);
size([1; 2]);
isequal(size([1; 3]), size([1; 2]))
[theta1, theta2] = invKin([1; 3], 1, 2, 'deg', 'algebraic')
