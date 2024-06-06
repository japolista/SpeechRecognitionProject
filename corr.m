function n = corr
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Fs = 44100;
myrecObj = audiorecorder(44100,16,1); % Fs=44.1k Hz, 16bit, mono channel
disp('Start speaking.') % display a message ‘Start speaking’ in the command window
recordblocking(myrecObj, 2); % record for 2 seconds
disp('End of Recording.');
xin = getaudiodata(myrecObj);

cfrknorm = audioread('.\trimmedWords\tcfrknorm.wav');
bucknorm = audioread('.\trimmedWords\tbucknorm.wav');
jjknorm = audioread('.\trimmedWords\tjjknorm.wav');
sjknorm = audioread('.\trimmedWords\tsjknorm.wav');
ucknorm = audioread('.\trimmedWords\tucknorm.wav');

cfrsnorm = audioread('.\trimmedWords\tcfrsnorm.wav');
bucsnorm = audioread('.\trimmedWords\tbucsnorm.wav');
jjsnorm = audioread('.\trimmedWords\tjjsnorm.wav');
sjsnorm = audioread('.\trimmedWords\tsjsnorm.wav');
ucsnorm = audioread('.\trimmedWords\tucsnorm.wav');

cfr = cat(1, cfrknorm, cfrsnorm);
buc = cat(1, bucknorm, bucsnorm);
jj = cat(1, jjknorm, jjsnorm);
sj = cat(1, sjsnorm, sjknorm);
uc = cat(1, ucknorm, ucsnorm);

corrbuc = xcorr(xin, buc);
corrcfr = xcorr(xin, cfr);
corrjj = xcorr(xin, jj);
corrsj= xcorr(xin, sj);
corruc = xcorr(xin, uc);

maxVector = [ max(corrbuc), max(corrcfr), max(corrjj), max(corrsj), max(corruc)];
wordVector = ["Bacon Ultimate Cheeseburger", "Curly Fries", "Jumbo Jack Burger", "Sourdough Jack", "Ultimate Cheeseburger"];

maxR = 0;
position = 0;

for i = 1:5
    if maxVector(i) > maxR
    position = i;
    maxR = maxVector(i);
    end
end

n = wordVector(:, position);
