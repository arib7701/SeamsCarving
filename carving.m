function im = carving(im, d, c, typeEnergy, action, maskR, maskP)

originalim = im;
%get gray image and calculate energy using energy function
imGray = rgb2gray(im); 
[Energy, minE, maxE] = energyfunction(imGray, typeEnergy);

%apply mask of area to Energy map - set up ROI area to minimal Energy
if ~isempty(maskR)
    roiEnergy = Energy.*maskR;
    tempEnergy = Energy - roiEnergy;
    maskR = maskR.*minE;
    Energy = tempEnergy + maskR;
end

%apply mask of area to Energy map - set up ROI area to maximal Energy
if ~isempty(maskP)
    roiEnergy = Energy.*maskP;
    tempEnergy = Energy - roiEnergy;
    maskP = maskP.*maxE;
    Energy = tempEnergy + maskP;
end

figure('Name','Energy Map Image'), hold off, imagesc(Energy), axis image, colormap gray

%To contains all seams path
listSeamsHor = containers.Map();
listSeamsVer = containers.Map();

%remove d seams horizontally and get each path for vertical seams
for k=1:d
    rowsize = size(im,1);
    colsize = size(im,2);
    [minColIndex, Sij] = computePaths(Energy, rowsize, colsize);
    minPath = backtrackMinPath(minColIndex, Sij, rowsize, colsize);
    listSeamsHor(num2str(k))= minPath;
    [im, Energy] = removeseams(im, minPath, rowsize, colsize, Energy);
end

plotseams(originalim, listSeamsHor, rowsize, d, 'h');

% add d seams horizontally, recompute Energy map on bigger image
if action == "add"
    rowsize = size(originalim,1);
    colsize = size(originalim,2);
    im = addseams(originalim, listSeamsHor, rowsize, colsize, d);
    imGray = rgb2gray(im);
    [Energy, minE, maxE] = energyfunction(imGray, typeEnergy);
end

figure('Name','Horizontal carved Image'), hold off, imagesc(im), axis image

%transpose image and Energy map
im = permute(im, [2 1 3]);
Energy = permute(Energy, [2 1 3]);

horizim = im;

% remove c seams vertically, and get each path for horizontal seams
for k=1:c
    rowsize = size(im,1);
    colsize = size(im,2);
    [minColIndex, Sij] = computePaths(Energy, rowsize, colsize);
    minPath = backtrackMinPath(minColIndex, Sij, rowsize, colsize);
    listSeamsVer(num2str(k))= minPath;
    [im, Energy] = removeseams(im, minPath, rowsize, colsize, Energy);
end

plotseams(horizim, listSeamsVer, rowsize, c, 'v');

% add c seams vertically
if action == "add"
    rowsize = size(horizim,1);
    colsize = size(horizim,2);
    im = addseams(horizim, listSeamsVer, rowsize, colsize, c);
end

%transpose back
im = permute(im, [2 1 3]);

end
