clear all
%一，图像的预处理，读入彩色图像将其灰度化
PS=imread('E:\Graduate Project\image\86.jpg');                 %读入JPG彩色图像文件
% imshow(PS)                                  %显示出来 
% title('输入的彩色JPG图像')
%imwrite(rgb2gray(PS),'PicSampleGray.bmp'); %将彩色图片灰度化并保存
PS=rgb2gray(PS);                            %灰度化后的数据存入数组
imshow(PS)
title('原图灰度图')

%二，绘制直方图
[m,n]=size(PS);                             %测量图像尺寸参数
GP=zeros(1,256);                            %预创建存放灰度出现概率的向量
for k=0:255
     GP(k+1)=length(find(PS==k))/(m*n);      %计算每级灰度出现的概率，将其存入GP中相应位置
end
figure,bar(0:255,GP,'g')                    %绘制直方图
title('原图像直方图')
xlabel('灰度值')
ylabel('出现概率')
%三，直方图均衡化
S1=zeros(1,256);
for i=1:256
     for j=1:i
          S1(i)=GP(j)+S1(i);                 %计算Sk
     end
end
S2=round((S1*256)+0.5);                          %将Sk归到相近级的灰度
for i=1:256
     GPeq(i)=sum(GP(S2==i));           %计算现有每个灰度级出现的概率
end
figure,bar(0:255,GPeq,'b')                  %显示均衡化后的直方图
title('均衡化后的直方图')
xlabel('灰度值')
ylabel('出现概率')
%四，图像均衡化
PA=PS;
for i=0:255
     PA(PS==i)=S2(i+1);                %将各个像素归一化后的灰度值赋给这个像素
end
figure,imshow(PA)                           %显示均衡化后的图像 
title('均衡化后图像')
%imwrite(PA,'PicEqual.bmp');
