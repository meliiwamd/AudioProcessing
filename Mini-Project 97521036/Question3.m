% #3
% Add echo to vour voice
% Read our audio
[Voice, FVoice] = audioread('Sample.m4a');
VoiceLength = length(Voice);
t = linspace(0, VoiceLength / FVoice, VoiceLength);

echoVoice = EchoGenerator(Voice, FVoice, 0.6, 0.8);
sound(echoVoice, FVoice);

t2 = linspace(0, length(echoVoice) / FVoice, length(echoVoice));

% Original signal
subplot(2, 1, 1);
plot(t, Voice);
title('Original audio');
xlabel('Seconds');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t2, echoVoice);
title('Echo voice');
xlabel('Seconds');
ylabel('Amplitude');

% Function which generates echo for our voice
function [output]= EchoGenerator(Signal, FVoice, Delay, Amplitude)
[r, c] = size(Signal);
add = round(Delay * FVoice);
vdm = zeros(r + add, 1);
otp = vdm;  

for i=1:r
    vdm(i + add, 1) = Signal(i, 1) * Amplitude ;
    otp(i) = Signal(i);
end

otp = otp + vdm;
jugg = abs(otp) ;
t = max(jugg, [], 2);
if t > 1
    otp = otp / t;
end
output = otp ;
end
