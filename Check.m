%frank Du 

clc;
clear all;
robot = legoev3('usb')
tuner = motor(robot,'D')
sonic = sonicSensor(robot,2);
resetRotation(tuner);
value1=70;%44
value2=-80;%-30
newvalue=0;


i=0;
left=0;
right=0;
while i<4
    
    while newvalue<value1
        start(tuner,30);
        newvalue=readRotation(tuner)
        
    end
        stop(tuner);
        pause(0.5);
        leftwall=readDistance(sonic);
     
    
    while newvalue>value2
        start(tuner,-20);
        newvalue=readRotation(tuner);
    end
        stop(tuner);
        pause(0.5);
        rightwall=readDistance(sonic);
     
        i=i+1;
        left=left+leftwall;
        right=right+rightwall;
end


stop(tuner);
pause(0.5);
while newvalue<0
    start(tuner,20);
    newvalue=readRotation(tuner);
end
stop(tuner);

left = left/i;
right = right/i;