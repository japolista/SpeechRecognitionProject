function n = corr()
%n = corr()
%   Detailed explanation goes here
Fs = 44100;
myrecObj = audiorecorder(44100,16,1); % Fs=44.1k Hz, 16bit, mono channel
disp('Start speaking.') % display a message ‘Start speaking’ in the command window
recordblocking(myrecObj, 2); % record for 2 seconds
disp('End of Recording.');
xin = getaudiodata(myrecObj);

%Read in Karen's template words
cfrknorm = audioread('.\trimmedWords\tcfrknorm.wav');
bucknorm = audioread('.\trimmedWords\tbucknorm.wav');
jjknorm = audioread('.\trimmedWords\tjjknorm.wav');
sjknorm = audioread('.\trimmedWords\tsjknorm.wav');
ucknorm = audioread('.\trimmedWords\tucknorm.wav');

%Read in Satya's template words
cfrsnorm = audioread('.\trimmedWords\tcfrsnorm.wav');
bucsnorm = audioread('.\trimmedWords\tbucsnorm.wav');
jjsnorm = audioread('.\trimmedWords\tjjsnorm.wav');
sjsnorm = audioread('.\trimmedWords\tsjsnorm.wav');
ucsnorm = audioread('.\trimmedWords\tucsnorm.wav');

%Concatenate the template words
cfr = cat(1, cfrknorm, cfrsnorm);
buc = cat(1, bucknorm, bucsnorm);
jj = cat(1, jjknorm, jjsnorm);
sj = cat(1, sjsnorm, sjknorm);
uc = cat(1, ucknorm, ucsnorm);

%Perform the cross-sorrelation on the concatenated templates
corrbuc = xcorr(xin, buc);
corrcfr = xcorr(xin, cfr);
corrjj = xcorr(xin, jj);
corrsj= xcorr(xin, sj);
corruc = xcorr(xin, uc);

%Store the maximum values from the cross-correlations of each word
maxVector = [ max(corrbuc), max(corrcfr), max(corrjj), max(corrsj), max(corruc)];
%Vector of possible words to be selected
wordVector = ["Bacon Ultimate Cheeseburger", "Curly Fries", "Jumbo Jack Burger", "Sourdough Jack", "Ultimate Cheeseburger"];
%Value of maximum in v and index of same in i
[v, i] = max(maxVector);
%output = wordVector at i
n = wordVector(i);
