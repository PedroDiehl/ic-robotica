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
      restPos
   end
   
   % CONSTRUTOR CONSTRUTOR CONSTRUTOR
   methods        
    function obj = Link(a)
        obj.size = a;
   
        obj.endPos = [a; 
                      0; 
                      0];
                  
        obj.restPos = [a;
                       0;
                       0];
                   
        obj.zTheta = 0;
    end
   end
   % CONSTRUTOR CONSTRUTOR CONSTRUTOR
   
   % MÉTODOS MÉTODOS MÉTODOS MÉTODOS
   methods
       function endPos = updateEndPos(obj, rM, theta)
           obj.zTheta = theta;
           obj.endPos = rM * obj.restPos;
           endPos = obj.endPos;
       end
   end
   % MÉTODOS MÉTODOS MÉTODOS MÉTODOS
end
