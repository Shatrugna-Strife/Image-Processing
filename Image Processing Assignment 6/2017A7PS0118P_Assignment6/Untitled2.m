clc; % Clear command window.
clearvars; % Get rid of variables from prior run of this m-file.
fprintf('Running BlobsDemo.m...\n'); % Message sent to command window.
workspace; % Make sure the workspace panel with all the variables is showing.
imtool close all;  % Close all imtool figures.
format long g;
format compact;
captionFontSize = 14;

Image=imread('Coin.jpg'); 

subplot(3, 3, 2);
imshow(Image);
caption = sprintf('Original Image.');
title(caption, 'FontSize', captionFontSize);
I = rgb2gray(Image);

n=imhist(I); %Compute the histogram
N=sum(n); %sum the values of all the histogram values
max=0; %initialize maximum to zero

for i=1:256
    P(i)=n(i)/N; %Computing the probability of each intensity level
end
for T=2:255      %step through all thresholds from 2 to 255
    w0=sum(P(1:T)); %Probability of class 1 (separated by threshold)
    w1=sum(P(T+1:256)); %probability of class2 (separated by threshold)
    u0=dot(0:T-1,P(1:T))/w0; %class mean u0
    u1=dot(T:255,P(T+1:256))/w1; %class mean u1
    sigma=w0*w1*((u1-u0)^2); %compute sigma i.e variance(between class)
    if sigma>max %compare sigma with maximum 
        max=sigma; %update the value of max i.e max=sigma
        threshold=T-1; %desired threshold corresponds to maximum variance of between class
    end
end
bw=imbinarize(I,threshold/255); %Convert to Binary Image
display(threshold)
originalImage = I;
binaryImage=bw;
thresholdValue=threshold;

% Display the grayscale image.
subplot(3, 3, 4);
imshow(originalImage);
% Maximize the figure window.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% Force it to display RIGHT NOW (otherwise it might not display until it's all done, unless you've stopped at a breakpoint.)
drawnow;
caption = sprintf('Original GrayScale Image.');
title(caption, 'FontSize', captionFontSize);
axis image; % Make sure image is not artificially stretched because of screen's aspect ratio.


[pixelCount, grayLevels] = imhist(originalImage);
subplot(3, 3, 5);
bar(pixelCount);
title('Histogram of original image', 'FontSize', captionFontSize);
xlim([0 grayLevels(end)]); % Scale x axis manually.
grid on;

% Show the threshold as a vertical red bar on the histogram.
hold on;
maxYValue = ylim;
line([thresholdValue, thresholdValue], maxYValue, 'Color', 'r');
% Place a text label on the bar chart showing the threshold.
annotationText = sprintf('Thresholded at %d gray levels', thresholdValue);
% For text(), the x and y need to be of the data class "double" so let's cast both to double.
text(double(thresholdValue + 5), double(0.5 * maxYValue(2)), annotationText, 'FontSize', 10, 'Color', [0 .5 0]);
text(double(thresholdValue - 70), double(0.94 * maxYValue(2)), 'Background', 'FontSize', 10, 'Color', [0 0 .5]);
text(double(thresholdValue + 50), double(0.94 * maxYValue(2)), 'Foreground', 'FontSize', 10, 'Color', [0 0 .5]);

% Display the binary image.
subplot(3, 3, 6);
imshow(bw); 
title('Binary Image, obtained by thresholding', 'FontSize', captionFontSize); 


labeledImage = bwlabel(binaryImage, 8);     % Label each blob so we can make measurements of it
blobMeasurements = regionprops(labeledImage, originalImage, 'all');
numberOfBlobs = size(blobMeasurements, 1);


textFontSize = 14;	% Used to control size of "blob number" labels put atop the image.
labelShiftX = -7;	% Used to align the labels in the centers of the coins.
blobECD = zeros(1, numberOfBlobs);
% Print header line in the command window.
fprintf(1,'Blob #      Mean Intensity  Area   Perimeter    Centroid       Diameter\n');
% Loop over all blobs printing their measurements to the command window.

X = zeros(length(numberOfBlobs),4);

for k = 1 : numberOfBlobs           % Loop through all blobs.
	% Find the mean of each blob.  (R2008a has a better way where you can pass the original image
	% directly into regionprops.  The way below works for all versions including earlier versions.)
	thisBlobsPixels = blobMeasurements(k).PixelIdxList;  % Get list of pixels in current blob.
	meanGL = mean(originalImage(thisBlobsPixels)); % Find mean intensity (in original image!)
	meanGL2008a = blobMeasurements(k).MeanIntensity; % Mean again, but only for version >= R2008a
	
	blobArea = blobMeasurements(k).Area;		% Get area.
	blobPerimeter = blobMeasurements(k).Perimeter;		% Get perimeter.
	blobCentroid = blobMeasurements(k).Centroid;		% Get centroid one at a time
	blobECD(k) = sqrt(4 * blobArea / pi);					% Compute ECD - Equivalent Circular Diameter.
    X(k,1)=k;
    X(k,2) = blobMeasurements(k).Area;
    X(k,3)=blobCentroid(1);
    X(k,4)=blobCentroid(2);
	fprintf(1,'#%2d %17.1f %11.1f %8.1f %8.1f %8.1f % 8.1f\n', k, meanGL, blobArea, blobPerimeter, blobCentroid, blobECD(k));
end
disp(X)
cent = sortrows(X,2);

allBlobCentroids = [blobMeasurements.Centroid];
centroidsX = cent(2:6,3);
centroidsY = cent(2:6,4);

subplot(3, 3, 8);
imshow(bw); 
title('Numbered in ascending order.', 'FontSize', captionFontSize); 
subplot(3, 3, 8);
for k = 1 : numberOfBlobs-1           % Loop through all blobs.
	text(centroidsX(k) + labelShiftX, centroidsY(k), num2str(k), 'FontSize', textFontSize, 'FontWeight', 'Bold');
end