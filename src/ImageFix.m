classdef ImageFix
    methods (Static)
        % Fungsi untuk menampilkan histogram input, citra hasil, dan histogram hasil
        function showInputAndOutput(image, processedImage, titleStr)
            figure('Position', [300, 300, 1200, 500]);
            sgtitle(titleStr);

            % Histogram input
            ax1 = subplot(2, 2, 1);
            HistogramViz.ShowHist(image, 'Input', ax1);
            title(ax1, 'Histogram Citra Input');
            
            % Citra input
            ax2 = subplot(2, 2, 2);
            imshow(image);
            title(ax2, 'Citra Input');

            % Histogram citra yang diperbaiki
            ax3 = subplot(2, 2, 3);
            HistogramViz.ShowHist(processedImage, 'Perbaikan', ax3);
            title(ax3, 'Histogram citra yang diperbaiki');    

            % Citra yang diperbaiki
            ax4 = subplot(2, 2, 4);
            imshow(processedImage);
            title(ax4, 'Citra yang diperbaiki');
        end
        
        %%%%% FUNGSI FUNGSI UNTUK MEMPROSES MEMPERBAIKI CITRA
        % Fungsi untuk image brightening (s = r + b)
        function brightenedImage = brightenImage(image, a, b)
            brightenedImage = a * double(image) + b;
            brightenedImage = uint8(brightenedImage);
        end
        
        % Fungsi untuk citra negatif
        function negativeImage = negative(image)
            negativeImage = 255 - image; % Operasi citra negatif
        end
        
        % Fungsi untuk membalikkan citra negatif (mengembalikan citra asli)
        function invertedNegative = invertNegative(image)
            negativeImage = ImageFix.negative(image);
            invertedNegative = ImageFix.negative(negativeImage); % Membalikkan citra negatif
        end
        
        % Fungsi untuk transformasi log
        function logImage = logTransform(image, c)
            r = double(image) / 255;
            logImage = c * log(1 + r);
            logImage = uint8(255 * logImage / max(logImage(:)));
        end
        
        % Fungsi untuk transformasi pangkat (s = c * r^gamma)
        function powerImage = powerTransform(image, c, gamma)
            r = double(image) / 255;
            powerImage = c * (r.^gamma);
            powerImage = uint8(255 * powerImage / max(powerImage(:)));
        end
        
        % Fungsi untuk peregangan kontras (Contrast Stretching)
        function stretchedImage = contrastStretch(image)
            rmin = double(min(image(:)));
            rmax = double(max(image(:)));
            stretchedImage = uint8(255 * (double(image) - rmin) / (rmax - rmin));
        end
        

        %%%%% FUNGSI FUNGSI UNTUK MENAMPILKAN SALAH SATU PERBAIKAN CITRA
        % Fungsi untuk menampilkan hasil brightening
        function displayBrightenedImage(image, a, b)
            brightenedImage = ImageFix.brightenImage(image, a, b);
            ImageFix.showInputAndOutput(image, brightenedImage, 'Image Brightening');
        end

        % Fungsi untuk menampilkan hasil citra negatif
        function displayNegativeImage(image)
            negativeImage = ImageFix.negative(image);
            ImageFix.showInputAndOutput(image, negativeImage, 'Citra Negatif');
        end

        % Fungsi untuk menampilkan hasil membalikkan citra negatif
        function displayInvertedNegativeImage(image)
            invertedImage = ImageFix.invertNegative(image);
            ImageFix.showInputAndOutput(image, invertedImage, 'Balikan Citra Negatif');
        end
        
        % Fungsi untuk menampilkan hasil transformasi log
        function displayLogTransformImage(image, c)
            logImage = ImageFix.logTransform(image, c);
            ImageFix.showInputAndOutput(image, logImage, 'Transformasi Log');
        end
        
        % Fungsi untuk menampilkan hasil transformasi pangkat
        function displayPowerTransformImage(image, c, gamma)
            powerImage = ImageFix.powerTransform(image, c, gamma);
            ImageFix.showInputAndOutput(image, powerImage, 'Transformasi Pangkat');
        end
        
        % Fungsi untuk menampilkan hasil peregangan kontras
        function displayContrastStretchImage(image)
            stretchedImage = ImageFix.contrastStretch(image);
            ImageFix.showInputAndOutput(image, stretchedImage, 'Peregangan Kontras');
        end

        % Fungsi untuk menjalankan semua perbaikan citra
        function runAll(image, a, b, c, gamma)
            % Brightening
            ImageFix.displayBrightenedImage(image, a, b);
            
            % Citra negatif
            ImageFix.displayNegativeImage(image);
            
            % Membalikkan citra negatif
            ImageFix.displayInvertedNegativeImage(image);
            
            % Transformasi log
            ImageFix.displayLogTransformImage(image, c);
            
            % Transformasi pangkat
            ImageFix.displayPowerTransformImage(image, c, gamma);
            
            % Peregangan kontras
            ImageFix.displayContrastStretchImage(image);
        end
    end
end