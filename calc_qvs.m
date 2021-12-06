%compute the saturation mixing ratio as a function of temperature and pressure based on the formula used in the LES
%code

function output = calc_qvs(T,p)

c0=0.6114327e+03;
c1=0.5027041e+02;
c2=0.1875982e+01;
c3=0.4158303e-01;
c4=0.5992408e-03;
c5=0.5743775e-05;
c6=0.3566847e-07;
c7=0.1306802e-09;
c8=0.2152144e-12;
x=max(-80.,T-273.16);
esi=c0+x*(c1+x*(c2+x*(c3+x*(c4+x*(c5+x*(c6+x*(c7+x*c8)))))));
output=.622*esi/(p-esi);


end