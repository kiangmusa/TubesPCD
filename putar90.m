function E = putar90(A)
P_A = size(A,1);
P_B = size(A,2);

for i=1:P_B 
    for j=P_A:-1:1
        E(i,j,:)= A((P_A-j+1),i,:);
    end
end
