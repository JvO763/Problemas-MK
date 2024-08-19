function f=apl2(u)
  
  g=9.81;
  d=0.2;
  Li=0.5;
  h=(0.5*0.5-(0.2*0.2))^(1/2);
  k=10000;
  m=(180+34);
  
  P=m*g;
  
  f=(P.*((d*d.+(h.-u).*(h.-u)).^(1/2))./(h.-u)).-2*k.*(((d*d.+(h.-u).*(h.-u)).^(1/2)).-0.5);
  
  ## P = 2*Fey (força elastica em y) 
  ## m.g = sen(teta)*2*k*?L (sendo ?L o novo tamanho da hipotenusa do triangulo - o Li=0.5)
  ## m.g = 2*k*( (d^2 + (h-u)^2)^(1/2) - 0,5)*sen(teta)
  ## m.g = 2*k*( (d^2 + (h-u)^2)^(1/2) - 0,5)*((h-u)/(d^2+(h-u)^2)^(1/2)
  ## P*(d^2+(h-u)^2)^(1/2)/(h-u) = 2*k*( (d^2 + (h-u)^2)^(1/2) - 0,5)
  ## P*(d^2+(h-u)^2)^(1/2)/(h-u) - 2*k*( (d^2 + (h-u)^2)^(1/2) - 0,5) = 0