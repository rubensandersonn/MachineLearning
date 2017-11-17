
function [xtr ytr xts yts xv yv] = separaDadosMLP(treino, teste, X,  Y)
  
  [m n] = size(X);
  
  ind = randperm(m);
  
  #X = X(ind, :);
  #Y = Y(ind, :);
  
  xtr = [-ones(floor(treino*m),1) X(1:floor(treino*m),:)];
  xts = [-ones(floor(teste*m), 1) X(floor(treino*m)+1 : floor(treino*m) + floor(teste*m) , :)];
  xv = [-ones(size(X, 1) - (floor(treino*m) + floor(teste*m)), 1) X(floor(treino*m)+ 1 + floor(teste*m) : end , :)];
  
  ytr = Y(1:floor(treino*m), : );
  yts = Y(floor(treino*m)+1 : floor(treino*m)+ floor(teste*m) , :);
  yv = Y(floor(treino*m)+1 + floor(teste*m) : end , :);
  
  
endfunction