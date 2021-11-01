function PlotKGDParametricSpace(t,Cp,Ep,Kp,mup,Q0)

  %dimensionless parameters
  tmmt = mup*Q0^3/(Ep*Cp^6);
  tau = t(end)/tmmt;
  Km = (Kp^4/(mup*Q0*Ep^3))^(1/4);
    
  %size of the parameteric space
  taumin = -20;
  taumax = 15;
  Kmin = -1.5;
  Kmax = 2;

  %K mk
  Kmkmin = log10(0.70);
  Kmkmax = log10(4.80);

  %tau*K^-4 kkt
  taukktmin = log10(1.25e-14);
  taukktmax = log10(1.76e5);

  %K mtkt
  Kktmtmin = log10(0.90);
  Kktmtmax = log10(4.80);

  %tau mmt
  taummtmin = log10(1.21e-13);
  taummtmax = log10(2.36e6);


  figure;
  hold on;

  %k
  tauk = taukktmin+4*Kmkmax;
  plot([taumin tauk],[Kmkmax,Kmkmax],'r-','linewidth',2);
  plot([tauk taukktmin+4*Kmax],[Kmkmax,Kmax],'r-','linewidth',2);
  text((taumin+tauk)/2,(Kmkmax+Kmax)/2,'K','fontsize',24);

  %m
  plot([taumin taummtmin],[Kmkmin,Kmkmin],'b-','linewidth',2);
  plot([taummtmin taummtmin],[Kmkmin,Kmin],'b-','linewidth',2);
  text((2*taumin+taummtmin)/3,(Kmkmin+Kmin)/2,'M','fontsize',24);

  %kt 
  taukt = taukktmax+4*Kktmtmax;
  plot([taukt taukktmax+4*Kmax],[Kktmtmax,Kmax],'m-','linewidth',2);
  plot([taukt taumax],[Kktmtmax,Kktmtmax],'m-','linewidth',2);
  text((taumax+taukt)/2,(2*Kktmtmax+Kmax)/3,'~K','fontsize',24);

  %mt
  plot([taummtmax,taummtmax],[Kmin,Kktmtmin],'g-','linewidth',2);
  plot([taummtmax,taumax],[Kktmtmin,Kktmtmin],'g-','linewidth',2);
  text((2*taummtmax+taumax)/3,(Kmin+Kktmtmin)/2,'~M','fontsize',24);

  %location of the selected parameters inside the parametric space
  logtau = log10(tau);
  logKm = log10(Km);
  logtau(logtau<taumin) = taumin;
  logtau(logtau>taumax) = taumax;
  logphi(logKm<Kmin) = Kmin;
  logphi(logKm>Kmax) = Kmax;   
  plot(logtau,logKm,'ko','markersize',8,'markerfacecolor','k');

  xlim([taumin taumax]);
  ylim([Kmin Kmax]);
  xlabel('\tau','fontsize',16);
  ylabel('K_m','fontsize',16);
   
end