function epocasXerro(eqm, titulo)
  figure
  stairs([1: 1: length(eqm)], eqm);
  title(titulo);
  ylabel('Erro');
  xlabel('epocas');
  
endfunction
