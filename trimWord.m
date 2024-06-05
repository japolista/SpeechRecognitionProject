function [y, Fs] = trimWord(filename)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[y, Fs]=audioread(filename);
%subplot(2,1,1)
%plot(y)
pad = 0.1*Fs;
thrshld = median(abs(y(abs(y)>0.4)));
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