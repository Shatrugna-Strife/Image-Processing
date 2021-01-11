function output = brightness(input,k)
	[~,~,z] = size(input);
	if z == 3
		input = colortogray(input);
	end
    output = input + 255*k;