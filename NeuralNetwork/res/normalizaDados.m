function [Xn] = normalizaDados(X)
  med = mean(X);
  desv = std (X);
  
  size(med);
  size(desv);
  
  for i =1:length(desv)
    if desv(i) == 0
      desv(i) = 0.0001;
    endif
  endfor
  
  
  Xn = X - repmat(med, length(X(:,1)), 1);
  
  Xn = Xn ./(repmat(desv, length(X(:,1)), 1));
  
  Xn(:,1) = -1;
  
endfunction