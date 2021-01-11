str = ["circle.png","ellipsehorizontal.png","ellipsevertical.png","rectangle.png","square.png","triangle.png"];
for i = 1:6
    gydata = imread(char(str(1,i)));
    %[cr, cc] = getcentre(gydata);
    %figure;imshow(gydata);title('Black And White');
    %gydata = getboundary(gydata);
    %gydata(cr-5:cr+5,cc-5:cc+5) = 255;
    figure;imshow(gydata);title('Black And White');
    imshow(getboundary(gydata));
    [X,Y] = distanceversusangle(gydata);
    %[X,Y]
    %figure;plot(X,Y);
    figure(i);
    subplot(2,1,1);
    imshow(gydata);

    subplot(2,1,2);
    %yticks([0 50 100 150 200 250 300 350])
    %yticks(0:50:512);
    
    %xticks(-pi:pi/10:pi);
    %xticklabels({'-pi','pi'})
    plot(X+pi,Y);
    ylim([0 300]);
    xticks(0:pi/4:2*pi);
    xticklabels({'0','\pi/4','\pi/2','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/4','2\pi'})
    title(char(str(1,i)));
    %xt = get(gca, 'XTick');                                 % 'XTick' Values
    %set(gca, 'XTick', xt, 'XTickLabel', xt/10);
    %zoom yon;
    %zoom(0.15);
end
