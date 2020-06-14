%Name and shit
%Control Systems Course Project
%Aim: DC motor speed control using PID controller

clc;
clear all;
close all;
%Values change kar bsdk
L=0.3 %Motor inductance
R=1.1 %Motor Resistance
Il=0.004 %Moment of intertia
Kt=0.25 %Torque constant
Kb=0.28 %Back EMF

sys = tf([1],[L*Il/Kt R*Il/Kt Kb])

subplot(5,1,1)
step(sys)
title ('Step Response')

subplot(5,1,2)
impulse(sys)
title ('Impulse response')

stepinfo(sys)

subplot(5,1,4)
pzmap(sys)
title ('Pole-Zero Map')

subplot(5,1,5)
rlocus(sys)
title ('Root Locus')

subplot(5,1,3)
bode(sys)
title ('Bode Plot')