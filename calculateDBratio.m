function [ db ] = calculateDBratio(vin,vout)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

db = 20*log10(vout/vin);
end

