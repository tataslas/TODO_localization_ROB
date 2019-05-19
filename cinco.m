
%Apartado 5

%Build Matrix A 
A = []; 
for i=1:size( LandMark , 2)     
    A = [A;[ LandMark(1,i), LandMark(2,i),1,0]];     
    A = [A;[ LandMark(2,i),-LandMark(1,i),0,1]]; 
end

%Build Matrix B 
B = [];
for i=1:size( landmarks_nuestras , 2)     
    B = [B;  [landmarks_nuestras(1,i),  landmarks_nuestras(2,i)]]; 
end

%Compute tx ty i tita 
X = inv((A'*A))*A'*B; 
Tx_ST = X(3); 
Ty_ST= X(4); 
alpha_ST = atan2(X(2),X(1))*180/pi; 

%Rotamos y transladamos nuestras landmarks
matriz_correccion = transl(Tx_ST,Ty_ST,0)*trotz(alpha_ST);

landmarks_corregidas(1,:) = landmarks_nuestras(1,:)*matriz_correccion;
landmarks_corregidas(2,:) = landmarks_nuestras(2,:)*matriz_correccion;

%Landmarks originales
LandMark = [  1.5,1.5; -1.5,1.5; -1.5,-1.5;  1.5, -1.5]'; 
figure 
axis ([-2 2 -2 2]) 
scatter(LandMark(1,:),LandMark(2,:),200, 'r','filled'); 
grid on;
hold on;
%Plot landmarks nuestras en FR world corregidas
scatter(landmarks_corregidas(1,:),landmarks_corregidas(2,:),200, 'b','filled');

