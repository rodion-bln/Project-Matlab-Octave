function reverberated_signal = apply_reverb(signal, impulse_response)
  impulse_response = stereo_to_mono(impulse_response);

  reverberated_signal = fftconv(signal, impulse_response);

  % Ensure the reverberated signal is normalized
  reverberated_signal = reverberated_signal / max(abs(reverberated_signal));
  
endfunction
