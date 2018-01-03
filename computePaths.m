function [minColIndex, Sij] = computePaths(Energy, rowsize, colsize)

Sij = [rowsize, colsize];

%initialize for row 1
for j=1:colsize
    Sij(1,j) = Energy(1,j);
end

%bottom to top calculation for each row of Seam Path
for i=2:rowsize
    for j=1:colsize
        if j==1
            Sij(i,j) = Energy(i,j) + min([Sij(i-1, j), Sij(i-1, j+1)]);
        elseif j==colsize
            Sij(i,j) = Energy(i,j) + min([Sij(i-1, j-1), Sij(i-1, j)]);
        else
            Sij(i,j) = Energy(i,j) + min([Sij(i-1, j-1), Sij(i-1, j), Sij(i-1, j+1)]);
        end
    end
end

%in last row, find min value
minS = 2000;
minColIndex = 0;
for j=1:colsize
    if(Sij(rowsize, j) < minS)
        minS = Sij(rowsize,j);
        minColIndex = j;
    end
end

end