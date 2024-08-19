function rot3dmain_aula(rot)

  N=34;
  
  Thetag=-(90+N)/4 #Graus
  Thetar=Thetag*pi/180; #RAD
  
if rot==1
  % Rotacao #1 - Em z de Thetar, depois em y de Thetar
  rotord=321;
  phi=[0:-pi/400:Thetar]; 
  phixv=[0*phi 0*phi]; 
  phiyv=[0*phi phi];
  phizv=[phi phi(end)+0*phi];
elseif rot==2
  % Rotacao #2 - Em y de Thetar, depois em z de Thetar
  rotord=123;
  phi=[0:-pi/400:Thetar]; 
  phixv=[0*phi 0*phi]; 
  phiyv=[phi phi(end)+0*phi];
  phizv=[0*phi phi];
elseif rot==3
  % Rotacao #3 - Em z de Thetar, depois em y de Thetar, depois em x de Thetar*4
  rotord=321;
  phi=[0:-pi/400:Thetar]; 
  phi2=[0:-pi/100:Thetar*4]; 
  phizv=[phi phi(end)+0*phi phi(end)+0*phi]; 
  phiyv=[0*phi phi phi(end)+0*phi];
  phixv=[0*phi2 0*phi2 phi2];
elseif rot==4
  % Rotacao #4 - Em x, y e z simultâneo de Thetar e Thetar*4 (123)
  rotord=321;
  phi=[0:-pi/400:Thetar]; 
  phi2=[0:-pi/100:Thetar*4];
  phixv=[phi2];
  phiyv=[phi];
  phizv=[phi]; 
end

for id=1:length(phixv)
    phix=phixv(id); phiy=phiyv(id); phiz=phizv(id);
    Rx = [1 0 0;0 cos(phix) -sin(phix);0 sin(phix) cos(phix)];
    Ry = [cos(phiy) 0 sin(phiy);0 1 0;-sin(phiy) 0 cos(phiy)];
    Rz = [cos(phiz) -sin(phiz) 0;sin(phiz) cos(phiz) 0;0 0 1];
    if rotord==321 R(:,:,id)=Rz*Ry*Rx; 
    elseif rotord==123 R(:,:,id)=Rx*Ry*Rz; 
    end
end

fcnrot3d(R)
