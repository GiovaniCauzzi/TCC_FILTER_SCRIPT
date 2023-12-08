clc;clear all;close all;

Fs = 24e3;
Ts = 1/Fs;
fc = 100; %hz
wc = fc*2*pi; 

num = wc*Ts;
den = [1,-exp(-wc*Ts)];

f = linspace(0.1, 1000, 1000);
H = freqz(num, den, 2*pi*f/Fs);

magnitude_dB = 20*log10(abs(H));


figure;
semilogx(f, magnitude_dB);
title('Resposta em frequência do filtro digital - Fc = 100Hz');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
grid on;


% figure;
% subplot(2,1,1);
% semilogx(f, magnitude_dB);
% title('Resposta em frequência do filtro digital - Fc = 100Hz');
% xlabel('Frequência (Hz)');
% ylabel('Magnitude (dB)');
% grid on;
% 
% subplot(2,1,2);
% semilogx(f, angle(H));
% title('Resposta em fase do filtro digital');
% xlabel('Frequência (Hz)');
% ylabel('Fase (radianos)');
% grid on;
% 
% 
% 

 