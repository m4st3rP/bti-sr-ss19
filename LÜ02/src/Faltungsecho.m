% Audio lesen
[soundFile, soundSampleFrequence] = audioread('GitRiff.wav');
[impAns, impAnsSampleFrequence] = audioread('TrigRoom2.wav');

% Echo-Matrix
%           Position    Echo-
%           in Sek.     h�he
Echos       = [ 0       1.0; ...
                0.3     0.3; ...
                0.5     0.2; ...
                0.7     0.1; ...
                0.75    0.1];

%soundFile = (soundFile(:,1) + soundFile(:,2))/2;
impAns = (impAns(:,1) + impAns(:,2))/2;

% Dateigr��e
soundFileSize = size(soundFile, 1);
impAnsFileSize = size(impAns, 1);

% Echo anwenden
for j = 1:size(Echos,1)
    delay = int32(Echos(j,1) * impAnsSampleFrequence);
    feedback = Echos(j,2);
    for i = (delay+1):impAnsFileSize
       impAns(i) = impAns(i) + impAns(i-delay) * feedback;  
    end
end
    
% Samples und SampleFrequence ausgeben
fprintf('Die Anzahl der Samples vom unberarbeiteten Signal betr�gt %d\n', soundFileSize);
fprintf('Die Samplerate vom unberarbeiteten Signal betr�gt %d\n', soundSampleFrequence);
fprintf('Die Anzahl der Samples von der Sto�antwort betr�gt %d\n', impAnsFileSize);
fprintf('Die Samplerate vom von der Sto�antwort betr�gt %d\n', impAnsSampleFrequence);

% Faltung
mod = conv(soundFile, impAns);

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
fprintf('ENTER dr�cken um Original-Audiodatei abzuspielen\n');
pause;
%sound(sound_normiert, soundSampleFrequence);
fprintf('ENTER dr�cken um die Systemantwort abzuspielen\n');
pause;
sound(mod_normiert, soundSampleFrequence);