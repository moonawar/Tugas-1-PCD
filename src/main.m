imgId = input('Masukkan nama file gambar: ', 's');
basepath = '../images/';
img = imread(strcat(basepath, imgId));

% HistogramViz.ShowHistBuiltIn(img);
HistogramViz.ShowHistOwn(img);
% eq = HistogramEq.Process(img);
% imshow(eq);
% HistogramViz.ShowHistBuiltIn(eq);