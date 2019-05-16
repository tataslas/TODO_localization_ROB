
%Apartado 2
for i=1:523
    for j=2:361
        land_x(i,j) = (lds_dis(i,j)*cosd(j))/1000;
        land_y(i,j) = (lds_dis(i,j)*sind(j))/1000;
    end
end
