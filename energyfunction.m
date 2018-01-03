function [Energy, minE, maxE] = energyfunction(im, type)

%calculate energy of image using different functions
if type == "magnitude"
    [Energy, Direction] = imgradient(im,'sobel');
elseif type == "entropy"
    [Energy, Direction] = imgradient(im,'sobel');
    J = entropyfilt(double(im));
    Energy = Energy + J;
end

%get min and max value of Energy map
[minE, minIndex] = min(Energy(:));
[maxE, maxIndex] = max(Energy(:));

end