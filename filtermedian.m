function hasil = filtermedian(A,B);
P_A = size(A,1);
P_B = size(A,2);
H = zeros(P_A,P_B,3);
p = floor(B/2); 
Apad = padArr(A,p);
for i = 1+p : size(Apad,1)-p
    for j = 1+p : size(Apad,2)-p
        M = Apad(i-p:i+p,j-p:j+p,1:3);
        M = double(M);
        M = M(:);
        L1 = bbsort(M(1:(B*B*1)));
        L2 = bbsort(M((B*B*1)+1:(B*B*2)));
        L3 = bbsort(M((B*B*2)+1:(B*B*3)));
        L1 = L1(ceil((B*B)/2));
        L2 = L2(ceil((B*B)/2));
        L3 = L3(ceil((B*B)/2));
        H(i-p,j-p,1) = L1;
        H(i-p,j-p,2) = L2;
        H(i-p,j-p,3) = L3;
    end
end
hasil = uint8(H);