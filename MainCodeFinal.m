%Final Collaboration Code : Mechatronics Design Project 2
%Author Judy Afana, Temidire Oduyale, Frank Du & Mechatronics Team
%Design Project 2 
%Mechatronics

clear all
clc

%initilize global variables 
global robot;
global motorR;
global motorL;
global sonic;
global distance;

%connect robot sensors and motors to matlab
robot = legoev3('usb');
motorR = motor(robot,'A');
motorL = motor(robot,'B');
sonic = sonicSensor(robot,2);

%call all scripts 
Array;
MainAttempt1;
Maini2;
OptimalPath;

%initilize robot direction
%read sonic sensor
robotDirection = 0; 
distance = readDistance(sonic);


%control robot to follow directions based on the optimal path 
for i = 1:100
    if a(1,i) >= 0 
        numDir = numDir - 1;
        if a(1,i)== robotDirection
            moveForward();
            speedControl();
        elseif abs(a(1,i)-robotDirection)<3 && a(1,i)>robotDirection
            turnR();
            while robotDirection ~= a(1,i)
                turnR();
            end
            moveForward();
            speedControl();
        elseif robotDirection==3 && a(1,i)==0
            turnR();
            moveForward();
            speedControl();
        else
            turnL();
            while robotDirection ~= a(1,i)
                turnL();
            end
            moveForward();
            speedControl();
        end
    end
    
       
       
end        


%Functions used 

%move function gets ev3 robot to move
function move(encoderL,encoderR,speedL,speedR)
    global motorR;
    global motorL;
    reached=false; %controls the motor encoders individually 
    L = true;
    R = true; 
    resetRotation(motorL);
    resetRotation(motorR);

    motorL.Speed=speedL; 
    motorR.Speed =speedR;
    start(motorL); 
    start(motorR);

    while(~reached)
            if speedL > 0
                if readRotation(motorL) > encoderL
                    stop(motorL);
                    L=false;
                    if(~R)
                        reached=true;
                    end
                end
            else
               if readRotation(motorL) < encoderL
                   stop(motorL);
                   L=false;
                   if(~R)
                       reached=true;
                   end
               end
            end
            if speedR > 0
                if readRotation(motorR) > encoderR
                    stop(motorR);
                    R=false;
                    if(~L)
                        reached = true;
                    end
                end
            else
                if readRotation(motorR) < encoderR
                    stop(motorR);
                    R = false;
                    if(~L)
                        reached = true;
                    end
                end
            end
            pause(0.05);
    end
    
end


%move forward moves the bot forward and updates the current position of the
%robot
function moveForward()
    global currentPosRow;
    global currentPosCol;
    global robotDirection;
    
    move(-341.2,-355.5,-30,-32)
    
    switch(robotDirection)
        case 0 
            currentPosRow = currentPosRow+1;
                
        case 1
            currentPosCol = currentPosCol+1;
                
        case 2 
            currentPosRow = currentPosRow-1;
                
        case 3 
            currentPosCol = currentPosCol-1;
    end
    
end

%function turnL turns the bot left and updates the bot direction 
function turnL()
    global robotDirection
 
    move(37,-265,0,-75);
    robotDirection = robotDirection-1;
    
    if robotDirection == -1
        robotDirection=3;
    end    
end

%function turnR turns the bot right and updates the bot direction
function turnR()
    global robotDirection
 
    move(-285,26,-70,0);    
    robotDirection = robotDirection+1;
    
    if robotDirection == 4
            robotDirection = 0;          
    end    
end

%function speed control uses the ultrasonic to make sure bot is in the
%middle of the maze
function speedControl()
    global sonic;    
    global distance;
    global motorL;
  %  global turned;
    
    newDistance = readDistance(sonic);
    
%     if newDistance > 0.06
%         turnTurner();
%         
%         if turned
%             newDistance = readDistance(sonic) - 0.065;
%         else
%             newDistance = readDistance(sonic);
%         end
%         
%     end
    
%     if newDistance < 0.06 && ~turned
        if newDistance < distance 
            motorL.Speed = 20;
            start(motorL);
            k = 0;
        elseif newDistance > distance
            motorL.Speed = -20;
            start(motorL);
            k = 1;
        end
        while readDistance(sonic) ~= distance
            if readDistance(sonic)>= distance && k == 0
                stop(motorL);
            elseif readDistance(sonic)<= distance && k == 1
                stop(motorL);
            end
        end
        distance = readDistance(sonic);
end

%     elseif newDistance < 0.06 && turned
%         if newDistance < distance 
%             motorL.Speed = 20;
%             start(motorL);
%         elseif newDistance > distance
%             motorL.Speed = -20;
%             start(motorL);
%         end
%         while readDistance(sonic) ~= distance
%             if readDistance(sonic)>= distance
%                 stop(motorL);
%             end
%         end
%     elseif newDistance > 0.06 && turned 
%         turnTurner();
%         turned = false;
%     end
%     %distance = newDistance;
% end