function mask = selectarea(im)

%ask user to select area to protect/remove, save result in mask
imG = rgb2gray(im); 
imshow(imG, []);
set(gcf, 'Position', get(0, 'Screensize'));
message = sprintf('Select the object area, left click and hold to begin drawing. Release mouse click when finished');
uiwait(msgbox(message));
area = imfreehand();
mask = area.createMask();
close;
end