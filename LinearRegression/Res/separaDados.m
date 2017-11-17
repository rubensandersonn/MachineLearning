

function [xtr, xts, ytr, yts] = separaDados(treino, X)
  
  [m n] = size(X);
    
  xtr = [ones(treino,1) X(1:treino,1:n-1)];
  xts = [ones(size(X,1) - treino, 1) X(treino+1:end,1:n-1)];
  ytr = X(1:treino, n);
  yts = X(treino+1:end, n);
  
endfunction

