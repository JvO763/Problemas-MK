function ATIVIDADE4
  
  N=34;

Tetai=0; Tetaf=6*pi; dTeta=pi/6;
[Tetav,Resultv] = ode45(@(Teta) 100*((52-48*cos(Teta))^(1/2)), [Tetai:dTeta:Tetaf],[0]);
Resultv(37)

tfinal = fzero(@(t) 670*t-(6.7*t^2)/2 - Resultv(37),1);

printf("Passou %g segundos até completar-se 3 voltas", tfinal)

intervalo=0.1;

Vetor_t=[0:intervalo:tfinal];

[t,Vetor_Teta]=ode45(@(t,Vetor_Teta) ((670*670-67*67*2*t+6.7*6.7*t^2)/(520000-480000*cos(Vetor_Teta)))^(1/2), [0:intervalo:tfinal],[0]);

Vetor_r=200*(3-2*cos(Vetor_Teta)); #mm
Vetor_DTeta=((670.-6.7*t).^2./(520000.-480000.*cos(Vetor_Teta))).^(1/2); #rad/s
Vetor_Dr=Vetor_DTeta.*400.*sin(Vetor_Teta); #mm/s
Vetor_v=0.05*(100+N)*(100-Vetor_t); #mm/s

  figure(1);
    img1=plot(t, Vetor_r, '-.r');
    grid on;
    axis([0 tfinal]);
    xlabel('Tempo (s)'); ylabel('Raio (mm)');
  hold on
  figure(2);
    img1=plot(t, Vetor_Teta, '-.r');
    grid on;
    axis([0 tfinal]);
    xlabel('Tempo (s)'); ylabel('Teta (Rad)');
  hold on
  figure(3);
    img1=plot(t, Vetor_DTeta, '-.r');
    grid on;
    xlabel('Tempo (s)'); ylabel('Derivada de Teta (Rad/s)');
  hold on 
  figure(4);
    img1=plot(t, Vetor_Dr, '-.r');
    grid on;
    xlabel('Tempo (s)'); ylabel('Derivada do Raio (mm/s)');
  hold on
  figure(5);
    img1=plot(t, Vetor_v, '-.r');
    grid on;
    axis([0 tfinal]);
    xlabel('Tempo (s)'); ylabel('Velocidade(mm/s)');
  hold on
  figure(6);
    img1=plot(Vetor_Teta, Vetor_r, '-.r');
    grid on;
    xlabel('Teta (Rad)'); ylabel('Raio (mm)');
  hold on

