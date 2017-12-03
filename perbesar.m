function [E,res] = perbesar(A,kali)

P_A = size(A,1);
P_B = size(A,2);
for i=1:P_A
    k=i*kali;
    for j=1:P_B
       l=j*kali;
       E((k-kali)+1:k,(l-kali)+1:l,1)=A(i,j,1);
       E((k-kali)+1:k,(l-kali)+1:l,2)=A(i,j,2);
       E((k-kali)+1:k,(l-kali)+1:l,3)=A(i,j,3);
    end
end
res = [size(E,1),size(E,2)];
      

              