% Signal
s = [0 1 1 1 1  1 1 1 1  0 0 0 0  0 0 0 0  ...
    0 0 0 0  0 0 0 0  1 1 1 1  1 1 1 1];

M = length(s);

Y = fft(s);
Re = real(Y)/M;
Im = imag(Y)/M;


% Ergebnis ausgeben
figure(1);
subplot(3,1,1),
stem(s);
title('Y');
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(3,1,2),
stem(Re);
title('Real Y');
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');

subplot(3,1,3),
stem(Im);
title('Imaginär Y');
% Achsenbeschriftung
xlabel('Samples');
ylabel('Amplitude');
