function xin = recording(filename)
%   XIN = RECORDING
%   Output: Vector xin
%   Input: none
%   Description: Recording allows for the user to record words 
Fs = 44100;
myrecObj = audiorecorder(44100,16,1); % Fs=44.1k Hz, 16bit, mono channel
disp('Start speaking.') % display a message ‘Start speaking’ in the command window
recordblocking(myrecObj, 2); % record for 2 seconds
disp('End of Recording.');
xin = getaudiodata(myrecObj);% save the recorded signal to variable xin
% play(xin); % play the recorded audio signal object
play(myrecObj); % play the recorded audio signal object
audiowrite(filename,xin,Fs); % create a .wav file to save the recorded signal xin.
[y, Fs]=audioread(filename); % read a .wav audio file and save to variable y.
sound(y,Fs); % play the signal y with correct Fs (sampling rate)
end

