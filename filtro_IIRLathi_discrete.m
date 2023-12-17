clc;clear all;close all;

Fs = 24e3;
Ts = 1/Fs;
fc = 100; %hz
wc = fc*2*pi; 
t= 0:Ts:1000e-3; %periodo de tempo

freq_resp_min = 0;
freq_resp_max = 1000;
freq_resp_step = 2;
freq_resp = zeros((freq_resp_max-freq_resp_min)/freq_resp_step,1);
counter = 0;
for i = freq_resp_min:freq_resp_step:freq_resp_max
    counter = counter +1;
    freq = i;
    x = sin(2*pi*freq*t);
    
    [y atenuation] = tccFilter(x,t, wc, Fs);
    freq_resp(counter) = atenuation;
end

semilogx(freq_resp_min:freq_resp_step:freq_resp_max,freq_resp,'LineWidth', 2, 'DisplayName', 'SIMULAÇÃO')
title('Resposta em frequência do filtro de primeira ordem - Fc = 100Hz')
grid on
xlabel('Frequência (Hz)');
ylabel('Ganho (dB)');
hold on

resultsx(1) = 5;
resultsy(1) = 0;

resultsx(2) = 10;
resultsy(2) = 0;

resultsx(3) = 25;
resultsy(3) = -0.1346;

resultsx(4) = 50;
resultsy(4) = -0.989;

resultsx(5) = 75;
resultsy(5) = -2,278;

resultsx(6) = 100;
resultsy(6) = -3.793;

resultsx(7) = 200;
resultsy(7) = -9.409;

resultsx(8) = 300;
resultsy(8) = -14.674;
semilogx(resultsx,resultsy,'LineWidth', 2, 'DisplayName', 'IMPLEMENTAÇÃO')
legend('show');


% 
% figure 
% subplot(211), plot(x)
% title('Sinal Ruidoso: Dom?nio do tempo')
% %axis([0 1e3 -1.5 1.5]) 
% 
% subplot(212), plot(y);
% title('Sinal Filtrado: Dom?nio do tempo')
% %axis([0 1e3 -1.5 1.5]) 

