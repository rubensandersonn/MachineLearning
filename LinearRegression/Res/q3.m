#
#   Regressão Linear Multivariada Regularizada - Grad Estocastico
#   Rubens Anderson de Sousa Silva - Computaçao UFC  2017.2
#   

function q3()
  
  m3 = loadDados3();  
  
  [w3 eqm31 eqm32] = RLMReg(m3);
  
  w3
  
  z = [0:1:length(eqm31)-1];
  
  axes1 = subplot(2,1,1);
  plot(axes1, z, eqm31);
  title(axes1, 'EQM treino');
  ylabel(axes1, "erro");
  xlabel(axes1, "epocas");
  
  axes2 = subplot(2, 1, 2);
  
  plot(axes2, z, eqm32);
  title(axes2, 'EQM teste');
  ylabel(axes2, "erro");
  xlabel(axes2, "epocas");
  
  
endfunction
