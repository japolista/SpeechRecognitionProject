function n = corr
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Fs = 44100;
myrecObj = audiorecorder(44100,16,1); % Fs=44.1k Hz, 16bit, mono channel
disp('Start speaking.') % display a message ‘Start speaking’ in the command window
recordblocking(myrecObj, 2); % record for 2 seconds
disp('End of Recording.');
xin = trimWord(getaudiodata(myrecObj));
cfrknorm = audioread('cfrknorm.wav');
bucknorm = audioread('bucknorm.wav');
jjknorm = audioread('jjknorm.wav');
sjknorm = audioread('sjknorm.wav');
ucknorm = audioread('ucknorm.wav');

n(:, 1) = xcorr(xin, bucknorm);
n(:, 2) = xcorr(xin, cfrknorm);
n(:, 3) = xcorr(xin, jjknorm);
n(:, 4)= xcorr(xin, sjknorm);
n(:, 5) = xcorr(xin, ucknorm);

end