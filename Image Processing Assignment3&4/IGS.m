function IGS(input)
    a=double(input);
    [row,col]=size(a);
    temp = dec2bin(0,8);
    a1 = zeros(row, col, 'uint8');
    code = zeros(row, col, 'uint8');
    for x=1:1:row
        for y=1:1:col-1
            q=dec2bin(a(x,y),8);
            q1=[q(1) q(2) q(3) q(4)];
            a1(x,y)=bin2dec(q1);
            if a(x,y)>=240
                temp2=0;
            else
                temp1=[temp(5) temp(6) temp(7) temp(8)];
                temp2=bin2dec(temp1);
            end
            c=a(x,y+1)+temp2; 
            c1=dec2bin(c,8);
            temp=c1;
            igs=[c1(1) c1(2) c1(3) c1(4)];
            code(x,y) = bin2dec(igs);
        end
    end
    subplot(2,2,1)
    imagesc(a)
    colormap(gray)
    title('Original image')

    subplot(2,2,2)
    imagesc(a1)
    colormap(gray)
    title('Image with lower 4 bits zero')

    subplot(2,2,3)
    imagesc(code)
    colormap(gray)
    title('IGS compressed image')

    imwrite(a1*17,'ImageWithoutLower4Bit.jpg');
    imwrite(code*17,'IGScompressedImage.jpg');