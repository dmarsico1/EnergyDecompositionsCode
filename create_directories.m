%Create directory called "Univariate" to put the plots of the EOFS into

mkdir Univariate
copyfile mode_plot.m Univariate
cd Univariate
for i=1:10
    mode_plot(V1,V2,V3,d1,d2,i,xt,zt);
end
