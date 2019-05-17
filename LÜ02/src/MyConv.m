function Y = MyConv(s_Vek, h_Vek)
    s_vek_size = length(s_Vek);
    h_vek_size = length(h_Vek);
    k = (h_vek_size+s_vek_size) - 1;
    Y = zeros(1,k);
    for i = 1:k
        for j=max(1, i+1-h_vek_size):min(i, s_vek_size)
            Y(i) = Y(i) + s_Vek(j) * h_Vek(i+1-j);
        end
    end
return