f=imread('E:\Graduate Project\image\86.jpg');
fr=f(:, :, 1); fg=f(:, :, 2); fb=f(:, :, 3);%RGB通道
mr=mat2gray(im2double(fr)); mg=mat2gray(im2double(fg)); mb=mat2gray(im2double(fb));%数据类型归一化
alf1=1458; %定义标准差alf=a^2/2  a=54
n=161;%定义模板大小 =3a
% alf1=200; %定义标准差alf=a^2/2  a=20
%  n=61;%定义模板大小 

n1=floor((n+1)/2);%计算中心 
for i=1:n 
    for j=1:n 
      b(i,j) =exp(-((i-n1)^2+(j-n1)^2)/(4*alf1))/(pi*alf1); %高斯函数
    end 
end 
nr1 = imfilter(mr,b,'conv', 'replicate');ng1 = imfilter(mg,b,'conv', 'replicate');nb1 = imfilter(mb,b,'conv', 'replicate');%卷积滤波
ur1=log(nr1); ug1=log(ng1); ub1=log(nb1);
tr1=log(mr);tg1=log(mg);tb1=log(mb);
yr1=(tr1-ur1)/3;yg1=(tg1-ug1)/3;yb1=(tb1-ub1)/3;
alf2=13944.5; %定义标准差alf=a^2/2    a=10.3325
x=501;%定义模板大小 
%  alf2=1250; %定义标准差alf=a^2/2  a=50
%  x=151;%定义模板大小 

x1=floor((n+1)/2);%计算中心 
for i=1:n 
    for j=1:n 
      a(i,j) =exp(-((i-n1)^2+(j-n1)^2)/(4*alf2))/(6*pi*alf2); %高斯函数
    end 
end 
nr2 = imfilter(mr,a,'conv', 'replicate');ng2 = imfilter(mg,a,'conv', 'replicate');nb2 = imfilter(mb,a,'conv', 'replicate');%卷积滤波
ur2=log(nr2); ug2=log(ng2); ub2=log(nb2);
tr2=log(mr);tg2=log(mg);tb2=log(mb);
yr2=(tr2-ur2)/3;yg2=(tg2-ug2)/3;yb2=(tb2-ub2)/3;
alf3=53; %定义标准差alf=a^2/2  a=167
l=31;%定义模板大小 
%  alf3=20000; %定义标准差alf=a^2/2  a=200
%  l=601;%定义模板大小 

l1=floor((n+1)/2);%计算中心 
for i=1:n 
    for j=1:n 
      e(i,j) =exp(-((i-n1)^2+(j-n1)^2)/(4*alf3))/(4*pi*alf3); %高斯函数
    end 
end 
nr3 = imfilter(mr,e,'conv', 'replicate');ng3 = imfilter(mg,e,'conv', 'replicate');nb3 = imfilter(mb,e,'conv', 'replicate');%卷积滤波
ur3=log(nr3); ug3=log(ng3); ub3=log(nb3);
tr3=log(mr);tg3=log(mg);tb3=log(mb);
yr3=(tr3-ur3)/3;yg3=(tg3-ug3)/3;yb3=(tb3-ub3)/3;
dr=yr1+yr2+yr3;dg=yg1+yg2+yg3;db=yb1+yb2+yb3;
    
cr=im2uint8(dr); cg=im2uint8(dg); cb=im2uint8(db);
z=cat(3, cr, cg, cb);          
figure(1), imshow(z)
figure(2), imshow(f)
%由于卷积时需要保证精度，应先把[0,255]的unit8图像归一化成[0.0,1.0]的浮点型。
%那么利用matlab实现步骤为：读入图像→归一化→设置高斯函数参数及矩阵→高斯函数和输入图像矩阵卷积→取对数→和输入图像矩阵的对数相差→取指数→输出图像