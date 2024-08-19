function ATIVIDADE5
  #Código chamará a função dtheta.m
  
  N=34;
  
  r = (1+N/100);    #[m]
  m = 1;            #[kg]
  g = 9.81;         #[m/s^2]
  c = 0.5;
  
  tempo = [0:0.1:30];   #De 0 a 30 segundos
  inicio = [0;15];  #O 0 indica o theta inicial e o 15 é o theta_ponto inicial
  [t,theta]=ode45(@(t,theta) dtheta(t,theta), tempo,inicio); 
  #chama a função e cria 3 vetores, um de tempo, outro de theta e outro de theta ponto.
  
  VetThetaPonto=theta(:,2);
  VetTheta=theta(:,1);
  
  figure(1);
  img1=plot(t, VetTheta, '-r');
  grid on;
  xlabel('Tempo (s)'); ylabel('\theta (RAD)');
  
  figure(2);
  img1=plot(t, VetThetaPonto, '-r');
  grid on;
  xlabel('Tempo (s)'); ylabel('\omega (RAD/s)');
  
  figure(3);
  img1=plot(VetTheta, VetThetaPonto, '-r');
  grid on;
  xlabel('\theta (RAD)'); ylabel('\omega (RAD/s)');
   
  T=m.*VetThetaPonto.*VetThetaPonto*r + cos(VetTheta).*m*g; #Valor da tração na corda

  figure(4);
  img1=plot(t, T, '-r');
  grid on;
  xlabel('Tempo (s)'); ylabel('Tração (N)');
  
  f=VetThetaPonto./(2*pi); #Valor da frequência
  
  figure(5);
  img1=plot(t, f, '-r');
  grid on;
  xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
  
  #Quantas voltas o pêndulo executa antes da parada?
  #Dá para notar, através dos gráficos, que quanto mais próximo de +-19 radianos, menos o pêndulo oscila
  #Ou seja, mais próximo de parado ele se encontra, então:
  Voltas=18.8/(2*pi) #= 2.9921
  #Logo, é necessário aproximar o valor de voltas pra cima, já que é uma aproximação
  #Então, o pêndulo consegue realizar 3 oscilações completas antes da parada.
  