function yb = predict(x, w, m, classify)
	#w = randn(r, nx);
	#m = randn(r, s);
	
	u = x * w';   # 1 x r
	z = sigmoid(u);   # 1 x r
	
	v = z * m;   # 1 x s
  if classify
	  yb = sigmoid(v);  # 1 x s, s = ny
  else
    yb = v; # regressao... nao precisa passar o sigmoid
  endif
	
endfunction
