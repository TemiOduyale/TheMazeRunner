clear
global startPosRow;
global startPosCol;
global endPosCol;
global endPosRow;
global currentPosRow;
global currentPosCol;
global robotDirection;
global a;
global numDir;

a = zeros(1,100);


startPosRow = 1;
startPosCol = 1;
endPosRow = 1;
endPosCol = 9;

currentPosRow = startPosRow;
currentPosCol = startPosCol;

%Array; 
% getDirection(startPosRow,startPosCol,endPosRow,endPosCol)
% disp(a)
% function getDirection(startPosRow,startPosCol,endPosRow,endPosCol)
%      global robotDirection;
%      global a;
%      global numDir;
%      global MNorth; global MSouth; global MEast; global MWest;
    
     for i = 1:100
        a(1,i) = -1;
    end

    robotDirection = 0;
    counter = 1;
    numDir = 0;

    while startPosRow ~= endPosRow || startPosCol ~= endPosCol
        numDir = numDir + 1;
        
        if robotDirection == 0 
            if MWest(startPosRow,startPosCol) == 0
                a(1,counter) = 3;
                startPosCol = startPosCol - 1;
                robotDirection = 3;
            elseif MNorth(startPosRow, startPosCol) == 0
                    a(1,counter)=0;
                    startPosRow = startPosRow + 1;
                    robotDirection=0;
            elseif MEast(startPosRow, startPosCol) == 0
                    a(1,counter)=1;
                    startPosCol = startPosCol + 1;
                    robotDirection=1; 
            elseif MSouth(startPosRow, startPosCol) == 0
                    a(1,counter)=2;
                    startPosRow = startPosRow - 1;
                    robotDirection=2;
            end
            counter = counter + 1;

        elseif robotDirection == 1 
            if MNorth(startPosRow, startPosCol) == 0
                    a(1,counter)=0;
                    startPosRow = startPosRow + 1;
                    robotDirection=0;
            elseif MEast(startPosRow, startPosCol) == 0
                    a(1,counter)=1;
                    startPosCol = startPosCol + 1;
                    robotDirection=1; 
            elseif MSouth(startPosRow, startPosCol) == 0
                    a(1,counter)=2;
                    startPosRow = startPosRow - 1;
                    robotDirection=2;
            elseif MWest(startPosRow,startPosCol) == 0
                a(1,counter) = 3;
                startPosCol = startPosCol - 1;
                robotDirection = 3;
            end
            counter = counter + 1;

         elseif robotDirection == 2 
            if MEast(startPosRow, startPosCol) == 0
                    a(1,counter)=1;
                    startPosCol = startPosCol + 1;
                    robotDirection=1; 
            elseif MSouth(startPosRow, startPosCol) == 0
                    a(1,counter)=2;
                    startPosRow = startPosRow - 1;
                    robotDirection=2;
            elseif MWest(startPosRow,startPosCol) == 0
                a(1,counter) = 3;
                startPosCol = startPosCol - 1;
                robotDirection = 3;
            elseif MNorth(startPosRow, startPosCol) == 0
                    a(1,counter)=0;
                    startPosRow = startPosRow + 1;
                    robotDirection=0;
            end
            counter = counter + 1;

          elseif robotDirection == 3 

            if MSouth(startPosRow, startPosCol) == 0
                    a(1,counter)=2;
                    startPosRow = startPosRow - 1;
                    robotDirection=2;
            elseif MWest(startPosRow,startPosCol) == 0
                a(1,counter) = 3;
                startPosCol = startPosCol - 1;
                robotDirection = 3;
            elseif MNorth(startPosRow, startPosCol) == 0
                    a(1,counter)=0;
                    startPosRow = startPosRow + 1;
                    robotDirection=0;
            elseif MEast(startPosRow, startPosCol) == 0
                    a(1,counter)=1;
                    startPosCol = startPosCol + 1;
                    robotDirection=1;
            end
            counter = counter +1;
        end
    end
        

