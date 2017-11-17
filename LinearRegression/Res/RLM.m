#   Regressão Linear Multivariada - Grad Estocastico
#   Rubens Anderson de Sousa Silva - Computaç~ao UFC  2017.2
#

function [y_b, w, eqm] = RLM(x,y)  
  
   epocas = 100;
   alpha = 0.01;
   
  [n m] = size(x);    
   w = randn(m, 1);   
   er = zeros(n, 1);
   y_b = ones(n, 1);
      
   for j=1:epocas
     for i=1:n
       
       y_b(i) = w' * x(i,:)';
       
       er(i) = y(i) - y_b(i);      
       
       w = w + alpha * er(i) * x(i, :)';
     endfor
     
     eqm(j) = sum(er.^2)/n;
   endfor  
   
endfunction
