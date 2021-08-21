% #2
% Read our audio again
[Voice, FVoice] = audioread('Sample.m4a');

% Original histogram
VoiceLength = length(Voice);
t = linspace(0, VoiceLength / FVoice, VoiceLength);

% We should first add noise to our voice 

STD=sqrt(0.00001);
Noise = Voice + STD * randn(VoiceLength, 1);
sound(Noise, FVoice);
pause(25);

% Original signal
subplot(3, 1, 1);
plot(t, Voice);
title('Original audio');
xlabel('Seconds');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, Noise);
title('Noisy voice');
xlabel('Seconds');
ylabel('Amplitude');

% Now remove the added noise
% The filtering it's not working well !

Order = 7;
[b, a] = butter(Order, 3000/FVoice, 'low');
Filtered = filter(b, a, Noise);
sound(Filtered, FVoice);

subplot(3, 1, 3);
plot(t, Filtered);
title('Denoised voice');
xlabel('Seconds');
ylabel('Amplitude');
