classdef HistogramEq
    methods (Static)
        function result = HistEqMatlab(image)
            result = histeq(image);
        end
        function result = HistEq(image)
            [rows, cols, channels] = size(image);
            result = zeros(size(image), class(image));
            for ch = 1:channels
                % Kalkulasi frekuensi kemunculan tiap nilai keabuan pada channel warna
                freq = HistogramUtils.CountValueFrequency(image(:,:,ch));
                n = rows * cols;
                % Hitung cumulative sum pada masing-masing nilai keabuan
                cumulativeSum = zeros(1, 256);
                cumulativeSum(1) = freq(1);
                for i = 2:256
                    cumulativeSum(i) = cumulativeSum(i - 1) + freq(i);
                end
                
                % Normalisasi nilai keabuan (perataan histogram)
                histEq = floor((cumulativeSum / n) * 255);
                % Aplikasikan nilai keabuan hasil normalisasi ke citra hasil
                chResult = zeros(rows, cols, class(image));
                for i = 1:rows
                    for j = 1:cols
                        % Clamp nilai keabuan hasil normalisasi agar tidak melebihi 255
                        chResult(i, j) = histEq(min(image(i, j, ch) + 1, 256));
                    end
                end
                result(:, :, ch) = chResult;
            end
        end
    end
end