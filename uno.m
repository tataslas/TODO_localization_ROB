
clear
close all
load('Work_Space_Localization_Short_project.mat')

for index=1:522 % Use the for loop to see a movie
   Ls(index,1) = data_enc(index,1);
   Ls(index,2) = data_enc(index,6);   
   
   Rs(index,1) = data_enc(index,1);
   Rs(index,2) = data_enc(index,7);
end

Robot= [0 -0.2 0 1;0.4 0 0 1;0 0.2 0 1]';% The Robot icon is a triangle
data = data_enc

dist = 0;
angulo = 0;
x = 0;
y = 0;
for index=2:522 % Use the for loop to see a movie
    R1 = data(index,7);
    L1 = data(index,6);
    R0 = data(index-1,7);
    L0 = data(index-1,6);
    Rmio(index,1) = data_enc(index,1);
    Rmio(index,2) = R1-R0;
    Lmio(index,1) = data_enc(index,1);
    Lmio(index,2) = L1-L0;
end


%Encontrando la trayectoria
%Inicializamos

ts=0.02; 
S = 243/2;

IC = [8.65,17.2,-pi/2]
x_ini=IC(1);
y_ini=IC(2);
theta_ini=IC(3);

x_w=x_ini;
y_w=y_ini;
suma_theta=-theta_ini; 

ProcNoiseD = [0.000100000000000000]
ProcNoiseTheta = [1.00000000000000e-06]
V=[ProcNoiseD 0;0 ProcNoiseTheta]
    
for index=1:522
    delta_th = ((Rmio(index,2)-Lmio(index,2))/(2*S));
    delta_d = (Rmio(index,2)+Lmio(index,2))/2;
    
    x_w = x_w + (delta_d + V(1,1))*cos(suma_theta + delta_th + V(2,2))
    y_w = y_w + (delta_d + V(1,1))*sin(suma_theta + delta_th + V(2,2))
    suma_theta=mod((suma_theta + delta_th + V(2,2)) ,2*pi); 
    
    traj(index,1) = x_w;
    traj(index,2) = y_w;
    traj(index,3) = suma_theta;

    %Pose_t=[x_w;y_w;suma_theta];
end

plot (traj(:,1), traj(:,2), 'r.','LineWidth',1.5) % Plotting the trajectory 



