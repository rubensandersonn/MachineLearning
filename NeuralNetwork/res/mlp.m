function [e, yb, w, m] = mlp(alpha, r, w, m, x, y, classify)
	#supondo que y eh nao nulo, ou seja, estamos treinando...
  # s deve ser igual a ny
	
	[mx nx] = size(x);
	[my ny] = size(y);
	#s = ny;
  
	#w = randn(r, nx);
	#m = randn(r, s);
	
	u = x * w';   # 1 x r
	z = sigmoid(u);   # 1 x r
	
	v = z * m;   # 1 x s
  if classify
	  yb = sigmoid(v);  # 1 x s, s = ny
  else
    yb = v;
  endif
	e = y - yb;   # 1 x s
  
  
  ### AGORA, ATUALIZANDO OS COEFICIENTES... ###
  
  
  # vetor gradiente local da camada de saida...
  if classify
	  D = Dot(e, sigmoid(v)); # s x 1
  else
    D = e; # s x 1
  endif
  
  
  # vetor gradiente local da oculta...
  su = sigmoid(u); # vetor... 1 x r
  
  dm = zeros(r, 1); # vetor... 1 x r
  for i =1:r
    dm(i) = dot(D, m(i, :)); # sum(Dk mki)
  endfor
  
  m = m + alpha * (z' * D'); # r x s
  
  # derivada so sigmoid de u...
  su_deriv = Dot(su , ones(length(su)) - su); # r x 1
  d = Dot( su_deriv , dm); # r x 1
  
  w = w + alpha * (d * x); # r x nx
  
   
endfunction