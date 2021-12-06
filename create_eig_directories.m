%Create a directory and compute the information about the eigenvalues for
%the saturated, unsaturated and phase change EOF analysis

eig_array={D2,D3,D1};
NT=size(D1,2);
mkdir Univariate_Eigenvalues
copyfile eig_plot.m Univariate_Eigenvalues
cd Univariate_Eigenvalues
for i=1:3
    eig_plot(cell2mat(eig_array(i)),NT,20,i,2);
end
