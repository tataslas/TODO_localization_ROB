
%Apartado 4

%Filtro de las landmarks, eliminamos las que no corresponden a un landmark
%real
xcount_u_r = 0;
xcount_d_r = 0;
xcount_u_l = 0;
xcount_d_l = 0;

ycount_u_r = 0;
ycount_d_r = 0;
ycount_u_l = 0;
ycount_d_l = 0;

xsum_u_r = 0;
xsum_d_r = 0;
xsum_u_l = 0;
xsum_d_l = 0;

ysum_u_r = 0;
ysum_d_r = 0;
ysum_u_l = 0;
ysum_d_l = 0;

for i=1:522
    for j=1:360
        %Arriba derecha (ur)
        if (ldx_RFw(i,j) > (0.5) && ldx_RFw(i,j) < (2.5)) && (ldy_RFw(i,j) > (0.5) && ldy_RFw(i,j) < (2.5))
            xcount_u_r = xcount_u_r + 1;
            xsum_u_r = xsum_u_r + ldx_RFw(i,j);
            
            ycount_u_r = ycount_u_r + 1;
            ysum_u_r = ysum_u_r + ldy_RFw(i,j);
            
        %Abajo derecha (dr)
        elseif (ldx_RFw(i,j) > (0.5) && ldx_RFw(i,j) < (2.5)) && (ldy_RFw(i,j) < (-0.5) && ldy_RFw(i,j) > (-2.5))
            xcount_d_r = xcount_d_r + 1;
            xsum_d_r = xsum_d_r + ldx_RFw(i,j);
            
            ycount_d_r = ycount_d_r + 1;
            ysum_d_r = ysum_d_r + ldy_RFw(i,j);
            
        %Abajo izquierda (dl)
        elseif (ldx_RFw(i,j) < (-0.5) && ldx_RFw(i,j) > (-2.5)) && (ldy_RFw(i,j) < (-0.5) && ldy_RFw(i,j) > (-2.5))
            xcount_d_l = xcount_d_l + 1;
            xsum_d_l = xsum_d_l + ldx_RFw(i,j);
            
            ycount_d_l = ycount_d_l + 1;
            ysum_d_l = ysum_d_l + ldy_RFw(i,j);
            
        %Arriba izquierda (ul)
        elseif (ldx_RFw(i,j) < (-0.5) && ldx_RFw(i,j) > (-2.5)) && (ldy_RFw(i,j) > (0.5) && ldy_RFw(i,j) < (2.5))
            xcount_u_l = xcount_u_l + 1;
            xsum_u_l = xsum_u_l + ldx_RFw(i,j);
            
            ycount_u_l = ycount_u_l + 1;
            ysum_u_l = ysum_u_l + ldy_RFw(i,j);   
        end  
    end
end

%Medias
% X
landmarks_nuestras(1,1) = xsum_u_r/xcount_u_r;
landmarks_nuestras(1,2) = xsum_d_r/xcount_d_r;
landmarks_nuestras(1,3) = xsum_u_l/xcount_u_l;
landmarks_nuestras(1,4) = xsum_d_l/xcount_d_l;
% Y
landmarks_nuestras(2,1) = ysum_u_r/ycount_u_r;
landmarks_nuestras(2,2) = ysum_d_r/ycount_d_r;
landmarks_nuestras(2,3) = ysum_u_l/ycount_u_l;
landmarks_nuestras(2,4) = ysum_d_l/ycount_d_l;

%Landmarks originales
LandMark = [  1.5,1.5; -1.5,1.5; -1.5,-1.5;  1.5, -1.5]'; 
figure 
axis ([-2 2 -2 2]) 
scatter(LandMark(1,:),LandMark(2,:),200, 'r','filled'); 
grid on;
hold on;
%Plot landmarks nuestras en FR world
scatter(landmarks_nuestras(1,:),landmarks_nuestras(2,:),200, 'b','filled');




