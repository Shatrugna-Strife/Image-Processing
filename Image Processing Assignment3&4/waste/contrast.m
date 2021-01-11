function output = contrast(input, k)
	[~,~,z] = size(input);
	if z == 3
		input = colortogray(input);
	end
    m = 255/2;
    if k<0
        k = -k*m;
        %disp(k);
        input = double(input);
        output = input*((m-k)/m) + k;
        output = uint8(output);
    elseif k>0
        k = k*m;
        %disp(k);
        input = double(input);
        output = (m/(m-k))*(input - k);
        output = uint8(output);
    else
        output = input;
    end