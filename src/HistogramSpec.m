classdef HistogramSpec
    methods (Static)
        % Fungsi untuk menghitung transformasi balik (inverse histogram)
        function InvHist = computeInverseHistogram(HistEq, SpecEq)
            InvHist = zeros(1, 256);
            
            for i = 1:256
                minval = abs(HistEq(i) - SpecEq(1));
                minj = 1;
                
                for j = 2:256
                    if abs(HistEq(i) - SpecEq(j)) < minval
                        minval = abs(HistEq(i) - SpecEq(j));
                        minj = j;
                    end
                end
                
                InvHist(i) = minj - 1; % Simpan nilai intensitas transformasi balik
            end
        end
        
        % Fungsi utama untuk melakukan histogram specification
        function outputImage = matchHistogram(inputImage, referenceImage)
            [N, M, C] = size(inputImage); % Ukuran citra input dan jumlah kanal warna
            
            outputImage = zeros(N, M, C, 'uint8');
            
            for c = 1:C % Iterasi untuk setiap kanal warna (R, G, B)
                % Hitung histogram citra input dan referensi untuk kanal warna c
                inputHist = HistogramUtils.CountValueFrequency(inputImage(:, :, c));
                referenceHist = HistogramUtils.CountValueFrequency(referenceImage(:, :, c));
                
                % Lakukan perataan histogram citra input dan referensi
                inputHistEq = HistogramEq.equalizeHistogram(inputHist);
                referenceHistEq = HistogramEq.equalizeHistogram(referenceHist);
                
                % Hitung transformasi balik (inverse histogram)
                InvHist = HistogramSpec.computeInverseHistogram(inputHistEq, referenceHistEq);
                
                % Transformasikan citra input menggunakan inverse histogram
                for i = 1:N
                    for j = 1:M
                        outputImage(i, j, c) = InvHist(inputImage(i, j, c) + 1);
                    end
                end
            end
        end
        
        % Fungsi untuk menampilkan histogram citra menggunakan HistogramViz
        function showHistogram(image, titleStr, subplotPos)
            ax = subplot(2, 3, subplotPos);
            HistogramViz.ShowHist(image, titleStr, ax);
            title(ax, ['Histogram ' titleStr]);
        end
        
        % Fungsi untuk menampilkan citra
        function showImage(image, titleStr, subplotPos)
            ax = subplot(2, 3, subplotPos);
            imshow(image);
            title(ax, titleStr);
        end
        
        % Fungsi untuk menampilkan semua hasil
        function displayResults(inputImage, referenceImage, outputImage)
            figure('Position', [100, 100, 1500, 800]);
            sgtitle('Histogram Specification Results');
            
            % Tampilkan citra input
            HistogramSpec.showImage(inputImage, 'Citra Input', 1);
            % Tampilkan histogram citra input
            HistogramSpec.showHistogram(inputImage, 'Citra Input', 4);
            
            % Tampilkan citra referensi
            HistogramSpec.showImage(referenceImage, 'Citra Referensi', 2);
            % Tampilkan histogram citra referensi
            HistogramSpec.showHistogram(referenceImage, 'Citra Referensi', 5);
            
            % Tampilkan citra hasil histogram specification
            HistogramSpec.showImage(outputImage, 'Citra Hasil', 3);
            % Tampilkan histogram citra hasil
            HistogramSpec.showHistogram(outputImage, 'Citra Hasil', 6);
        end
        
        % Fungsi utama untuk memproses dan menampilkan hasil
        function specify(inputImage, referenceImage)
            % Melakukan histogram specification
            outputImage = HistogramSpec.matchHistogram(inputImage, referenceImage);
            
            % Tampilkan hasil
            HistogramSpec.displayResults(inputImage, referenceImage, outputImage);
        end
    end
end
