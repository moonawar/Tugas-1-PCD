classdef HistogramUtils
    methods (Static)
        function showHistBuiltIn(image)
            figure;
            imhist(image);
        end

        function showHistOwn(image)
            % to be implemented
            figure;
            imshow(image);
        end
    end
end