%Final Collaboration Code : Mechatronics Design Project 2
%Author Judy Afana, Temidire Oduyale, Frank Du & Mechatronics Team
%Design Project 2 
%Mechatronics

clear all;
clc;

  

  
% % %     
 % %     %initilize global variables 
%    global robot;
%    global motorR;
%    global motorL;
%    global robotDirection;
%    global sonic;




%connect robot sensors and motors to matlab
% robot = legoev3('usb');
% motorR = motor(robot,'A');
% motorL = motor(robot,'B');
% sonic = sonicSensor(robot,2);
%     

%call all scripts 
Array;
MainAttempt1;
Maini2;
OptimalPath;

%initilize robot direction
%read sonic sensor
robotDirection = 0; 
pause(2);



%control robot to follow directions based on the optimal path 
for i = 1:50
    if a(1,i) >= 0 
        numDir = numDir - 1;
        if a(1,i)== robotDirection
            moveForward();
        elseif abs(a(1,i)-robotDirection)<3 && a(1,i)>robotDirection
            turnR();
            while robotDirection ~= a(1,i)
                turnR();
            end
            moveForward();
            
        elseif robotDirection==3 && a(1,i)==0
            turnR;
            moveForward();
           
        else
            turnL();
            while robotDirection ~= a(1,i)
                turnL();
            end
            moveForward();
            
        end
    end
    
       
       
end        

%% moveForward funtion
function moveForward

robot = legoev3('usb');
motorR = motor(robot,'A');
motorL = motor(robot,'B');
sonic = sonicSensor(robot,2);
global robotDirection;   
global currentPosRow;
global currentPosCol;
    speedR = -30;
    speedL = -32;
    distance = readDistance(sonic);
    max_dist = .20;
    min_dist = .1;
    kp = 1;
    ki = 0;
    kd = 0;
    derivitive = 0;
    integral = 0;
    lasterror = 0;
    resetRotation(motorL); resetRotation(motorR);
    
    while readRotation(motorL) > -341.2 && readRotation(motorR) > -355.50
        if distance > 0 && distance < 200     
            if distance > max_dist
                error = distance - max_dist;
                integral = integral + error;
                derivitive = error - lasterror;
            elseif distance < min_dist
                error = min_dist - distance;
                integral = integral + error;
                derivitive = error - lasterror;
            else
                error = distance - ((max_dist + min_dist)/2);
                integral = integral + error;
                derivitive = error - lasterror;
            end
             start(motorR);start(motorL);
             motorR.Speed = speedR + (kp*error) + (ki*integral) + (kd*derivitive);
             motorL.Speed = speedL - (kp*error) + (ki*integral) + (kd*derivitive);
             lasterror = error;

        end
    end
    stop(motorL);
    stop(motorR);

    
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

%%moveFunction
function move(encoderL,encoderR,speedL,speedR)
    robot = legoev3('usb');
    motorR = motor(robot,'A');
    motorL = motor(robot,'B');

    
    reached=false; %controls the motor encoders individually 
    L = true;
    R = true; 
    resetRotation(motorL);
    resetRotation(motorR);

    motorL.Speed = speedL; 
    motorR.Speed = speedR;
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
%%turnR
function turnR()

    global robotDirection;
    
    move(-285,26,-70,0);    
    robotDirection = robotDirection+1;
    
    if robotDirection == 4
            robotDirection = 0;          
    end    
end
%%turnL
function turnL()
    
    global robotDirection;
    
    move(37,-265,0,-75);
    robotDirection = robotDirection-1;
    
    if robotDirection == -1
        robotDirection=3;
    end    
end
%%end of code
