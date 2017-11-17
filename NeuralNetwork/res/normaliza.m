function [xtr xte xv] = normaliza(xtreino, xteste, xval)
  xtr = [];
  xte = [];
  
  xtr = normalizaDados(xtreino);
  xte = normalizaDados(xteste);
  xv = normalizaDados(xval);
  
  #xteste(1:10, :)
endfunction
