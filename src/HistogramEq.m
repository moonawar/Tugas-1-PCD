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
                % Hitung histogram yang sudah diequalize
                histEq = HistogramEq.equalizeHistogram(freq);
                
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
        
        function HistEq = equalizeHistogram(Hist)
            HistEq = zeros(1, 256);
            sumHist = 0;
            n = sum(Hist); % Total jumlah pixel
            
            % Perataan histogram dengan menambahkan kumulatif frekuensi
            for i = 1:256
                sumHist = sumHist + Hist(i);
                HistEq(i) = floor(255 * sumHist / n); % Normalisasi
            end
        end
    end
end
