function [eqms, W] = regLogiRegul(lambda, alpha, epocas, dados)
  # Regressao Logistica Estocastica Regularizada - Autor: Rubens Anderson, Computacao UFC 2017.2.
  # recebe um vetor de lambdas (parametros de regularizacao), alpha (tamanho do passo), epocas (numero de epocas de treinamento) e dados (matriz contendo os atributos nas n-1 colunas e o vetor de classes na coluna n).
  # retorna os EQM's e w's com relacao a cada lambda.
  
  # separando os dados...
  [X Y] = separaDadosQ2(dados);
    
  # normalizar dados...
  [X] = normalizaDados(X);
   
  Xmap = mapFeature(X(:,2), X(:,3));
  [m,n] = size(Xmap);
  
  # inicializando...
  
  eit = zeros(m,1);
  eqm = zeros(epocas, 1);
  
  w = randn(1, n);
  W = [];  
  eqms = [];
  
  for(d=1:length(lambda))    
  
      for(j=1:epocas)
          
          # rand nos dados...
          ind = randperm(m);
          Xmap = Xmap(ind, :);
          Y = Y(ind);
          
          ytb = zeros(m, 1);
          
          for(z = 1:m)
              # treinando com X
              
              ytb(z) = 1/(1+exp(-w * Xmap(z, :)'));
                         
              # erros...
              eit(z) = Y(z) - ytb(z);
              
              # aprendendo...
              w(1) = w(1) + alpha*eit(z) * Xmap(z,1);
              for(ll=2:length(w(1,:)))
                w(ll) = w(ll) + alpha * (eit(z)*Xmap(z, ll) - lambda(d) * w(ll));
              endfor
              
          endfor
          
          eqm(j) = mean(eit.^2);
          
      endfor
      
      W = [W;w];
      eqms = [eqms eqm];
      
  endfor
  # plotar as curvas aqui...
  for(p=1:length(W(:,1)))
    titulo = "lambda::";
    titulo = strcat(titulo, num2str(lambda(p)));
    
    plotDecisionBoundary2(W(p,:)', X, Y, titulo);
  endfor
endfunction