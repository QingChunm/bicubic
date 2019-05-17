clear;
close all;
imgname = 'baboon.bmp';
img=imread(imgname);           %读取图像到ff
scale=2;                            %设置放大倍数
a = 0.51;
[height,width,channel]=size(img);  
img =  wextend('2d', 'sym', img, 4);
img=im2double(img);
tmp_out = zeros(height*scale,width*scale);
out = zeros(height*scale,width*scale);
for ch = 1:channel
    im = img(:,:,ch);
    for i=1:scale*height                 
        u=rem(i,scale)/scale;            
        i1=floor(i/scale);  
        A=[sw(2+u,a),sw(1+u,a) sw(u,a) sw(1-u,a) sw(2-u,a),sw(3-u,a)];        %纵方向
        for j=1:scale*width
            v=rem(j,scale)/scale;
            j1=floor(j/scale);  
            C=[sw(2+v,a);sw(1+v,a); sw(v,a) ;sw(1-v,a); sw(2-v,a);sw(3-v,a)]; %转置
            B = im(i1+1:i1+6,j1+1:j1+6);
            tmp_out(i,j)=(A*B*C);
        end
    end
    out(:,:,ch) = tmp_out;
end
out=im2uint8(out); %将矩阵转换成8位无符号整数
imwrite(out,['cu',imgname]);
figure,imshow(out);
title([int2str(scale),'X']);
