function output = colortogray(input)
    [x,y,z] = size(input);
    if z == 1
        output = input;
        return;
    end
    output = zeros(x,y,'uint8');
    for i = 1:x
        for j = 1:y
            output(i,j) = input(i,j,1)*0.2989+input(i,j,2)*0.5870+input(i,j,3)*0.114;
        end
    end
    