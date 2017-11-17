#   Regressão Linear Univariada - Grad Estocastico
#   Rubens Anderson de Sousa Silva - Computaç~ao UFC  2017.2
#   Retorna o chute de cada xi, os pesos e os erros

function [y_b, w, EQM] = RLU(x,y)
   epocas = 1000;
   alpha = 0.001;
   
   n = length(x);
   
   w1 = rand();
   w0 = rand();
   
   Er = ones(n,1);
   y_b = ones(n, 1);
   
   
   EQM = zeros(epocas, 1);
   
   for j=1:epocas
     
     for i=1:n
       y_b(i) = w1 * x(i) + w0;
       Er(i) = y(i) - y_b(i);
       
       w0 = w0 + alpha * Er(i);
       w1 = w1 + alpha * Er(i) * x(i);
     endfor
     
     EQM(j) = sum(Er.^2) / (2*n);
   endfor
   
   w = [w0, w1];
   
endfunction
