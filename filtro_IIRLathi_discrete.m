clc;clear all;close all;

Fs = 24e3;
Ts = 1/Fs;
fc = 100; %hz
wc = fc*2*pi; 
freq = 100;

t= 0:Ts:200e-3; %periodo de tempo
x = sin(2*pi*freq*t);
% x = ones(1, size(t,2));


y=zeros(size(t));
aux=size(t);
for(i=aux(1):aux(2))
    if (i==1)
        y(i)= (wc*Ts)*x(i);
    else
        y(i)= (wc*Ts)*x(i)+(exp(-wc*Ts))*y(i-1);
    end
end

figure 
subplot(211), plot(x)
title('Sinal Ruidoso: Dom?nio do tempo')
%axis([0 1e3 -1.5 1.5]) 

subplot(212), plot(y);
title('Sinal Filtrado: Dom?nio do tempo')
%axis([0 1e3 -1.5 1.5]) 

