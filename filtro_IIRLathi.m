clc;clear all;close all;

Fs = 24e3;
Ts = 1/Fs;
fc = 100; %hz
wc = fc*2*pi; 

num = wc*Ts;
den = [1,-exp(-wc*Ts)];

% Calculate the frequency response
f = linspace(0.1, 1000, 1000);
H = freqz(num, den, 2*pi*f/Fs);

magnitude_dB = 20*log10(abs(H));

% Plot the magnitude response using a linear scale
figure;
subplot(2,1,1);
semilogx(f, magnitude_dB);
title('Filter Frequency Response');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
grid on;

% Plot the phase response using semilogx
subplot(2,1,2);
semilogx(f, angle(H));
title('Filter Phase Response');
xlabel('Frequência (Hz)');
ylabel('Fase (radianos)');
grid on;




 