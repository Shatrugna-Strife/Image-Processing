function output = equilization(input)
    [x,y,z] = size(input);
    if z == 3
        input = colortogray(input);
    end
    freq = histogram(input);
    for i = 2:256
        freq(i) = freq(i-1)+freq(i);
    end
    tot = x*y;
    newscale = zeros(1,256, 'uint8');
    for i = 1:256
        newscale(i) = (freq(i)/tot)*255;
    end
    output = zeros(x, y, 'uint8');
    for i = 1:x
        for j = 1:y
            output(i,j) = newscale(input(i,j)+1);
        end
    end
    
        
    
    