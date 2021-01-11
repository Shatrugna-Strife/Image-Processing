function output = thresholding(input,t)
    [x,y,z] = size(input);
    if z == 3
        input = colortogray(input);
    end
    %output = zeros(x,y,'uint8');
    for i = 1:x
        for j = 1:y
            if input(i,j)>t
                input(i,j) = 255;
            else
                input(i,j) = 0;
            end
        end
    end
    output = input;