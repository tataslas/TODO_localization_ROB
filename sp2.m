
x = inputdlg('Enter step time to visualize',... %Introducing the snapshot to visualize             
             'Input', [1 20]); 
index = str2num(x{:}) 
Robot= [0 -0.2 0 1;0.4 0 0 1;0 0.2 0 1]';% The Robot icon is a triangle 
for index=1:522 % Use the for loop to see a movie
t = 0: 2*pi/359 : 2*pi; 
P = polar(t, 4.5 * ones(size(t)));% to fix the limits 
set(P, 'Visible', 'off') 
polar(t, lds_dis (index,2:361), '--g'); % Ploting the laser data wrt Robot frame 
title ('Laser data at Robot Reference Frame','FontWeight','bold','FontSize',16) 
subplot(1,2,2) 
title ('Data on Wordl Reference Frame', 'FontWeight','bold','FontSize',16) 
axis([-3 3 -2 4]) 
grid on 
hold on 
for i=1:4 % plotting the 4 Land Marks 
circle (LandMark(i,:)',0.15) 
end
scatter(ldx(index,:), ldy(index,:)) % plotting the land mark seen by the Robot wrt  wordl reference frame
plot (trajec(:,1), trajec(:,2), 'r.','LineWidth',1.5) % Plotting the trajectory 
Robot_tr=transl(trajec(index,1),trajec(index,2),0)*trotz(mod(trajec(index,3)+pi/2,2*pi))*Robot;% moving the robot 
patch(Robot_tr(1,:), Robot_tr(2,:),'b');
plot_ellipse(pk.signals.values(1:2,1:2,index),[trajec(index,1), trajec(index,2)],'g'); % Plotting the covariance matrix 
pause(0.1); 
clf
end


LandMark = [  1.5,1.5; -1.5,1.5; -1.5,-1.5;  1.5, -1.5]'; 
figure 
axis ([-2 2 -2 2]) 
scatter(LandMark(1,:),LandMark(2,:),200, 'r','filled'); 
grid on   

% Translate an rotate the Land Marks 
alpha = pi/16 % Rotate pi/16 rad --> 22.5 degrees 
tx = 0.1; % Translate  
ty = 0.2; 
RotzTxy = [cos(alpha), sin(alpha), tx;... 
          -sin(alpha), cos(alpha), ty;...  
          0,           0,          1]; 
newLM = RotzTxy*[LandMark;ones(1,4)];   
hold on; 
scatter(newLM(1,:), newLM(2,:),200, 'b','filled');


% Similarity transform 
function [ tx,ty,tita,s]=SimilarityTransform(LandMark,newLM) 
assert(size( LandMark , 2) == size(detected, 2)); 
%Build Matrix A 
A = []; 
for i=1:size( LandMark , 2)     
    A = [A;[ LandMark (1,i), LandMark (2,i),1,0]];     
    A = [A;[ LandMark (2,i),-LandMark (1,i),0,1]]; 
end
B = [];%Build Matrix B 
for i=1:size( newLM , 2)     
    B = [B;  newLM (1,i);  newLM (2,i)]; 
end
%Compute tx ty i tita 
X = inv((A'*A))*A'*B; 
Tx_ST = X(3); 
Ty_ST= X(4); 
alpha_ST = atan2(X(2),X(1))*180/pi; 
end
