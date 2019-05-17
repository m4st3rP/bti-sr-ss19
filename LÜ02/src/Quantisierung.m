% Audio lesen
[soundFile, soundSampleFrequence] = audioread('GitRiff.wav');
[impAns, impAnsSampleFrequence] = audioread('TrigRoom2.wav');

%soundFile = (soundFile(:,1) + soundFile(:,2))/2;

% Dateigröße
soundFileSize = size(soundFile, 1);

% Samples und SampleFrequence ausgeben
fprintf('Die Anzahl der Samples vom unberarbeiteten Signal beträgt %d\n', soundFileSize);
fprintf('Die Samplerate vom unberarbeiteten Signal beträgt %d\n', soundSampleFrequence);

% Normieren
sound_normiert = soundFile/max(abs(soundFile));

% Quantisierung
QSteps = 1000;
q = round(soundFile*QSteps);

% Normieren
q_normiert = q/max(abs(q));

% Quantisierungsfehler
q_fehler = q_normiert-sound_normiert;

% Ergebnis ausgeben
interval = 15000:15400;
figure(1);
subplot(3,1,1),
plot(sound_normiert(interval));
title('Original-Datei');
grid off; 
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(3,1,2),
plot(q_normiert(interval));
title('Quantisiertes Signal');
grid off;
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(3,1,3),
plot(q_fehler(interval));
title('Quantisierungsfehler');
grid off;
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

% Audioausgabe
fprintf('ENTER drücken um Original-Audiodatei abzuspielen\n');
pause;
% sound(sound_normiert, soundSampleFrequence);
fprintf('ENTER drücken um die Systemantwort abzuspielen\n');
pause;
sound(q_normiert, soundSampleFrequence);