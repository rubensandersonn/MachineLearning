#   Carrega dados para q1
#   Rubens Anderson de Sousa Silva - Computaç~ao UFC  2017.2
#
function [x,y] = loadDados1()
  
  m = load("ex1data1.txt");
  x = m(:, 1);
  y = m(:, 2);
  
endfunction
