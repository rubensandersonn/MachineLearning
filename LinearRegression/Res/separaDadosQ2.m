function [x, y] = separaDadosQ2(X)
  
  [m n] = size(X);
  
  x = [ones(m,1) X(:, 1:n-1)];
  y = X(:, n);
  
endfunction