classdef HistogramViz
    properties (Constant)
        CHANNEL = {'Red', 'Green', 'Blue'};
    end

    methods (Static)
        function ShowHistMatlab(image)
            for i = 1:size(image, 3)

                if (channels > 1)
                    color = HistogramViz.CHANNEL(i);
                else
                    color = 'Gray';
                end

                % Gambar histogram built-in
                figure;
                set(gcf, 'Name', strcat("Histogram Citra Matlab (", color, ")"));
                imhist(image(:, :, i));

                title(strcat("Histogram Citra ImHist (", color, ")"));
            end
        end

        function ShowHist(image, name)
            arguments
                image
                name = '';
            end

            channels = size(image, 3);
            for i = 1:channels
                % Hitung frekuensi kemunculan tiap nilai keabuan pada citra
                freq = HistogramUtils.CountValueFrequency(image(:, :, i));

                if (channels > 1)
                    color = HistogramViz.CHANNEL(i);
                else
                    color = 'Gray';
                end

                % Gambar histogram
                figure;
                set(gcf, 'Name', strcat("Histogram Citra ", name, " (", color, ")"));
                bar(0:255, freq, "EdgeColor", "none");

                xlabel(strcat("Nilai keabuan (", color, ")"));
                xlim([0 255]);

                ylabel('Frekuensi kemunculan');
                ylim([0 max(freq)]);

                title(strcat("Histogram Citra ", name, " (", color, ")"));
            end
        end
    end
end