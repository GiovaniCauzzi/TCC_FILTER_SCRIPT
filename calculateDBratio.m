function [ db ] = calculateDBratio(vin,vout)
db = 20*log10(vout/vin);
end

