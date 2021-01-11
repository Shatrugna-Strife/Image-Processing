function output = thresholding(input)
    [x,y,z]=size(input);
    if z == 3
        input = rgb2gray(input);
    end
    double sum;
    sum =0;
    for i = 1:x
        for j = 1:y
            sum = sum + double(input(i,j));
        end
    end
    output = zeros(x,y, 'uint8');
    %output = zeros(x,y);
    %double threshold;
    threshold = sum /(x*y);
    threshold = uint8(threshold);
    for i = 1:x
        for j = 1:y
            if input(i,j) > threshold
                output(i,j) = 255;
            else
                output(i,j) = 0;
            end
        end
    end