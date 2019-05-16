
%Apartado 2

%Pasamos las distancias de polar a cartesianas, para obtener las X e Y de
%las landmarks en el reference frame del robot
for i=1:523
    for j=2:361
        ldx_RFr(i,j) = (lds_dis(i,j)*cosd(j))/1000;
        ldy_RFr(i,j) = (lds_dis(i,j)*sind(j))/1000;
    end
end

%Plot landmarks en el reference frame del robot
for k=1:522
    scatter(ldx_RFr(k,:), ldy_RFr(k,:));
    axis([-3 3 -2 4]); 
    hold on;
end
