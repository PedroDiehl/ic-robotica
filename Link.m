%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Classe para definir o robo.
%}

classdef Link < handle
   properties
      size
      endPos
      zTheta
      yTheta
      restPos
   end
   
   % CONSTRUTOR CONSTRUTOR CONSTRUTOR
   methods        
    function obj = Link(a)
        obj.size = a;
   
        obj.endPos = [a; 
                      0; 
                      1];
                  
        obj.restPos = [a;
                       0;
                       1];
                   
        obj.zTheta = 0;
        
        %TODO TODO TODO TODO (SUBIR DESCER)
        obj.yTheta = asind(0.5 / a);
    end
   end
   % CONSTRUTOR CONSTRUTOR CONSTRUTOR
   
   % MÉTODOS MÉTODOS MÉTODOS MÉTODOS
   methods
       function endPos = updateEndPos(obj, rMz, zTheta)
           obj.zTheta = zTheta;
           obj.endPos = rMz * obj.restPos;
           endPos = obj.endPos;
       end
   end
   % MÉTODOS MÉTODOS MÉTODOS MÉTODOS
end
