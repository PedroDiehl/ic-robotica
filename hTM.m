%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para computar as matrizes de transformacao homogenea.

@param rotationMatrix - Matriz de rotacao
@param displacement - Deslocamento
%}

function htMatrix = hTM(rotationMatrix, displacement)
    [linesCountR, columnsCountR] = size(rotationMatrix);
    [linesCountP, columnsCountP] = size(displacement);
    
    if isequal(linesCountR, columnsCountP)
        error('Dimensions are not equal');
    end

    zeroT = zeros(1, columnsCountR);
    htMatrix = [rotationMatrix displacement
                zeroT            1];
end
