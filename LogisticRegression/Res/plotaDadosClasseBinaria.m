function [U, Z] = plotaDadosClasseBinaria(X,Y, titulo)
  [m n] = size(X);
  uns = find(Y == 1);
  zeros = find(Y == 0);
  
  U = X(uns, :);
  Z = X(zeros, :);
  
  figure;
  plot(U(:, 2), U(:, 3), '+r', Z(:, 2), Z(:, 3), '*' );
  
  
endfunction
