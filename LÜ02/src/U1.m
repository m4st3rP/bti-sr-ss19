% Audio lesen
[y, SampleFrequence] = audioread('JetztGehtsLos.wav');

% Dateigröße
FileSize = size(y, 1);

% Ergebnis
yVerzerrt = zeros(FileSize, 1);

% k erfragen
prompt = 'Bitte Wert für k eingeben\n';
k = input(prompt);

% Gleitender Mittelwert über k Werte
yMA = movmean(y, k);

% Normieren
yMA_normiert = yMA/max(abs(yMA));
y_normiert = y/max(abs(y));

% Samples und SampleFrequence ausgeben
fprintf('Die Anzahl der Samples beträgt %d\n', FileSize);
fprintf('Die Samplerate beträgt %d\n', SampleFrequence);

% Ergebnis ausgeben
figure(1);
subplot(1,2,1),
plot(y_normiert);
title('Original-Datei');
grid off; 
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(1,2,2),
plot(yMA_normiert);
title('Gleitender Mittelwert über k');
grid off;
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

% Audioausgabe
fprintf('ENTER drücken um Original-Audiodatei abzuspielen\n');
pause;
sound(y_normiert, SampleFrequence);
fprintf('ENTER drücken um gleitenden Mittelwert abzuspielen\n');
pause;
sound(yMA_normiert, SampleFrequence);