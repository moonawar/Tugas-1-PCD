classdef HistogramViz
    properties (Constant)
        CHANNEL = {'Red', 'Green', 'Blue'};
    end

    methods (Static)
        function ShowHistMatlab(image)
            channels = size(image, 3);
            for i = 1:channels
                % Untuk keperluan visualisasi, spesifikasikan channel warna yang sedang diolah
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
                % Untuk keperluan visualisasi, spesifikasikan channel warna yang sedang diolah
                if (channels > 1)
                    color = HistogramViz.CHANNEL(i);
                else
                    color = 'Gray';
                end

                % Hitung frekuensi kemunculan tiap nilai keabuan pada citra
                freq = HistogramUtils.CountValueFrequency(image(:, :, i));

                % Gambar histogram (kemunculan nilai keabuan)
                figure;
                set(gcf, 'Name', strcat("Histogram Citra ", name, " (", color, ")"));
                bar(0:255, freq, "EdgeColor", "none");

                % sumbu x adalah nilai keabuan
                xlabel(strcat("Nilai keabuan (", color, ")"));
                xlim([0 255]);

                % sumbu y adalah frekuensi kemunculan
                ylabel('Frekuensi kemunculan');
                ylim([0, max(freq)]);

                title(strcat("Histogram Citra ", name, " (", color, ")"));
            end
        end
    end
end