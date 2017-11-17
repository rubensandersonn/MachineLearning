function [Xn] = normalizaDados(X)
  med = mean(X);
  desv = std (X);
  
  Xn = X - repmat(med, length(X(:,1)), 1);
  
  Xn = Xn ./(repmat(desv, length(X(:,1)), 1));
  
  Xn(:,1) = 1;
  
endfunction