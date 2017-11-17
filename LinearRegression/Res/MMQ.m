

function w = MMQ(Xx, Y)
  
  w = inverse(Xx' * Xx) * Xx' * Y;
  
endfunction
