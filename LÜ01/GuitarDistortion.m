% Distortion nach Tangens-Hyperbolicus oder Benediksen Funktion
function y = GuitarDistortion(x, Typ, D)
    z = x*D;
    if Typ == 'ben'
        y = -sign(-z).*(1-exp(sign(-z).*z));
    elseif Typ == 'tan' 
        y = 0.1*tanh(z); 
    end
return