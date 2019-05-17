% Audio lesen
[soundFile, soundSampleFrequence] = audioread('GitRiff.wav');
[impAns, impAnsSampleFrequence] = audioread('TrigRoom2.wav');

%soundFile = (soundFile(:,1) + soundFile(:,2))/2;
impAns = (impAns(:,1) + impAns(:,2))/2;

% Dateigröße
soundFileSize = size(soundFile, 1);
impAnsFileSize = size(impAns, 1);

% Samples und SampleFrequence ausgeben
fprintf('Die Anzahl der Samples vom unberarbeiteten Signal beträgt %d\n', soundFileSize);
fprintf('Die Samplerate vom unberarbeiteten Signal beträgt %d\n', soundSampleFrequence);
fprintf('Die Anzahl der Samples von der Stoßantwort beträgt %d\n', impAnsFileSize);
fprintf('Die Samplerate vom von der Stoßantwort beträgt %d\n', impAnsSampleFrequence);

% Faltung
%mod = conv(soundFile, impAns);
mod = MyConv(soundFile, impAns);

% Normieren
sound_normiert = soundFile/max(abs(soundFile));
impAns_normiert = impAns/max(abs(impAns));
mod_normiert = mod/max(abs(mod));

% Ergebnis ausgeben
figure(1);
subplot(3,1,1),
plot(sound_normiert);
title('Original-Datei');
grid off; 
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(3,1,2),
plot(impAns_normiert);
title('Impulsantwort');
grid off;
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(3,1,3),
plot(mod_normiert);
title('gefaltetes Signal/Systemantwort');
grid off;
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

% Audioausgabe
% fprintf('ENTER drücken um Original-Audiodatei abzuspielen\n');
% pause;
% sound(sound_normiert, soundSampleFrequence);
% fprintf('ENTER drücken um die Systemantwort abzuspielen\n');
% pause;
sound(mod_normiert, soundSampleFrequence);