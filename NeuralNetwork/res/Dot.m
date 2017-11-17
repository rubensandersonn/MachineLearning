function c = Dot(a, b)
  # INDEPENDENTE DE SEREM COLUNA OU LINHA, RETORNA O PRODUTO DE CADA POSICAO DE A E B
  
  c = zeros(length(a), 1);
  for i =1:length(a)
    c(i) = a(i) * b(i);
  endfor
  
endfunction
