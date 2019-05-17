
%Apartado 3

%Calculo ldx y ldy pasamos del RF del robot al RF del mundo
for i=1:522
%       alpha = matrix_pose(i,3);
%       Tw_r = [ cos(alpha), -sin(alpha), 0, matrix_pose(i,1);...
%                sin(alpha), cos(alpha), 0, matrix_pose(i,2);...
%                0,  0,  1,  0;...
%                0,  0,  0,  1];
    Tw_r = transl(matrix_pose(i,1)/1000, matrix_pose(i,2)/1000,0)*trotz(matrix_pose(i,3));
    
    for j=1:360
        aux = Tw_r*[ldx_RFr(i,j); ldy_RFr(i,j); 0; 1];
        ldx_RFw(i,j) = aux(1);
        ldy_RFw(i,j) = aux(2);
    end
end

%Prueba si va el RFw
for k=1:522
    scatter( ldx_RFw(k,:), ldy_RFw(k,:));
    axis([-3 3 -2 4]); 
    hold on;
end

%Plot landmarks RFw
Robot= [0 -0.2 0 1;0.4 0 0 1;0 0.2 0 1]';% The Robot icon is a triangle 
for k=1:522
    patch(Robot(1,:), Robot(2,:),'b'); %Pintamos el robot
    for i=1:4 % plotting the 4 Land Marks 
        circle (LandMark(i,:)',0.15, 'LineWidth',2);
    end
    
    scatter(ldx_RFw(k,:), ldy_RFw(k,:));
    axis([-3 3 -2 4]); 
    hold on;
end


%Lo que deberia de dar
for k=1:522
    scatter(ldx(k,:), ldy(k,:));
    axis([-3 3 -2 4]); 
    hold on;
end