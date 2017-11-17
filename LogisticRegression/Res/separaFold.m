function [xf yf xt yt] = separaFold(k, i, xtreino, ytreino)
  
  [mtr, ntr] = size(xtreino);
  
  ii = min(i*k+1, mtr);
        
  xf = xtreino(i:ii, :);
  yf = ytreino(i:ii);
  
  xt = [];
  yt = [];
  
  for(z=1:mtr)
      if(z < ii || z >= ii + mtr/k)
          xt = [xt; xtreino(z, :)];
          yt = [yt; ytreino(z)];
      endif
  endfor
endfunction
