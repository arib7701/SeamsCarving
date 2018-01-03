function minPath = backtrackMinPath(minColIndex, Sij, rowsize, colsize)

%each colIndex where the seam goes through is stored in vector
minPath = [1, rowsize];

minPath(1,rowsize) = minColIndex;

%using backtrack to recover min path of seam
%special case for 1st and last column
k = minColIndex;
    for i=rowsize-1:-1:1
        if(k ==1)
            if(Sij(i,k+1) < Sij(i,k))
                k = k+1;
            end
        elseif(k==colsize)
            if(Sij(i,k-1)<Sij(i,k))
                k = k-1;
            end
        else
            if(Sij(i,k-1)<Sij(i,k) && Sij(i,k-1)<Sij(i,k+1))
                k = k-1;
            elseif(Sij(i,k+1)<Sij(i,k) && Sij(i,k+1)<Sij(i,k-1))
                k= k+1;
            end
        end
        minPath(1,i)=k;
    end
end
