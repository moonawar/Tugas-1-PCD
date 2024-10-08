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

        function ShowHist(image, name, ax)
            arguments
                image
                name = ''
                ax = []  % Jika tidak dimasukkan dalam parameter, maka seperti normal
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
                if isempty(ax)
                    figure;
                    ax = gca;  % axis untuk subplot
                end
                
                bar(ax, 0:255, freq, "EdgeColor", "none");
        
                % sumbu x adalah nilai keabuan
                xlabel(ax, strcat("Nilai keabuan (", color, ")"));
                xlim(ax, [0 255]);
        
                % sumbu y adalah frekuensi kemunculan
                ylabel(ax, 'Frekuensi kemunculan');
                ylim(ax, [0, max(freq)]);
        
                title(ax, strcat("Histogram Citra ", name, " (", color, ")"));
            end
        end
    end
end