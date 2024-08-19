function MolasSerie
  
  N=34;
  b=0.2;
  Kmin=10; #kN/m
  DeltaK=50+0.5*N; #kN/m
  n=[1:1:10]; #Número de Molas em série
  kn = Kmin + DeltaK*e.^(-b*n);
  
  
  Ka1=[kn(1)+kn(2) -kn(2) 0 0 0 0 0 0 0 0; 
  -kn(2) kn(2)+kn(3) -kn(3) 0 0 0 0 0 0 0; 
  0 -kn(3) kn(3)+kn(4) -kn(4) 0 0 0 0 0 0; 
  0 0 -kn(4) kn(4)+kn(5) -kn(5) 0 0 0 0 0; 
  0 0 0 -kn(5) kn(5)+kn(6) -kn(6) 0 0 0 0; 
  0 0 0 0 -kn(6) kn(6)+kn(7) -kn(7) 0 0 0; 
  0 0 0 0 0 -kn(7) kn(7)+kn(8) -kn(8) 0 0; 
  0 0 0 0 0 0 -kn(8) kn(8)+kn(9) -kn(9) 0;
  0 0 0 0 0 0 0 -kn(9) kn(9)+kn(10) -kn(10);  
  0 0 0 0 0 0 0 0 -kn(10) kn(10)];
  
  Ka1=Ka1.*1000; #transformando de kN/m para N/m
  
  F1=[0;0;0;0;-50;0;0;0;0;100]; #vetor força (N)
  u1=Ka1\F1 #em metros
  
  #Parte 2
  
  Ka2=[kn(1)+kn(2) -kn(2) 0 0 0 0 0 0 0; 
  -kn(2) kn(2)+kn(3) -kn(3) 0 0 0 0 0 0; 
  0 -kn(3) kn(3)+kn(4) -kn(4) 0 0 0 0 0; 
  0 0 -kn(4) kn(4)+kn(5) -kn(5) 0 0 0 0; 
  0 0 0 -kn(5) kn(5)+kn(6) -kn(6) 0 0 0; 
  0 0 0 0 -kn(6) kn(6)+kn(7) -kn(7) 0 0; 
  0 0 0 0 0 -kn(7) kn(7)+kn(8) -kn(8) 0; 
  0 0 0 0 0 0 -kn(8) kn(8)+kn(9) -kn(9);  
  0 0 0 0 0 0 0 -kn(9) kn(9)+kn(10)];

  
  F2=[0;0;0;0;0;0;0;0;kn(10)*0.03*1000];  #N
  
  Ka2=Ka2.*1000; #transformando de kN/m para N/m
  u2=Ka2\F2;
  u2(10,1)=0.03
  
  #Parte 3
  
  figure(1);
  img1=plot(n, u1, '-.r', n, u2, '-.b');
  grid on;
  axis([1 10 0 u2(10)]);
  xlabel('n'); ylabel('u_{n} (m)');
  hold on
 
  legend(img1,{"Exercício 1","Exercício 2"}, "location", "east"); title("u_{n} x n");

