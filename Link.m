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

           obj.endPos = [obj.size; 
                            0; 
                            0];
                     
           obj.restPos = [obj.size; 
                            0; 
                            0];

           obj.zTheta = 0;
    end
   end
   % CONSTRUTOR CONSTRUTOR CONSTRUTOR
   
   % METODOS METODOS METODOS METODOS
   methods
       function endPos = updateEndPos(obj, rMz, zTheta)
           obj.zTheta = zTheta;
           obj.endPos = rMz * obj.restPos;
           endPos = obj.endPos;
       end
   end
   % METODOS METODOS METODOS METODOS
end
