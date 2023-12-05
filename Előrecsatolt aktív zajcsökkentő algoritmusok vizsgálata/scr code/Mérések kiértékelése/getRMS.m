function [out] = getRMS(in, N_window)
%returns in ms
    ogLength = length(in);
    in = [zeros(N_window, 1);in];
    currRMS = zeros(ogLength,1);
    for k = 1:ogLength
        currRMS(k) = rms(in(k:k+N_window),"all");
    end
    out = currRMS;
 end