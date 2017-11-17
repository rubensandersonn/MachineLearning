function q2()
  dados = loadDados2();
  [eqms W] = regLogiRegul([0 0.01 0.25], 0.01, 100, dados);
  
  #plotando os eqms...
  
  for(i=1:length(eqms(1, :)));
    titulo = "EQM::";
    titulo = strcat(titulo, num2str(i));
    epocasXerro(eqms(:, i), titulo);
  endfor
  
  figure;
  plot(W);
endfunction
