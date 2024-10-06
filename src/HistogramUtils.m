classdef HistogramUtils
    methods (Static) 
        % Menghitung frekuensi kemunculan tiap nilai keabuan pada citra
        function counts = CountValueFrequency(image)
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