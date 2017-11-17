function [xtr xte] = normaliza(xtreino, xteste)
  xtr = [];
  xte = [];
  
  xtr = normalizaDados(xtreino);
  xte = normalizaDados(xteste);
    
endfunction
