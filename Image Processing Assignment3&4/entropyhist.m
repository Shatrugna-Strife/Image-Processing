function output = entropyhist(input)
    %[~,y,z] = size(input);
    %if z == 3
    %    input = colortogray(input);
    %end
    %if y==1||z==1
    %    input = histtofreq(input);
    %end
    %output = zeros(x,y,8,'uint8');
    total = uint64(0); 
    for i = 1:256
        total = total + input(i);
    end
    input = double(input);
    for i = 1:256
        input(i) = input(i)/double(total);
    end
    output = double(0);
    for i = 1:256
        if input(i)~=0
            output = output - input(i)*log2(input(i));
        end
    end