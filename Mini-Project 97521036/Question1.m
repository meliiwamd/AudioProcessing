% #1
% First we should try to read the audio file
% Our audio file is located in current folder

[Voice, FVoice] = audioread('Sample.m4a');
sound(Voice, FVoice);

% Now we should show the histogram of our audio

VoiceLength = length(Voice);
t = linspace(0, VoiceLength / FVoice, VoiceLength);
plot(t, Voice);
title('Audio Histogram');
xlabel('Seconds');
ylabel('Amplitude');



