function filtered_signal = low_pass(signal, fs, cutoff_freq)
  % Compute the Fourier Transform of the signal
  X = fft(signal);

  % Compute all possible frequencies of the signal
  freqs = (0:length(signal)-1) * fs/length(signal);

  % Create a vector mask that is 1 for frequencies lower than the cutoff frequency
  % and 0 for frequencies higher than the cutoff frequency
  mask = freqs <= cutoff_freq;

  % Apply the Hadamard product between the Fourier Transform of the signal and the mask
  X_filtered = X .* mask';

  % Compute the inverse Fourier Transform to get the filtered signal
  filtered_signal = ifft(X_filtered);

  % Normalize the filtered signal
  filtered_signal = filtered_signal / max(abs(filtered_signal));
endfunction
