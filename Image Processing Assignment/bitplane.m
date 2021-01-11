function output = bitplane(input)
    [x,y,z] = size(input);
    if z == 3
        input = colortogray(input);
    end
    output = zeros(x,y,8,'uint8');
    for i = 1:8
        output(:,:,i) = bitget(input, i)*255;
    end