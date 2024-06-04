%driver to trim all base words
folder = dir(fullfile('.\normalizedWords','*.wav'));
for i = 1:length(folder)
    file = folder(i).name;
    [y, Fs]=audioread(strcat('.\normalizedWords\',file));
    
    audiowrite(strcat('.\trimmedWords\','t',file),y,Fs);
end