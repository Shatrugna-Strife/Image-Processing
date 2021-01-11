gydata = imread('Coin.jpg');
[x,y,z] = size(gydata);
if z~= 1
    gydata = colortogray(gydata);
end
gydata(:,1:3) = 0;
gydata(:,y-3:y) = 0;
gydata(1:3,:) = 0;
gydata(x-3:x,:) = 0;
gydata = imresize(gydata,[512,512]);
figure;imshow(gydata);title('Black And White');
threshold = otsutest(gydata);
image = thresholding(gydata,threshold);
figure;imshow(image);title('After Thresholding');
image = fillspots(image);
figure;imshow(image);title('After Filling the Black Spots');
image = areamarking(image);
figure;imshow(image);title('Ascending Order of Coin Sizes');

