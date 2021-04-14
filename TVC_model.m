%% Simulation Initialization
hold off;close all;clear
m=1;     %Mass
g=9.8;   %Gravitational Parameter
L=0.1;   %Distance from TVC Mount to COM
I=0.002; %Moment of Inertia
dt=0.01; %Control cycle time

%State Space Matrices
A=[0 0 0 1 0 0;
   0 0 0 0 1 0;
   0 0 0 0 0 1;
   0 0 -g 0 0 0;
   0 0 0 0 0 0;
   0 0 0 0 0 0];
B=[0 0;
   0 0;
   0 0;
   0 -g;
   1/m 0;
   0 -m*g*L/I];
C=[1 0 0 0 0 0;
   0 1 0 0 0 0
   0 0 0 0 0 1];

%Define Closed-Loop Poles
P=[-1 -2 -3 -4 -5 -6];

%Compute Gain Matrix
K=place(A,B,P);

%% Plotting
figure(1)
plot(out.x_sensor(:,1),out.x_sensor(:,2),'Linewidth',0.1)
hold on
plot(out.x_est(:,1),out.x_est(:,2),'Linewidth',2)
title('Measured X-Position vs Estimated Position')
xlabel('Time (seconds)')
ylabel('X-Position (meters)')
xlim([0 55.5])
legend('Sensor Reading','Estimated State','Location','Southeast')

figure(2)
plot(out.y_sensor(:,1),out.y_sensor(:,2),'Linewidth',0.1)
hold on
plot(out.x_est(:,1),out.x_est(:,3),'Linewidth',2)
title('Measured Y-Position vs Estimated Position')
xlabel('Time (seconds)')
ylabel('Y-Position (meters)')
xlim([0 55.5])
ylim([0 25])
legend('Sensor Reading','Estimated State')

figure(3)
plot([0,0,50,50],[0,20,20,0],'Linewidth',2)
hold on
plot(out.x_truth(:,2),out.y_truth(:,2),'Linewidth',2)
xlim([-5 55])
ylim([0 25])
title('Reference vs Actual Trajectory')
legend('Reference Trajectory','Actual Trajectory')
xlabel('X-Position (meters)')
ylabel('Y-Position (meters)')










