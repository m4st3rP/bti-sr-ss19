% Aliasing
fS = 6000;     % Abtastfrequenz
TS = 1/fS;      % Abtastintervall

FreqVek = [500 1000 1500 2000 2500 3000 3500 4000 4500];

t = 0:TS:0.5;
Y = [];

% Kosinus
for x = 1:length(FreqVek)
    Y = [Y cos(FreqVek(x)*2*pi*t)];
end

sound(Y, fS);