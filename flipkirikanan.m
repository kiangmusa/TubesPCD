function E = flipkirikanan(A)

P_A = size(A,1);
P_B = size(A,2);

for i=1:P_A 
    for j=P_B:-1:1
        E(i,j,:)= A(i,(P_B-j+1),:);
    end
end