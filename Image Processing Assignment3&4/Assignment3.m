imdata = imread('Image.jpg');
gydata = colortogray(imdata);
B = reshape(gydata,1,[]);
ent = entropyhist(histtofreq(gydata));
disp(['Entropy of the image is:                     ',num2str(ent)]);
IGS(gydata);
