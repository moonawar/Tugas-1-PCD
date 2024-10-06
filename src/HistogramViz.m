classdef HistogramViz
    properties (Constant)
        CHANNEL = {'Red', 'Green', 'Blue'};
    end

    methods (Static)
        function ShowHistBuiltIn(image)
            figure;
            imhist(image);
        end

        function ShowHistOwn(image)
            channels = size(image, 3);
            for i = 1:channels
                % Hitung frekuensi kemunculan tiap nilai keabuan pada citra
                freq = HistogramViz.countValueFrequency(image(:, :, i));

                % Plot garis histogram
                if (channels > 1)
                    color = HistogramViz.CHANNEL(i);
                else
                    color = 'Gray';
                end
                
                % Gambar histogram
                figure;
                set(gcf, 'Name', strcat("Histogram Citra (", color, ")"));
                bar(0:255, freq, "EdgeColor", "none");


                xlabel(strcat("Nilai keabuan (", color, ")"));
                xlim([0 255]);

                ylabel('Frekuensi kemunculan');
                ylim([0 max(freq)]);

                title(strcat("Histogram Citra (", color, ")"));
            end
        end
    end

    methods (Static, Access = private) 
        % Menghitung frekuensi kemunculan tiap nilai keabuan pada citra
        function counts = countValueFrequency(image)
            numOfGrayLevel = 256; % 256 derajat keabuan
            counts = zeros(1, numOfGrayLevel); % inisialisasi array frekuensi kemunculan nilai keabuan dengan 0

            [rows, cols] = size(image);

            % Untuk setiap pixel, inkremen frekuensi kemunculan nilai keabuan yang muncul pada pixel tersebut
            for i = 1:rows
                for j = 1:cols
                    value = image(i, j);
                    counts(value + 1) = counts(value + 1) + 1;
                end
            end
        end
    end
end