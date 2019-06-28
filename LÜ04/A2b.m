f_Sample = 44100;

select = 4

if select == 1
    %Einlesen der Samples
    [s1, f_Sample] = audioread('ACDClike.wav');
elseif select == 2
    %chirp-Signal (44.1kHz Samplerate, 0…5s, 50 …5000 Hz) 
    t = 0 : 1/f_Sample :5; 
    s1 = chirp(t,50,5,5000);
elseif select == 3
    %5s Rauschen (Befehl „rand(…)“ mit 44.1 kHz)
     t = 0 : 1/f_Sample :5;
     s1 = rand(size(t));
elseif select == 4
    %Rechteckimpulsfolge   
    t = 0 : 1/f_Sample :1;                     % 44,1kHz sample freq für 1s        
    d= 0 : 1/20 : 1;                        % 20 Hz Wiederholrate für 1s         
    s1 = pulstran(t,d, 'rectpuls', 0.005);  % Rect der Breite 5ms
end

%FIR laden
load('IIR_1500_80dB.mat');

s2 = sosfilt(SOS, s1);

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


sound(s1,f_Sample);
pause;
sound(s2,f_Sample);