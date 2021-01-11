imdata = imread('Image.jpg');

gydata = colortogray(imdata);

increasebrightness = brightness(gydata,0.2);
decreasebrightness = brightness(gydata,-0.2);

increasecontrast = contrast(gydata,0.2);
decreasecontrast = contrast(gydata,-0.2);

figure;imhist(gydata);title('Original Histogram');
figure;imhist(equalization(gydata));title('Equaliased Histogram');
figure;imhist(decreasebrightness);title('Decrease Brightness Histogram');
figure;imhist(increasebrightness);title('Increase Brightness Histogram');
figure;imhist(decreasecontrast);title('Decrease Contrast Histogram');
figure;imhist(increasecontrast);title('Increase Contrast Histogram');
figure;imhist(equalization(decreasebrightness));title('Equalized Decrease Brightness Histogram');
figure;imhist(equalization(increasebrightness));title('Equalized Increase Brightness Histogram');
figure;imhist(equalization(decreasecontrast));title('Equalized Decrease Contrast Histogram');
figure;imhist(equalization(increasecontrast));title('Equalized Increase Contrast Histogram');

figure;imshow(gydata);title('Original Image');
figure;imshow(equalization(imdata));title('Equalized Image');
figure;imshow(decreasebrightness);title('Decrease Brightness');
figure;imshow(increasebrightness);title('Increase Brightness');
figure;imshow(decreasecontrast);title('Decrease Contrast');
figure;imshow(increasecontrast);title('Increase Contrast');
figure;imshow(equalization(decreasebrightness));title('Equalized Decrease Brightness');
figure;imshow(equalization(increasebrightness));title('Equalized Increase Brightness');
figure;imshow(equalization(decreasecontrast));title('Equalized Decrease Contrast');
figure;imshow(equalization(increasecontrast));title('Equalized Increase Contrast');