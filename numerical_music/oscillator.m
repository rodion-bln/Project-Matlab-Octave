function x = oscillator(freq, fs, dur, A, D, S, R)
  % Create a time vector
  t = (0:1/fs:dur-1/fs)';

  % Create the sine wave
  x = sin(2 * pi * freq * t);

  % Compute the number of samples for each envelope stage
  total_samples = length(t);
  attack_samples = floor(A * fs);
  decay_samples = floor(D * fs);
  release_samples = floor(R * fs);
  sustain_samples = total_samples - attack_samples - decay_samples - release_samples;
  
  % Compute the envelopes for each stage
  attack_envelope = linspace(0, 1, attack_samples)';
  decay_envelope = linspace(1, S, decay_samples)';
  sustain_envelope = S * ones(sustain_samples, 1);
  release_envelope = linspace(S, 0, release_samples)';

  % Concatenate the envelopes to create the final envelope
  final_envelope = [attack_envelope; decay_envelope; sustain_envelope; release_envelope];

  % Apply the envelope to the sine wave
  x = x .* final_envelope;

endfunction
