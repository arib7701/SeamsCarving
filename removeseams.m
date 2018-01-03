function [im, Energy] = removeseams(im, minPath, rowsize, colsize, Energy)

imnew = [rowsize, colsize-1];
energynew = [rowsize, colsize-1];

% remove pixel on seam path, update energy matrix as well
for i=rowsize:-1:1
    col = minPath(1,i);
    imnew(1:i, 1:col-1, 1)=im(1:i, 1:col-1, 1);
    imnew(1:i, col:colsize-1, 1)=im(1:i, col+1:colsize, 1);
    imnew(1:i, 1:col-1, 2)=im(1:i, 1:col-1, 2);
    imnew(1:i, col:colsize-1, 2)=im(1:i, col+1:colsize, 2);
    imnew(1:i, 1:col-1, 3)=im(1:i, 1:col-1, 3);
    imnew(1:i, col:colsize-1, 3)=im(1:i, col+1:colsize, 3);
    
    energynew(1:i, 1:col-1) = Energy(1:i, 1:col-1);
    energynew(1:i, col:colsize-1) = Energy(1:i, col+1:colsize);
end

im= imnew;
Energy = energynew;

end
