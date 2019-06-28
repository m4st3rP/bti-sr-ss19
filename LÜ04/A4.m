f_Sample = 44100;

%Einlesen der Samples
[s1, f_Sample] = audioread('GitRiff_880Hz.wav');

%FIR laden
load('NOTCH_880.mat');
s2 = filter(Num, Den, s1);

%normieren
s1 = s1/max(abs(s1));
s2 = s2/max(abs(s2));

% Ergebnis ausgeben
figure(1);
subplot(1,2,1),
plot(s1);
title('Original-Signal');
grid off; 
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(1,2,2),
plot(s2);
title('Gefiltertes Signal');
grid off;
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');


% sound(s1,f_Sample);
% pause;
sound(s2,f_Sample);