clear all
%һ��ͼ���Ԥ�����������ɫͼ����ҶȻ�
PS=imread('E:\Graduate Project\image\86.jpg');                 %����JPG��ɫͼ���ļ�
% imshow(PS)                                  %��ʾ���� 
% title('����Ĳ�ɫJPGͼ��')
%imwrite(rgb2gray(PS),'PicSampleGray.bmp'); %����ɫͼƬ�ҶȻ�������
PS=rgb2gray(PS);                            %�ҶȻ�������ݴ�������
imshow(PS)
title('ԭͼ�Ҷ�ͼ')

%��������ֱ��ͼ
[m,n]=size(PS);                             %����ͼ��ߴ����
GP=zeros(1,256);                            %Ԥ������ŻҶȳ��ָ��ʵ�����
for k=0:255
     GP(k+1)=length(find(PS==k))/(m*n);      %����ÿ���Ҷȳ��ֵĸ��ʣ��������GP����Ӧλ��
end
figure,bar(0:255,GP,'g')                    %����ֱ��ͼ
title('ԭͼ��ֱ��ͼ')
xlabel('�Ҷ�ֵ')
ylabel('���ָ���')
%����ֱ��ͼ���⻯
S1=zeros(1,256);
for i=1:256
     for j=1:i
          S1(i)=GP(j)+S1(i);                 %����Sk
     end
end
S2=round((S1*256)+0.5);                          %��Sk�鵽������ĻҶ�
for i=1:256
     GPeq(i)=sum(GP(S2==i));           %��������ÿ���Ҷȼ����ֵĸ���
end
figure,bar(0:255,GPeq,'b')                  %��ʾ���⻯���ֱ��ͼ
title('���⻯���ֱ��ͼ')
xlabel('�Ҷ�ֵ')
ylabel('���ָ���')
%�ģ�ͼ����⻯
PA=PS;
for i=0:255
     PA(PS==i)=S2(i+1);                %���������ع�һ����ĻҶ�ֵ�����������
end
figure,imshow(PA)                           %��ʾ���⻯���ͼ�� 
title('���⻯��ͼ��')
%imwrite(PA,'PicEqual.bmp');