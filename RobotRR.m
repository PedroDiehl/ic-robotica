%{
Universidade Federal de Pelotas

Professor: Alexandre Molter
Aluno: Pedro Henrique Diehl

Classe para definir o robo.
%}

classdef RobotRR
   properties
      links
   end
   
   % CONSTRUTOR CONSTRUTOR CONSTRUTOR
   methods        
    function obj = RobotRR(a1, a2)
        obj.links = [Link(a1) Link(a2)];
    end
   end
   % CONSTRUTOR CONSTRUTOR CONSTRUTOR
   
   % M�TODOS M�TODOS M�TODOS M�TODOS
   methods

   end
   % M�TODOS M�TODOS M�TODOS M�TODOS
end
