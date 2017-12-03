function [E,res] = potong(d,rec)
rect = ceil(rec)
for i=1 : rect(4)
    for j =1: rect(3)
        E(i,j,:)=d(rect(2)+i-1,rect(1)+j-1,:);
    end
end  
res = [size(E,1),size(E,2)];