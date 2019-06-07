M = 256;    % Anzahl Abtastwerte
F = 15.5;   % Frequenz Cos-Signal

% Signal
t = 0:M-1;
x = cos(2*pi*F*t/M);
win = hann(M)';
x = x .* win;

X = fft(x);
X = X/max(abs(X));


% Ergebnis ausgeben
figure(1);
subplot(2,2,1),
stem(x);
title('x');
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(2,2,2),
stem(real(X));
title('Real X');
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(2,2,3),
stem(imag(X));
title('Imaginär X');
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(2,2,4),
stem(abs(X));
title('Absolut X');
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');
