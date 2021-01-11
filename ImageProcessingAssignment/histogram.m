function freq = histogram(input)
    [x,y,z] = size(input);
    if z == 3
        input = colortogray(input);
    end
    freq = zeros(1,256,'uint64');
    for j = 1:x
        for k = 1:y
            freq(input(j,k)+1) = freq(input(j,k)+1) + 1;
        end
    end
    
    
    