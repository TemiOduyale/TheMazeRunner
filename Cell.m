classdef Cell
    properties
       northW; southW; eastW; westW;
    end
    methods
        function obj = ObjectArray(M)
            if nargin ~= 0
                obj(5,9) = Cell;
                
              for i = 0:4
                  for j = 0:8
                    obj(i,j).northW = 0;
                    obj(i,j).southW = 0;
                    obj(i,j).eastW = 0;
                    obj(i,j).westW = 0;
                  end
              end
            end
        end
    end
end

                
                    
         
                    