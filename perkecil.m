function [E,res]= perkecil(A,kali)

P_A = size(A,1)/kali;
P_B = size(A,2)/kali;


for i=1:P_A
    k=i*kali;
    for j=1:P_B
        l=j*kali;
        D=mean(mean(A((k-kali)+1:k,(l-kali)+1:l,:)));
        D = uint8(D);
        E(i,j,:)=D;

    end
end
res = [size(E,1),size(E,2)];