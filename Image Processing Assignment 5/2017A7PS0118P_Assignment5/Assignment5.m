gydata = imread('cameraman.tif');
[~,~,z] = size(gydata);
if z~= 1
    gydata = colortogray(gydata);
end
gydata = imresize(gydata,[512,512]);
figure;imshow(gydata);
figure;imhist(gydata,256);
threshold = otsutest(gydata);
image = thresholding(gydata,threshold);
imwrite(image,'ThresholdedImage.png');
figure;imshow(image);