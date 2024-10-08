imgId = input('Masukkan nama file gambar: ', 's');
basepath = '../images/';
img = imread(strcat(basepath, imgId));

% Image fix
a = 1.2;
b = 50;
c = 2;
gamma = 0.5;

ImageFix.runAll(img, a, b, c, gamma)