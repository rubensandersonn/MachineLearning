function [eqm, ert, eqm_teste, w, w_folds] = regLogiEstocKFold(alpha, k, treino, epocas, dados)
  [m,n] = size(dados);
  
  [xtreino xteste ytreino yteste] = separaDadosTreino(treino, dados);
  
  [mtr, ntr] = size(xtreino);
  [mte, nte] = size(xteste);
  
  # normalizar dados...
   [xtreino xteste] = normaliza(xtreino, xteste);
  
  # inicializando...
  w_folds = [];
  eqmf = zeros(1, k);
  eqm_treino = zeros(epocas, 1);
  wf = randn(1, ntr);

  for(i=1:k)
      # separar o fold aqui
      [xf yf xt yt] = separaFold(k,i,xtreino, ytreino);
      size(wf);
      size(xt(3, :)');
      
      for(j=1:epocas)
          
          # rand nos dados...
          ind = randperm(length(xt));
          xt = xt(ind, :);
          yt = yt(ind);
          
          ytb = zeros(length(xt(:, 1)), 1);
          
          for(z = 1:length(xt(:, 1)))
              # treinando com xt
              
              ytb(z) = 1/(1+exp(-wf * xt(z, :)'));
             
              # erros...
              eit(1, z) = yt(z) - ytb(z);
              
              # aprendendo...
              wf = wf + alpha * eit(z)*xt(z, :);
          endfor
          
          eqm_treino(j) = mean(eit.^2);
          
      endfor
      
      # testando o resto do xtreino
      
      yfb = (1./(1+exp(-wf * xf')))';
      
      erf = round(yfb - yf);
      eqmf(i) = mean(erf.^2);
      w_folds = [w_folds; wf];
      
  endfor
		eqm_teste = eqmf;
		#adora testar no xteste com o wf wue deu menor eqm
		
		mini = findIndex(eqmf, min(eqmf));		
		w = w_folds(mini(1,1), :);
		
		ytesteb = (1./(1+exp(-w*xteste')))';
		ert = ytesteb - yteste;
		eqm = mean(ert.^2);
		
endfunction