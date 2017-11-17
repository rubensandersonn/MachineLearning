#   Regressão Linear Univariada - Grad Estocastico
#   Rubens Anderson de Sousa Silva - Computaçao UFC  2017.2
#   

function q1()
  
  [x1 y1] = loadDados1();  
  
  [yb1, w1, eqm1] = RLU(x1,y1);
  w1
  z = [1:1:length(eqm1)];
  
  axes1 = subplot(2,1,1);
  plot(axes1, z, eqm1, ".b");
  title(axes1, 'EQM');
  ylabel(axes1, "erro");
  xlabel(axes1, "epocas");
  
  axes2 = subplot(2, 1, 2);
  
  yb = [ones(length(x1),1) x1] * w1';
  title(axes2, 'Dados');
  ylabel(axes2, "y");
  xlabel(axes2, "x");
  plot(axes2, x1,y1,'x');
  hold on; 
  plot(axes2, x1,yb,'+k');
  hold off;
  
endfunction
