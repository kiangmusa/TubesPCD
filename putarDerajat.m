function E = putarDerajat(A,rads)
P_A = size(A,1);
P_B = size(A,2);
midx=ceil((P_A)/2);
midy=ceil((P_B)/2);
for i=1:P_A
    for j=1:P_B
         x= (i-midx)*cosd(rads)-(j-midy)*sind(rads);
         y= (i-midx)*sind(rads)+(j-midy)*cosd(rads);
         x=ceil(x)+midx;
         y=ceil(y)+midy;
         if (x>=1 && y>=1 && x<=P_A && y<=P_B)
              E(x,y,:)=A(i,j,:); 
         end
    end
end