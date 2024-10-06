imgId = input('Masukkan nama file gambar: ', 's');
basepath = '../images/';
img = imread(strcat(basepath, imgId));

HistogramUtils.showHistBuiltIn(img);
HistogramUtils.showHistOwn(img);