
%Apartado 2
for i=1:523
    for j=2:361
        land_x(i,j) = (lds_dis(i,j)*cosd(j))/1000;
        land_y(i,j) = (lds_dis(i,j)*sind(j))/1000;
    end
end

%Calculo ldx y ldy
for k=1:522
    Tw_r = transl(matrix_pose(k,1), matrix_pose(k,2),0)*trotz(matrix_pose(k,3));
    for l=1:360
        aux = Tw_r*[land_x(k,l); land_y(k,l); 0; 0];
        ldx_nuestra(k,l) = aux(1);
        ldy_nuestra(k,l) = aux(2);
    end
end
