#
#   Regressão Linear Multivariada - 
#   Grad Estocastico e Metodo dos Minimos Quadrados
#   Rubens Anderson de Sousa Silva - Computaçao UFC  2017.2
#   

function q2()
  
  m2 = loadDados2();
  
  [x2,y2] = separaDadosQ2(m2);
  
  [yb2, w21, eqm2] = RLM(x2,y2);
  z = [1:1:length(eqm2)];
  
  w21
  
  plot( z, eqm2, ".b");
  title('EQM');
  ylabel("erro");
  xlabel("epoca");
  
  
  w22 = MMQ(x2, y2);
  
  w22

  if(w21 == w22)  
    resposta = "Os coeficientes sao iguais! Erro entre eles:"
  else
    resposta = "Os coeficientes sao diferentes!  Erro entre eles:"
  endif
  
  erro = sum((w21 - w22).^2)/length(w21)
  
endfunction