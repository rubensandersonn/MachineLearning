function y = sigmoid(x)
  # s' = s * (1 - s)
  y = 1./(1 + exp(-x));
endfunction
