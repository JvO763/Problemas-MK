function ZerodeFuncao2
     
  g=9.81;
  d=0.2;
  Li=0.5;
  h=(0.5*0.5-(0.2*0.2))^(1/2);
  k=10000;
  m=(180+34); 
  u=[-h:0.001:h];
  P=m*g;
  
  x=[-0.5:0.01:0.5]; #valores de u indo de -0.5 a 0.5

  y=apl2(x);
  figure(2);
  img2=plot(x, y); #ESCOLHER A RAIZ
  set(img2,'LineWidth',2,'Color','r');
  grid on;
  axis([-0.5 0.5]);
  xlabel('Deslocamento'); ylabel('Valor da função f(u)');
  
  z1=fzero('apl2',0);
  z1
  z2=fzero('apl2',0.25);
  z3=fzero('apl2',0.5);
  z4=fzero('apl2',1);
  testandoz1=(P*((d*d+(h-z1)*(h-z1))^(1/2))/(h-z1))-2*k*(((d*d+(h-z1)*(h-z1))^(1/2))-0.5) #testando
  
  Kef=-((2.*k.*(h.-u).*(((d.^2.+(h.-u).^2).^(1/2))-0.5))./(u.*(d.^2.+(h.-u).^2).^(1/2)));
  Kef;
  
  figure(1);
  
  img1=plot(u, Kef);

  set(img1,'LineWidth',2,'Color','r');
  grid on;
  axis([-h h]);
  xlabel('Deslocamento'); ylabel('Coeficiente de Rigidez Efetiva');
 
  KnoEqEst=-(2.*k.*(h-z1)*(((d.^2.+(h-z1).^2).^(1/2))-0.5))./(z1.*(d.^2.+(h-z1).^2).^(1/2))
  -P/(z1)  #testado
  
