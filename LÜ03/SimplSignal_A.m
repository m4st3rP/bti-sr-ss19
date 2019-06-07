T = 1;          % Periode
TS = 0.1;      % Abtastintervall
fS = 1/TS;

% Signal
s = [0 1 1 1 1  1 1 1 1  0 0 0 0  0 0 0 0  ...
    0 0 0 0  0 0 0 0  1 1 1 1  1 1 1 1];


[re, im] = MyDFT(s);


% Ergebnis ausgeben
figure(1);
subplot(3,1,1),
stem(s);
title('Y');
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(3,1,2),
stem(re);
title('Real Y');
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(3,1,3),
stem(im);
title('Imaginär Y');
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');
