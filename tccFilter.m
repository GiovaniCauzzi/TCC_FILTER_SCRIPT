function [y, atenuation ] = tccFilter(x,t, wc, Fs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Ts = 1/Fs;
y=zeros(size(t));
aux=size(t);
for(i=aux(1):aux(2))
    if (i==1)
        y(i)= (wc*Ts)*x(i);
    else
        y(i)= (wc*Ts)*x(i)+(exp(-wc*Ts))*y(i-1);
    end
end

voutMax = max(y(200:size(y,2)));
atenuation = calculateDBratio(1,voutMax);

end

