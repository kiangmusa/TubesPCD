function hasil = Dilasi(A,B,n)
A1 = size(A,1);
A2 = size(A,2);
f = floor(n/2);
B1 = size(B,1);
B2 = size(B,2);
H = zeros(A1,A2);
g = im2double(conGray(A));
g = g>0.5;
for i=1:A1
    for j=1:A2
        if (g(i,j)==1)
            for k=1:B1
                for m=1:B2
                    if(B(k,m)==1)
                        c=i+k;
                        d=j+m;
                        H(c,d)=1;
                    end
                end
            end
        end
    end
end
hasil = H;