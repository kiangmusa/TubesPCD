function hasil = conGray(A)
Red = A(:,:,1);
Green = A(:,:,2);
Blue = A(:,:,3);
gray = .299*double(Red) + .587*double(Green) + .114*double(Blue);
hasil = gray;