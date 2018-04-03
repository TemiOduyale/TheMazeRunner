clear;
x = 5;
y = 9;
global MNorth = zeros(x,y);
global MSouth = zeros(x,y);
global MEast = zeros(x,y);
global MWest = zeros(x,y);
        
for i = 1:9
     MNorth(5,i) = 1;
end

for b = 2:8
    MSouth(1,b)= 1;
end

for j = 1:5
    MWest(j,1)=1;
    MEast(j,9)=1;
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

for k = 2:5
    for l = 1:9
        MSouth(k,l)= MNorth(k-1,l);
    end
end

for m = 2:9
    for n = 1:5
        MWest(n,m)= MEast(n,m-1);
    end
end









      
        

    