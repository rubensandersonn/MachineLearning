function [eqm_teste, eqm_treino, eqms, w] = regLogisticaRegul(lambda, alpha, epocas, treino, dados)
  [m,n] = size(dados);
  
  [xtr xte ytr yte] = separaDadosTreino(treino, dados);
  
  [mtr, ntr] = size(xtr);
  [mte, nte] = size(xte);
  
  # normalizar dados...
   [xtr xte maximo] = normaliza(xtr, xte);
  
  # inicializando...
  
  #eit = zeros(mtr,1);
  eqm_treino = zeros(epocas, 1);
  eqm_teste = zeros(epocas, 1);
  w = randn(1, ntr);
  w = zeros(1, ntr);
  
  eqms = [];
  for(d=1:length(lambda))    
  
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
              eit(z) = ytr(z) - ytb(z);
              
              # aprendendo...
              w(1) = w(1) * eit(1) * xtr(z,1);
              for (ll = 2:ntr)
                w(ll) = w(ll) + alpha * (eit(z)*xtr(z, ll) - lambda(d) * w(ll));
              endfor
          endfor
          
          eqm_treino(j) = mean(eit.^2);
          yb = (1./(1+exp(-w * xte')))';
          
          erf = round(yb - yte);
          eqm_teste(j) = mean(erf.^2);
      endfor
      eqms = [eqms eqm_teste];
  endfor
  
endfunction
