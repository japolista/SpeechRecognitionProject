function n = corr
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Fs = 44100;
myrecObj = audiorecorder(44100,16,1); % Fs=44.1k Hz, 16bit, mono channel
disp('Start speaking.') % display a message ‘Start speaking’ in the command window
recordblocking(myrecObj, 2); % record for 2 seconds
disp('End of Recording.');
xin = getaudiodata(myrecObj);
cfrknorm = audioread('.\normalizedWords\cfrknorm.wav');
bucknorm = audioread('.\normalizedWords\bucknorm.wav');
jjknorm = audioread('.\normalizedWords\jjknorm.wav');
sjknorm = audioread('.\normalizedWords\sjknorm.wav');
ucknorm = audioread('.\normalizedWords\ucknorm.wav');

n(:, 1) = xcorr(xin, bucknorm);
n(:, 2) = xcorr(xin, cfrknorm);
n(:, 3) = xcorr(xin, jjknorm);
n(:, 4)= xcorr(xin, sjknorm);
n(:, 5) = xcorr(xin, ucknorm);

maxVector = [ max(n(:,1)), max(n(:,2)), max(n(:,3)), max(n(:,4)), max(n(:,5))];
wordVector = ["Bacon Ultimate Cheeseburger", "Curly Fries", "Jumbo Jack Burger", "Sourdough Jack", "Ultimate Cheeseburger"];

maxR = 0;
position = 0;

for i = 1:5
    if maxVector(i) > maxR
    position = i;
    maxR = maxVector(i);
    end
end

disp(wordVector(:, position));