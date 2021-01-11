imdata = imread('Image.jpg');

figure;imshow(imdata);title('Original');

gydata = colortogray(imdata);

%A = gydata;

figure;imshow(gydata);title('Grey Shade Image');

bitplane1 = bitplane(imdata);

for i = 1:8
    figure;imshow(bitplane1(:,:,9-i));title(strcat('Bit Plane B',int2str(i)));
end



