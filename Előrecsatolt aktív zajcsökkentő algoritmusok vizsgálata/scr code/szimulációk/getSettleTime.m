function [out, suppression, debug_rms, dbg_count] = getSettleTime(in, N_window)
%returns in ms
    max_RMS = rms(in(1:N_window),"all");
    min_RMS = rms(in(end-N_window:end),"all");
    
    suppression = 20*log10(min_RMS/max_RMS);

    percent = (max_RMS - min_RMS)*0.1;
    max = max_RMS - percent;
    min = min_RMS + percent;

    count = 0;
    for k = 1:length(in)-N_window-1
        currRMS = rms(in(k:k+N_window),"all");
        debug_rms(k) = currRMS;
        dbg_count(k) = 0;
        if (currRMS <= max)
            dbg_count(k) = 0.2;
            count = count+1;
        end
        if (currRMS <= min)
            break;
        end
    end
    out = count;
 end