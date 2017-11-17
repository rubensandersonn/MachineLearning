function q1()
  # inputs...
  dados = loadDados1();
  [eqm_teste1, eqm_treino1, w1] = regLogistica(0.01, 1000, 70, dados);
  [eqm, ert, eqm_teste, w, w_folds] = regLogiEstocKFold(0.01, 7, 70, 1000, dados);
  
  [X Y] = separaDadosQ2(dados);
  [X] = normalizaDados(X);
  
  # parte 1: plotar os dados:
  plotDecisionBoundary(w1, X, Y); # w1 deve ser normalizado
  plotDecisionBoundary(w, X, Y); # w1 deve ser normalizado
  #plotDecisionBoundary(maximo * w1, maximo * X, Y);
  
  ' Regressao logistica estocastica...'
  
  #parte 2: regressao logistica estocastica ; w, epocasXerro, eqm
  
  ' EQM final: '
  epocasXerro(eqm_teste1, "Regressao Logistica estocastica - testes");
  
  ' Coeficientes de teste: '
  w1
  
  epocasXerro(eqm_treino1, "Regressao Logistica estocastica - treino");
  
  ' Regressao logistica estocastica com validacao k-fold...'
  #parte 3: regressao logistica estocastica com k-fold ; w, epocasXerro, eqm
  
  ' EQM final: '
  eqm
  
  ' Coeficientes de teste: '
  w
  
  epocasXerro(eqm_teste, "Regressao Logistica estocastica k-fold");
  
  
endfunction
