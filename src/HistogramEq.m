classdef HistogramEq
    methods (Static)
        function result = HistEqMatlab(image)
            result = histeq(image);
        end

        function result = HistEq(image)
            freq = HistogramUtils.CountValueFrequency(image);
            [rows, cols] = size(image);
            n = rows * cols;

            cumulativeSum = zeros(1, 256);
            cumulativeSum(1) = freq(1);
            for i = 2:256
                cumulativeSum(i) = cumulativeSum(i - 1) + freq(i);
            end

            histEq = floor((cumulativeSum / n) * 255);

            result = zeros(rows, cols, class(image));
            for i = 1:rows
                for j = 1:cols
                    result(i, j) = histEq(image(i, j) + 1);
                end
            end
        end
    end
end