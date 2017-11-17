function [xtr ytr xts yts xv yv] = separaDadosTreinoTesteVal(X, treino, teste)
  [m n] = size(X);
  
  ind = randperm(m);
  
  #X = X(ind, :);
  #Y = Y(ind, :);
  
  xtr = [-ones(floor(treino*m),1) X(1:floor(treino*m),1:n-1)];
  xts = [-ones(floor(teste*m), 1) X(floor(treino*m)+1 : floor(treino*m) + floor(teste*m) , 1:n-1)];
  xv = [-ones(size(X, 1) - (floor(treino*m) + floor(teste*m)), 1) X(floor(treino*m)+ 1 + floor(teste*m) : end , 1:n-1)];
  
  ytr = X(1:floor(treino*m), n );
  yts = X(floor(treino*m)+1 : floor(treino*m)+ floor(teste*m) , n);
  yv = X(floor(treino*m)+1 + floor(teste*m) : end , n);
  
endfunction
