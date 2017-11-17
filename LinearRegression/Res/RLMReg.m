#   Regressão Linear Multivariada - Grad Estocastico
#   Rubens Anderson de Sousa Silva - Computaç~ao UFC  2017.2
#

function [w, eqm1, eqm2] = RLMReg(dados)
  
  [n,m] = size(dados);
  
  treino = 30;
  
  lambda = [0, 1, 2, 3, 4, 5];

  w = randn(m,1);
  
  I_mod = ones(m);
  I_mod(1,1) = 0;
  
  eqm1 = randn(length(lambda), 1);
  eqm2 = randn(length(lambda), 1);
  
      #separando os dados...  
  [x_treino, x_teste, y_treino, y_teste] = separaDadosTreino(treino, dados);
  
      #treinando... 
     
  ws = [] ;
  for k=1:length(lambda)
    
          # calcular os erros de cada lambda
      erro_ac = 0;   
      
      w = inverse(x_treino' * x_treino + lambda(k) * I_mod) * x_treino'* y_treino;
      ws = [ws , w];
      
      y_b = x_treino * w;
      er = y_treino - y_b; 
      
      er = er.^2;
      erro_ac = sum(er);
      erro_ac = erro_ac/(treino);
      
      eqm1(k) = erro_ac;
      
      # passando para teste
      
      y_b = x_teste * w;
      er = y_teste - y_b;
      
      erro_ac = mean(er.^2);
      eqm2(k,1) = erro_ac;
  
  endfor

  
endfunction