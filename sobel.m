function hasil = sobel(A)
P_A = size(A,1);
P_B = size(A,2);
B = 3;
gray = conGray(A);
gray = im2double(uint8(gray));
gx = [-1,0,1;-2,0,2;-1,0,1];
gy = [-1,-2,-1;0,0,0;1,2,1];
H = zeros(P_A,P_B);
p = floor(B/2); 
Apad = padArr2D(gray,p);
for i = 1+p : size(Apad,1)-p
    for j = 1+p : size(Apad,2)-p
        M = Apad(i-p:i+p,j-p:j+p);
        konv1 = sum(sum(M.*gx));
        konv2 = sum(sum(M.*gy));
        konv = sqrt(konv1^2+konv2^2); 
        H(i,j)= konv;
    end
end
hasil = H;
