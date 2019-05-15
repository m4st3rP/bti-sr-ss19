% Audio lesen
[y, SampleFrequence] = audioread('GitRiff02.wav');
y = (y(:,1) + y(:,2))/2;

% Dateigröße
FileSize = size(y, 1);

% Ergebnis
yTan = zeros(FileSize, 1);
yBen = zeros(FileSize, 1);

% parameter erfragen
a = input('Bitte Wert für Verzerrung eingeben\n');
feedback = input('Bitte Wert für Feedback eingeben\n');
delay = 6000;

% Audioeffekte anwenden
yTan = GuitarDistortion(y, 'tan', a);
yBen = GuitarDistortion(y, 'ben', a);

for i = (delay+1):FileSize
   yTan(i) = yTan(i) + yTan(i-delay) * feedback;  
end

for i = (delay+1):FileSize
   yBen(i) = yBen(i) + yBen(i-delay) * feedback;  
end

% Normieren
yTan = yTan/max(abs(yTan));
yBen = yBen/max(abs(yBen));
y = y/max(abs(y));

% Samples und SampleFrequence ausgeben
fprintf('Die Anzahl der Samples beträgt %d\n', FileSize);
fprintf('Die Samplerate beträgt %d\n', SampleFrequence);

% Ergebnis ausgeben
figure(1);
subplot(2,2,1),
plot(y);
title('Original-Datei');
grid off; 
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(2,2,2),
plot(yTan);
title('Verzerrt mit Tangens-Hyperbolicus');
grid off;
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(2,2,3),
plot(yBen);
title('Verzerrt mit Bendiksen');
grid off;
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

% Audioausgabe
fprintf('ENTER drücken um Original-Audiodatei abzuspielen\n');
pause;
sound(y, SampleFrequence);
fprintf('ENTER drücken um verzerrt mit Tangens-Hyperbolicus abzuspielen\n');
pause;
sound(yTan, SampleFrequence);
fprintf('ENTER drücken um verzerrt mit Bendiksen abzuspielen\n');
pause;
sound(yBen, SampleFrequence);