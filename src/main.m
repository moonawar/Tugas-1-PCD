imgId = input('Masukkan nama file gambar: ', 's');
basepath = '../images/';
img = imread(strcat(basepath, imgId));

% Show Histogram
% HistogramViz.ShowHistMatlab(img);
% HistogramViz.ShowHist(img, 'Manual');

% Histogram Equalization
HistogramViz.ShowHist(img, 'Input');
result = HistogramEq.HistEq(img);
figure;
imshow(result);
title('Citra Hasil Perataan Histogram');
HistogramViz.ShowHist(result, 'Output');