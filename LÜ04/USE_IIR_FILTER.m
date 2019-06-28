function g = USE_IIR_FILTER(s1,IIR_1400_40dB)
b0 =IIR_1400_40dB(1,1);
b1 =IIR_1400_40dB(1,2);
b2 =IIR_1400_40dB(1,3);
a1 =IIR_1400_40dB(1,5);
a2 =IIR_1400_40dB(1,6);

g = zeros(max(size(s1)),1);
g(1) = b0 * s1(1);
g(2) = -a1 * g(1) + b0 * s1(2) + b1 * s1(1);
x2k = 0;
x1k = 0;
for k=3:1:max(size(s1))
    x1k1 = x2k;
    x2k1 = -a2*x1k - a1*x2k + s1(k);
    g(k) = b0*x2k1 + b1*x2k + b2*x1k;
    x1k = x1k1;
    x2k = x2k1;
end
return;