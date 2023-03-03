%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Utilizado para computar as matrizes de rotacao.

@param axis - Eixo em que ocorrera a rotação
@param angle - angulo da rotação
@param angleUM - Unidade de medida do angulo informado
%}

function rotationMatrix = rM(axis, angle, angleUM)
    switch angleUM
        case 'deg'
            switch axis
                case 'x'
                    rotationMatrix = [1 0 0
                                      0 cosd(angle) -sind(angle) 
                                      0 sind(angle) cosd(angle)
                                      ];
                case 'y'
                    rotationMatrix = [cosd(angle) 0 sind(angle)
                                      0 1 0
                                      -sind(angle) 0 cosd(angle)
                                      ];
                case 'z'
                    rotationMatrix = [cosd(angle) -sind(angle) 0
                                      sind(angle) cosd(angle) 0
                                      0 0 1
                                      ];
                otherwise
                    error('Not valid axis informed.');
            end
        case 'rad'
            switch axis
                case 'x'
                    rotationMatrix = [1 0 0
                                      0 cos(angle) -sin(angle) 
                                      0 sin(angle) cos(angle)
                                      ];
                case 'y'
                    rotationMatrix = [cos(angle) 0 sin(angle)
                                      0 1 0
                                      -sin(angle) 0 cos(angle)
                                      ];
                case 'z'
                    rotationMatrix = [cos(angle) -sin(angle) 0
                                      sin(angle) cos(angle) 0
                                      0 0 1
                                      ];
                otherwise
                    error('Not valid axis informed.');
            end
        otherwise
            error('Not valid angle unit informed.');
    end
end
