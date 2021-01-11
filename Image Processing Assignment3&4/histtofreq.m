function output = histtofreq(input)
    [x,y,z] = size(input);
	if z == 3
		input = colortogray(input);
	end
    output = zeros(1,256,'uint64');
    for i = 1:x
        for j = 1:y
            output(input(i,j) + 1) = output(input(i,j) + 1) + 1;
        end
    end