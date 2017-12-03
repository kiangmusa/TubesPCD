function hasil = HistEQ(A)
P_A = size(A,1);
P_B = size(A,2);
[counts1, x1]=imhist(A(:,:,1));
[counts2, x2]=imhist(A(:,:,2));
[counts3, x3]=imhist(A(:,:,3));
histEqu1 = [];
histEqu2 = [];
histEqu3 = [];
for i=1:256
    Jum1 = 0;
    Jum2 = 0;
    Jum3 = 0;
    for j=1:i
        Jum1 = Jum1+counts1(j);
        Jum2 = Jum2+counts2(j);
        Jum3 = Jum3+counts3(j);
    end
    histEqu1 = [histEqu1;round((Jum1/(P_A*P_B))*255)];
    histEqu2 = [histEqu2;round((Jum2/(P_A*P_B))*255)];
    histEqu3 = [histEqu3;round((Jum3/(P_A*P_B))*255)];
end
%A(1,2,1)
 for i=1:P_A
     for j=1:P_B
         A(i,j,1) = histEqu1(A(i,j,1)+1);
         A(i,j,2) = histEqu2(A(i,j,2)+1);
         A(i,j,3) = histEqu3(A(i,j,3)+1);
     end
 end
 hasil = A;
