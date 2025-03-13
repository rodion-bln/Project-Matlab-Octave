function [S, f, t] = spectrogram(signal, fs, window_size)
  % Get the size of the signal and compute the number of windows
  signal_length = length(signal);
  num_windows = floor(signal_length / window_size);

  % Initialize the spectrogram matrix
  S = zeros(window_size , num_windows);

  for i = 1:num_windows
      % Extract the current window from the signal  
      start_index = (i - 1) * window_size + 1;
      end_index = start_index + window_size - 1;
      window = signal(start_index:end_index);

      % Apply the Hann function to it
      window = window .* hanning(window_size);

      % Compute the Fourier Transform of the window with a resolution twice the size of the window
      window_fft = fft(window, 2 * window_size);

      % Discard the conjugate part of the Fourier Transform and store the result in the spectrogram matrix
      S(:, i) = abs(window_fft(1:window_size));
  end

% Compute the frequency vector
  f = (0:window_size-1)' * fs / ( 2 * window_size);

  % Compute the time vector
  t = ((0:num_windows-1) * window_size / fs)';
endfunction
