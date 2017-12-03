function outputHisto(A)
A1 = A(:,:,1);
A2 = A(:,:,2);
A3 = A(:,:,3);
figure
subplot(221); 
plot(imhist(A1)); title('Red');
subplot(222);
plot(imhist(A2));title('Green');
subplot(223);
plot(imhist(A3));title('Blue');
