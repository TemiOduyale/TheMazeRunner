clear;
%Array map creation
%Author Judy Afana, Temidire Oduyale & Mechatronics Team
%Design Project 2 
%Mechatronics

%create direction matrices
x = 5;
y = 9;
global MNorth; global MSouth; global MEast; global MWest;

%initialize matrices to zero
MNorth = zeros(x,y);
MSouth = zeros(x,y);
MEast = zeros(x,y);
MWest = zeros(x,y);

%create the map
%1 = walls ; 0 = no wall
%create north and east walls, and mirror to get south and west walls
for i = 1:9
     MNorth(5,i) = 1;
end

for i = 2:8
    MSouth(1,i)= 1;
end

for i = 1:5
    MWest(i,1)=1;
    MEast(i,9)=1;
end

MNorth(4,3)=1;
MNorth(4,5:8)=1;
MNorth(3,4)=1;
MNorth(1,4)=1;

MEast(1,1)=1;
MEast(1,4)=1;
MEast(1,8:9)=1;
MEast(2,1:9)=1;
MEast(3,1:3)=1;
MEast(3,5:7)=1;
MEast(3,9)=1;
MEast(4,2)=1;
MEast(4,6)=1;
MEast(4,8:9)=1;
MEast(5,1)=1;
MEast(5,7)=1;
MEast(5,9)=1;

for i = 2:5
    for j = 1:9
        MSouth(i,j)= MNorth(i-1,j);
    end
end

for m = 2:9
    for n = 1:5
        MWest(n,m)= MEast(n,m-1);
    end
end



%end of map creation







      
        

    
