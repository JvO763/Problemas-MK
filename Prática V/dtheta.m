function f = dtheta(t,theta)
  N = 34;
  m = 1;          #[kg]
  g = 9.81;       #[m/s^2]
  r = (1+N/100);  #[m]
  c = 0.5;

  f = [ (theta(2)) ; (-(c/m)*theta(2)-(g/r)*sin(theta(1))) ];