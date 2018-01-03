function im = addseams(im, listSeams, rowsize, colsize, d)

imnew = zeros(rowsize, colsize+d);

%for each seam to add
% get all seams path and add pixel value to new larger image
for h=1:d
    
    minPath = listSeams(num2str(h));
    for i=rowsize:-1:1
        col = minPath(1,i);
        
        %calculate average of pixel (with left and right px) for a smoother result
        %special case for 1st and last column
        if(col-1<1)
            average1 = (im(1:i, col,1)+im(1:i, col+1,1))/2;
            average2 = (im(1:i, col,2)+im(1:i, col+1,2))/2;
            average3 = (im(1:i, col,3)+im(1:i, col+1,3))/2;
        elseif(col+1>colsize)
            average1 = (im(1:i, col-1,1)+im(1:i, col,1))/2;
            average2 = (im(1:i, col-1,2)+im(1:i, col,2))/2;
            average3 = (im(1:i, col-1,3)+im(1:i, col,3))/2;
        else
            average1 = (im(1:i, col-1,1)+im(1:i, col,1)+im(1:i, col+1,1))/3;
            average2 = (im(1:i, col-1,2)+im(1:i, col,2)+im(1:i, col+1,2))/3;
            average3 = (im(1:i, col-1,3)+im(1:i, col,3)+im(1:i, col+1,3))/3;
        end
        
        
        imnew(1:i, 1:col-1, 1)=im(1:i, 1:col-1, 1);
        imnew(1:i, col, 1) = average1;
        imnew(1:i, col+1:colsize+1, 1)=im(1:i, col:colsize, 1);
        imnew(1:i, 1:col-1, 2)=im(1:i, 1:col-1, 2);
        imnew(1:i, col, 2) = average2;
        imnew(1:i, col+1:colsize+1, 2)=im(1:i, col:colsize, 2);
        imnew(1:i, 1:col-1, 3)=im(1:i, 1:col-1, 3);
        imnew(1:i, col, 3) = average3;
        imnew(1:i, col+1:colsize+1, 3)=im(1:i, col:colsize, 3);
    end
    colsize = colsize+1;
    im= imnew;
end

end