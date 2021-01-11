function output = colortogray(input)
    [x,y,z] = size(input);
    R = input(:,:,1);
    G = input(:,:,2);
    B = input(:,:,3);
    output = zeros(x,y,'uint8');
    for i = 1:x
        for j = 1:y
            %output(i,j) = R(i,j)*0.2989+G(i,j)*0.5870+B(i,j)*0.114;
            output(i,j) = input(i,j,1)*0.2989+input(i,j,2)*0.5870+input(i,j,3)*0.114;
        end
    end
    