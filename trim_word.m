function [y, Fs] = trim_word(filename)
%%%%%%deprecated%%%%%%
%[y, Fs] = trim_word(filename)
%Read the selected word and trim the ends to close around a tenth
%of a second of where the word(s) start and end
[y, Fs]=audioread(filename);
%subplot(2,1,1)
%plot(y)
pad = 0.1*Fs;
thrshld = median(abs(y(abs(y)>0.3)))
%head trim
for i = 1:length(y)
    if abs(y(i)) > thrshld
        y = y(i-pad:end);
        break;
    end
end
%tail trim
for i = length(y):-1:1
    if abs(y(i)) > thrshld
        y = y(1:i+pad);
        break;
    end
end
%subplot(2,1,2)
%plot(y)
end