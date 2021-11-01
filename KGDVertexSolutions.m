function [Wm,Lm,Wmt,Lmt,Wk,Lk,Wkt,Lkt] = KGDVertexSolutions(t,xi,Cp,Ep,Kp,mup,Q0)

  %M vertex, storage viscosity
  Wm = 1.1265*(mup*Q0^3*t(end)^2/Ep)^(1/6)*(1+xi).^0.588.*(1-xi).^(2/3);
  Lm = 0.6159*(Q0^3*Ep*t.^4/mup).^(1/6);

  %Mt vertex, leak-off viscosity
  Wmt = 0.8165*(mup*Q0^3*t(end)/Ep/Cp^2)^(1/4)*(1+xi).^0.520.*(1-xi).^(5/8);
  Lmt = 0.3183*Q0*t.^(1/2)/Cp;

  %K vertex, storage toughness
  Wk = 0.6828*(Kp^2*Q0*t(end)/Ep^2)^(1/3)*(1-xi.^2).^(1/2);
  Lk = 0.9324*(Ep*Q0*t/Kp).^(2/3);

  %Kt vertex, leak-off toughness
  Wkt = 0.3989*(Kp^4*Q0^2*t(end)/Ep^4/Cp^2)^(1/4)*(1-xi.^2).^(1/2);
  Lkt = 0.3183*Q0*t.^(1/2)/Cp;
  
end