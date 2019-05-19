
%Build Matrix A 
A = []; 
for i=1:size( LandMark , 2)     
    A = [A;[ LandMark(1,i), LandMark(2,i),1,0]];     
    A = [A;[ LandMark(2,i),-LandMark(1,i),0,1]]; 
end

%Build Matrix B 
B = [];
for i=1:size( landmarks_nuestras , 2)     
    B = [B;  landmarks_nuestras(1,i);  landmarks_nuestras(2,i)]; 
end

%Compute tx ty i tita 
X = inv((A'*A))*A'*B; 
Tx_ST = X(3); 
Ty_ST= X(4); 
alpha_ST = atan2(X(2),X(1))*180/pi; 