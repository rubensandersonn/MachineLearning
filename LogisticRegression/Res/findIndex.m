function ind = findIndex(q, val)
  ind = [-1 -1];
  
    for(j=1:length(q(:,1)))
      for(k=1:length(q(1, :)))
        
        if(str2num(num2str(q(j,k))) == str2num(num2str(val)))
          ind = [j k];
          return;
        endif
      endfor
    endfor
  
  
endfunction
