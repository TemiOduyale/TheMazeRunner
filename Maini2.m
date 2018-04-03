%Wall follower algorithm based on map creation
%Author Judy Afana, Temidire Oduyale & Mechatronics Team
%Design Project 2 
%Mechatronics

%Call past scripts
Array;
MainAttempt1;

%intialize global array a to zeros
a = zeros(1,50);

%initilize start and end positions
startPosRow = 1;
startPosCol = 1;
endPosRow = 1;
endPosCol = 9;

%obtain current position
currentPosRow = startPosRow;
currentPosCol = startPosCol;

    %initialize direction array a to all -1 = no mouvement
    %Direction : 0 = north; 1 = east; 2 = south; 3 = west
     for i = 1:50
        a(1,i) = -1;
     end

    %initialize robot direction to north (0)
    %initialize a counter to keep track of direction
    %param numDir = number of directions taken to reach the final position
    robotDirection = 0;
    counter = 1;
    numDir = 0;

    %travel to the final positon by following the walls
    %keep track of all directions taken 
    %place into array a 
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
        
%end of code
%array a should be an array of all the directions taken to get to the final
%position by following the wall
