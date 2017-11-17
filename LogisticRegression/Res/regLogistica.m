function [eqm_teste, eqm_treino, w] = regLogistica(alpha, epocas, treino, dados)
  [m,n] = size(dados);
  
  [xtr xte ytr yte] = separaDadosTreino(treino, dados);
  
  [mtr, ntr] = size(xtr);
  [mte, nte] = size(xte);
  
  # normalizar dados...
  xtr = normalizaDados(xtr);
  xte = normalizaDados(xte);
  #[xtr xte] = normaliza(xtr, xte);
  
  # inicializando...
  
  
  eqm_treino = zeros(epocas, 1);
  eqm_teste = zeros(epocas, 1);
  w = randn(1, ntr);
    
  for(j=1:epocas)
      
      # rand nos dados...
      ind = randperm(length(xtr));
      xtr = xtr(ind, :);
      ytr = ytr(ind);
      
      ytb = zeros(length(xtr(:, 1)), 1);
      
      for(z = 1:length(xtr(:, 1)))
          # treinando com xt
          
          ytb(z) = 1/(1+exp(-w * xtr(z, :)'));
          
          # erros...
          eit(1, z) = ytr(z) - ytb(z);
          
          # aprendendo...
          w = w + alpha * eit(z)*xtr(z, :);
          
      endfor
      
      # testando o xte
      
      yb = (1./(1+exp(-w * xte')))';
      
      erf = round(yb - yte);
      eqm_teste(j) = mean(erf.^2);
      
      eqm_treino(j) = mean(eit.^2);
      
  endfor
  
  
  # talvez eu tenha que desnormalizar dps de tudo...
  #w = w*maximo;
  
endfunction
