[y, Samplefrequenz] = audioread('JetztGehtsLos.wav');
FileSize = size(y, 1);
yDist = zeroes(FileSize, 1);