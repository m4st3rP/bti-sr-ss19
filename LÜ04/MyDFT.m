function [A, B] = MyDFT(Signal)
    M = length(Signal);
    
    A = zeros(1, M);
    B = zeros(1, M);
    
    for i=1:M
        Re = 0;
        Im = 0;
        for j=1:M
            deg = 2*pi* (i-1)/M * (j-1);
            Re = Re + (Signal(j) * cos(deg));
            Im = Im + (Signal(j) * sin(deg));
        end
        A(i) = Re/M;
        B(i) = Im/M;
    end
return