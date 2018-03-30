%Algorithm to erase redundant moves made by wall follower algorithm
%Author Judy Afana, Temidire Oduyale & Mechatronics Team
%Design Project 2 
%Mechatronics

%call past script
Maini2;

%initialize right and left values of the direction array a
%boolean moved keeps track if the robot moved or not based on the
%directions -1 = no move
left = 1;
right = 2;
moved = false;

%shanges redundant directions to -1 = null (no move)
while right<50
    if abs(a(1,right)-a(1,left))== 2 && a(1,right)~=-1
        numDir = numDir - 2;
        a(1,left)=-1;
        a(1,right)=-1;
        if left == 0 || ~moved  
            left = right + 1;
            right = right + 2;
        else
            left = left - 1;
            while a(1,left)==-1
                left = left - 1;
            end
            right = right + 1;
        end
        
        if moved && left==-1
            left = right;
            right = right + 1;
        end
    else
        left = right;
        right = right + 1;
        moved = true;
    end
        
       
end

%end of program
%array a changes to optimal path to take 
%values placed in array are directions
%0 = north; 1= east; 2 = south; 3 = west;
                
        