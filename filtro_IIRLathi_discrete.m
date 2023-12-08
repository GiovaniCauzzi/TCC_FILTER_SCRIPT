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

semilogx(freq_resp_min:freq_resp_step:freq_resp_max,freq_resp)
title('Resposta em frequência do filtro de primeira ordem - Simulação por equação de diferenças - Fc = 100Hz')
grid on
xlabel('Frequencia (Hz)');
ylabel('Ganho (dB)');

% 
% figure 
% subplot(211), plot(x)
% title('Sinal Ruidoso: Dom?nio do tempo')
% %axis([0 1e3 -1.5 1.5]) 
% 
% subplot(212), plot(y);
% title('Sinal Filtrado: Dom?nio do tempo')
% %axis([0 1e3 -1.5 1.5]) 

