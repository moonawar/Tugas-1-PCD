imgId = input('Masukkan nama file gambar: ', 's');
basepath = '../images/';
img = imread(strcat(basepath, imgId));

imgIdRef = input('Masukkan nama file gambar referensi: ', 's');
imgRef = imread(strcat(basepath, imgIdRef));

HistogramSpec.specify(img, imgRef);