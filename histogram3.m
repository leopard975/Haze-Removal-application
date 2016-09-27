PS=imread('E:\Graduate Project\image\86.jpg');  
PS=rgb2gray(PS);                            %灰度化后的数据存入数组
figure
imshow(PS)
title('原图灰度图')
 
J = histeq(PS);
figure
imshow(J)
title('直方图均衡化')