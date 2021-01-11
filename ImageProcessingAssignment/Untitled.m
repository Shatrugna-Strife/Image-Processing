%p = imread('sample.png');
%p = imread('sample1.jpg');
%para = 20;
%pd = imresize(p, 1/para);
%p2 = imresize(pd, para);
%p2 = thresholding(p);
p2 = colortogray(p);
%frequency = histogram(p2);
%stem(0:255,frequency);
%frequency
%p2 = equilization(p2);
p2 = imcomplement(p2);
imwrite(p2, 'sample_black_complement.png');
imshow(p2)
%p2 = colortogray(p);
%imhist(p2)
%imshow(double(p));
%p2 = imresize(p2, 0.5);
%subplot(121)
%imshow(imcomplement(p2));
%subplot(122)
%imshow(p2)