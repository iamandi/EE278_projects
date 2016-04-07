clc;
clear all;
close all;

Coef = fir1[8,0.3]
Input = sampledata(200)
Plot(Input)
Output = conv(Coef,Input)
Plot(output)
scalec = round(((2^15 - 1)/max(abs(coef)))*coef) 
scaleI = round(((2^15 - 1)/max(abs(Input)))*Input) 
Scale_output = conv(scalec,scaleI)
