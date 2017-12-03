function E = flipatasbawah(A)

P_A = size(A,1);
P_B = size(A,2);

for i=P_A:-1:1 
    for j=1:P_B
        E(i,j,:)= A((P_A-i+1),j,:);
    end
end