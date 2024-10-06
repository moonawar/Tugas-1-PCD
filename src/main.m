imgId = input('Masukkan nama file gambar: ', 's');
basepath = '../images/';
img = imread(strcat(basepath, imgId));

result = HistogramEq.HistEqMatlab(img);
figure;
imshow(result);
title('Citra Hasil Histogram Equalization dengan HistEq Matlab');
HistogramViz.ShowHist(result, 'Histeq Matlab');

result2 = HistogramEq.HistEq(img);
figure;
imshow(result2);
title('Citra Hasil Histogram Equalization dengan Manual');
HistogramViz.ShowHist(result2, 'Histeq Manual');