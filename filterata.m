function hasil = filterata(A,B)
P_A = size(A,1);
P_B = size(A,2);
H = zeros(P_A,P_B,3);
p = floor(B/2);
Mask(1:B, 1:B,1:3)=1/(B*B); 
Apad = padArr(A,p);
for i = 1+p : size(Apad,1)-p
    for j = 1+p : size(Apad,2)-p
        M = Apad(i-p:i+p,j-p:j+p,1:3);
        M = double(M);
        SH = sum(sum(M.*Mask));
        H(i-p,j-p,1:3) = floor(SH);
    end
end
hasil = uint8(H);
