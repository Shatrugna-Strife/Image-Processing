function output = getboundary(input)
    [x,y,~] = size(input);
    output = zeros(x,y,'uint8');
    %mask = [0 255 0; 255 255 255; 0 255 0];
    for i = 2:x
        for j = 2:y
            if input(i,j) == 255
                if input(i+1,j) == 0
                    output(i,j) = 255;
                    continue
                end
                if input(i-1,j) == 0
                    output(i,j) = 255;
                    continue
                end
                if input(i,j+1) == 0
                    output(i,j) = 255;
                    continue
                end
                if input(i,j-1) == 0
                    output(i,j) = 255;
                    continue
                end
                output(i,j) = 0;
            end
        end
    end