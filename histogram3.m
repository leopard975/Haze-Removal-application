PS=imread('E:\Graduate Project\image\86.jpg');  
PS=rgb2gray(PS);                            %�ҶȻ�������ݴ�������
figure
imshow(PS)
title('ԭͼ�Ҷ�ͼ')
 
J = histeq(PS);
figure
imshow(J)
title('ֱ��ͼ���⻯')