
%Apartado 4

%Filtro de las landmarks, eliminamos las que no corresponden a un landmark
%real
xcont_u_r = 0;
xcont_d_r = 0;
xcont_u_l = 0;
xcont_d_l = 0;

ycont_u_r = 0;
ycont_d_r = 0;
ycont_u_l = 0;
ycont_d_l = 0;

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
        %%%%%%
        % X
        %%%%%%
        %Arriba derecha
        if ldx_RFw(i,j) > (0.5) && ldx_RFw(i,j) < (2.5)
            ldx_RFw_filtro(i,j) = ldx_RFw(i,j);
            xcont_u_r = xcont_u_r + 1;
            xsum_u_r = xsum_u_r + ldx_RFw(i,j);
            
        %Abajo derecha
        elseif ldx_RFw(i,j) > (0.5) && ldx_RFw(i,j) < (-2.5)
            ldx_RFw_filtro(i,j) = ldx_RFw(i,j);
            xcont_d_r = xcont_d_r + 1;
            xsum_d_r = xsum_d_r + ldx_RFw(i,j);
        
        %Abajo izquierda
        elseif ldx_RFw(i,j) > (-0.5) && ldx_RFw(i,j) < (-2.5)
            ldx_RFw_filtro(i,j) = ldx_RFw(i,j);
            xcont_d_l = xcont_d_l + 1;
            xsum_d_l = xsum_d_l + ldx_RFw(i,j);
         
        %Arriba izquierda
        elseif ldx_RFw(i,j) > (-0.5) && ldx_RFw(i,j) < (2.5)
            ldx_RFw_filtro(i,j) = ldx_RFw(i,j);
            xcont_u_l = xcont_u_l + 1;
            xsum_u_l = xsum_u_l + ldx_RFw(i,j);
            
        else
            ldx_RFw_filtro(i,j) = 0;
        end  
        
        %%%%%%
        % Y
        %%%%%%
         %Arriba derecha
        if ldy_RFw(i,j) > (0.5) && ldy_RFw(i,j) < (2.5)
            ldy_RFw_filtro(i,j) = ldy_RFw(i,j);
            ycont_u_r = ycont_u_r + 1;
            ysum_u_r = ysum_u_r + ldx_RFw(i,j);
            
        %Abajo derecha
        elseif ldy_RFw(i,j) > (0.5) && ldy_RFw(i,j) < (-2.5)
            ldy_RFw_filtro(i,j) = ldy_RFw(i,j);
            ycont_d_r = ycont_d_r + 1;
            ysum_d_r = ysum_d_r + ldx_RFw(i,j);
        
        %Abajo izquierda
        elseif ldy_RFw(i,j) > (-0.5) && ldy_RFw(i,j) < (-2.5)
            ldy_RFw_filtro(i,j) = ldy_RFw(i,j);
            ycont_d_l = ycont_d_l + 1;
            ysum_d_l = ysum_d_l + ldx_RFw(i,j);
         
        %Arriba izquierda
        elseif ldy_RFw(i,j) > (-0.5) && ldy_RFw(i,j) < (2.5)
            ldy_RFw_filtro(i,j) = ldy_RFw(i,j);
            ycont_u_l = ycont_u_l + 1;
            ysum_u_l = ysum_u_l + ldx_RFw(i,j);
            
        else
            ldy_RFw_filtro(i,j) = 0;
        end 
    end
end
