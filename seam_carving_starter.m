close all; % closes all figures

% read images and convert to single format
im = im2single(imread('images/rocks.jpg'));
figure('Name','Original Image'), hold off, imagesc(im), axis image, colormap gray

%get new dim from user: n2, m2
n = size(im,1);
m = size(im,2);
X = sprintf('Current width: %d.', m);
Y = sprintf('Current height: %d.', n);
disp(X);
disp(Y);
prompt = 'What is the new dimension horizontally? ';
m2 = input(prompt);
prompt = 'What is the new dimension vertically? ';
n2 = input(prompt);

%ask user to select object to remove or protect
prompt = 'Do you want to remove a specific object (Y/N) ? ';
remove = input(prompt, 's');
    
if remove == 'Y'
    maskR = selectarea(im);
else
    maskR = [];
end

prompt = 'Do you want to protect a specific object (Y/N) ? ';
protect = input(prompt, 's');
    
if protect == 'Y'
    maskP = selectarea(im);
else
    maskP = [];
end

disp('Please wait for computation');

%carving function takes as parameters:
%image, 
%nber of horizontal seams -d, vertical seams -c to be removed/added,
%energy function to use -magniture/-entropy,
%type of carving -remove / - add
%mask if user want to remove -maskR or protect -maskP an object
tic
if m2<m && n2<n
    d = m - m2;
    c = n - n2;
    im = carving(im, d, c, "magnitude", "remove", maskR, maskP);
elseif m2>m && n2>n
    d = m2 - m;
    c = n2 - n;
    im = carving(im, d, c, "magnitude", "add", [], []);
end
toc

figure('Name','Final Carved Image'), hold off, imagesc(im), axis image
