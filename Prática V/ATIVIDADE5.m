function ATIVIDADE5
  #C�digo chamar� a fun��o dtheta.m
  
  N=34;
  
  r = (1+N/100);    #[m]
  m = 1;            #[kg]
  g = 9.81;         #[m/s^2]
  c = 0.5;
  
  tempo = [0:0.1:30];   #De 0 a 30 segundos
  inicio = [0;15];  #O 0 indica o theta inicial e o 15 � o theta_ponto inicial
  [t,theta]=ode45(@(t,theta) dtheta(t,theta), tempo,inicio); 
  #chama a fun��o e cria 3 vetores, um de tempo, outro de theta e outro de theta ponto.
  
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
   
  T=m.*VetThetaPonto.*VetThetaPonto*r + cos(VetTheta).*m*g; #Valor da tra��o na corda

  figure(4);
  img1=plot(t, T, '-r');
  grid on;
  xlabel('Tempo (s)'); ylabel('Tra��o (N)');
  
  f=VetThetaPonto./(2*pi); #Valor da frequ�ncia
  
  figure(5);
  img1=plot(t, f, '-r');
  grid on;
  xlabel('Tempo (s)'); ylabel('Frequ�ncia (Hz)');
  
  #Quantas voltas o p�ndulo executa antes da parada?
  #D� para notar, atrav�s dos gr�ficos, que quanto mais pr�ximo de +-19 radianos, menos o p�ndulo oscila
  #Ou seja, mais pr�ximo de parado ele se encontra, ent�o:
  Voltas=18.8/(2*pi) #= 2.9921
  #Logo, � necess�rio aproximar o valor de voltas pra cima, j� que � uma aproxima��o
  #Ent�o, o p�ndulo consegue realizar 3 oscila��es completas antes da parada.
  