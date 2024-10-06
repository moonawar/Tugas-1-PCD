classdef HistogramEq
    methods (Static)
        function output = Process(image)
            figure;
            output = histeq(image);
        end
    end
end