function im = plotseams(im, listSeams, rowsize, d, dir)

%get each path of seams
%change pixel value to red in pixel in seam path
for h=1:d
    minPath = listSeams(num2str(h));
    for i=1:rowsize
        col = minPath(1,i);
        im(i,col,1) = 255;
        im(i,col,2) = 0;
        im(i,col,3) = 0;
    end
end

%to have the figure below in correct direction
if dir == 'v'
    im = permute(im, [2 1 3]);
end
    
figure('Name','Plot Seam Image'), hold off, imagesc(im), axis image

end
