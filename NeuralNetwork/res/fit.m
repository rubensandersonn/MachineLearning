function w = fit(alpha, epocas, treino, teste, r, classify)
  
  # coletando e separando dados...
  if classify
	  load('ex3data1.mat');
    [xtr ytr xte yte xv yv] = separaDadosMLP(treino, teste, X, T); ###
    [xtr xte xv] = normaliza(xtr, xte, xv);
  else
    X = load('ex3data2.data');
    [xtr ytr xte yte xv yv] = separaDadosTreinoTesteVal(X, treino, teste); ###
    [xtr xte xv] = normaliza(xtr, xte, xv);
  endif
  
  [mte, nte] = size(xte);
  [mtr, ntr] = size(xtr);
  [mv, nv] = size(xv);
  
  [mytr, nytr] = size(ytr);
  [myte, nyte] = size(yte);
  [myv, nyv] = size(yv);
  
  
	w = randn(r, ntr);
	m = randn(r, nytr);
  
  eqmE = [];
  eqmT = [];
  
	for i=1:epocas
      #[xtr ytr xte yte xv yv] = separaDadosMLP(treino, teste, X, T); ###
      E = [];
      Et = [];
      for j=1:mtr
        x = xtr(j, :);
        y = ytr(j, :);
        
        [e yb w m] = mlp(alpha, r, w, m, x, y, classify);
        
        E = [E; sum(e.^2)/mytr];
      endfor
      
      #if classify
      eqmE = [eqmE sum(E)/(nytr)];
      #else
        #eqmE = [eqmE E];
      #endif
      
      # agora testando...
      
      for j=1:mte
        x = xte(j, :);
        y = yte(j, :);
        ybt = predict(x, w, m, classify);
      
        ee = y - ybt;
        #[ee ybt w m] = mlp(alpha, r, w, m, x, y);
        Et = [Et; sum(ee.^2)/myte];
      endfor
      #if classify
      eqmT = [eqmT sum(Et)/(nyte)];
      #else
        #eqmT = [eqmT Et];
      #endif
      
      
	endfor
  
  # passando para o conjunto de validaç~ao...
  yvb = predict(xv, w, m, classify);
  eee = ybt - y;
  Ev = [sum(eee.^2)/myv]
  
  #Ev = mean(Ev)
  
  figure;
  xf = linspace(1, size(eqmE, 2) , size(eqmE, 2));
  xt = linspace(1, size(eqmT, 2) , size(eqmT, 2));
  
  plot( xf, eqmE);
  hold on;
  title('Epocas x erros em treino e validacao');
  plot( xt, eqmT, 'r');
  hold off;
  
  if !classify
    yyy = linspace(1, length(yv), length(yv));
    yy = linspace(1, length(yvb), length(yvb));
    
    
    figure;
    errorbar(yyy, yv, eee);
    
    title('Preços preditos x preços reais');
  endif
  
  
endfunction