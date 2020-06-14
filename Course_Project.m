%Johnathan Fernandes
%SY Q-35, GR 1710168
%Control Systems Course Project
%Aim: DC motor speed control using PID controller

clc;
clear all;
close all;

L=0.2 %Motor inductance
R=1 %Motor Resistance
Il=0.005 %Moment of intertia
Kt=0.1 %Torque constant
Kb=0.1 %Back EMF

Kd = 0.324117712006743 %Derivative gain
Kp = 13.9650000684377 %Proportional gain
Ki = 71.5567329822431 %Integral gain

sys0 = tf([1],[L*Il/Kt R*Il/Kt Kb])%Original open loop tf
sys1 = tf([Kd Kp Ki],[L*Il/Kt (R*Il/Kt)+Kd Kb+Kp Ki])%Closed loop system with PID controller

suptitle('Original open loop system')

subplot(2,3,1)
step(sys0)
title ('Step Response')

subplot(2,3,2)
impulse(sys0)
title ('Impulse response')

stepinfo(sys0)

subplot(2,3,3)
pzmap(sys0)
title ('Pole-Zero Map')

subplot(2,3,4)
rlocus(sys0)
title ('Root Locus')

subplot(2,3,5)
bode(sys0)
title ('Bode Plot')

figure;
suptitle('Closed loop system with PID controller')

subplot(2,3,1)
step(sys1)
title ('Step Response')

subplot(2,3,2)
impulse(sys1)
title ('Impulse response')

stepinfo(sys1)

subplot(2,3,3)
pzmap(sys1)
title ('Pole-Zero Map')

subplot(2,3,4)
rlocus(sys1)
title ('Root Locus')

subplot(2,3,5)
bode(sys1)
title ('Bode Plot')