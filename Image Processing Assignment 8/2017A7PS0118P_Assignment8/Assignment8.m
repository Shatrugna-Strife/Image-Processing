str = ["circle.png","ellipsehorizontal.png","ellipsevertical.png","rectangle.png","square.png","triangle.png"];
% str = ["circle.png"];
%str = ["triangle.png"];
for i = 1:6
    gydata = imread(char(str(1,i)));
    gydata = colortogray(gydata);
    figure;imshow(gydata);title(char(str(1,i)));
    gydata = imresize(imresize(gydata,[60,60]),[600,600], 'box');
    gydata = gydata - 254;
    gydata = gydata*255;
    perimeter = sum(sum(getboundary(gydata)))/255;
    area = sum(sum(gydata))/255;
    compactness = (perimeter*perimeter)/area;
    X = [char(str(1,i)), ' Area - ', num2str(area), ' ', 'Perimeter - ', num2str(perimeter),' ', 'Compactness - ', num2str(compactness)];
    disp(X);
    figure;imshow(gydata);title(char(str(1,i)));
end