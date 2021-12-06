%function to calculate the data about the eigenvalues of the
%covariance/correlation matrices

function eig_plot(S1,NT,num_eig,opt,eig_opt)

%eig_opt=1 means the input is the singular values
%eig_opt=2 means that the input is the actual eigenvalues

eig_vec=zeros(1,num_eig);
if(eig_opt==1)
    Total_Energy=sum(sum(((1/NT)*S1.*S1)));
    for i=1:num_eig
        eig_vec(i)=(1/NT)*(S1(i,i)^2);
    end

    eig_vec_percent=eig_vec/Total_Energy;

    first_n_eigenvalues_energy=cumsum(eig_vec_percent);
else
    Total_Energy=sum(sum(S1));
    for i=1:num_eig
        eig_vec(i)=S1(i,i);
    end
    eig_vec_percent=eig_vec/Total_Energy;

    first_n_eigenvalues_energy=cumsum(eig_vec_percent);
end

h=figure;
plot(1:num_eig,eig_vec,'o','MarkerFaceColor','b')
xlabel('Eigenvalue')
if(opt==1)
    %title('Eigenvalues of Univariate $b_{u}$ Covariance Matrix','interpreter','Latex')
    title('Eigenvalues of Univariate $b_{u}$ Correlation Matrix','interpreter','Latex')
    ti = get(gca,'TightInset');
    set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
    set(gca,'units','centimeters')
    pos = get(gca,'Position');
    ti = get(gca,'TightInset');
    set(gcf, 'PaperUnits','centimeters');
    set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    saveas(h,'univariate_bu_correlation_matrix_eigs.pdf');
    save('univariate_bu_correlation_matrix_eigs.mat','S1')
    fileID = fopen('energy_of_first_n_bu_uni_cov_evals.txt','w');
    fprintf(fileID,'%-11s  %-11s\n','n','Percent Energy in First n Eigenvalues');
    fprintf(fileID,'%-11f  %-11.4f\n',[(1:num_eig);first_n_eigenvalues_energy]);
    fclose(fileID);
elseif(opt==2)
    %title('Eigenvalues of Univariate $b_{s}$ Covariance Matrix','interpreter','Latex')
    title('Eigenvalues of Univariate $b_{s}$ Correlation Matrix','interpreter','Latex')
    ti = get(gca,'TightInset');
    set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
    set(gca,'units','centimeters')
    pos = get(gca,'Position');
    ti = get(gca,'TightInset');
    set(gcf, 'PaperUnits','centimeters');
    set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    saveas(h,'univariate_bs_correlation_matrix_eigs.pdf');
    save('univariate_bs_covariance_matrix_eigs.mat','S1')
    fileID = fopen('energy_of_first_n_bs_uni_cov_evals.txt','w');
    fprintf(fileID,'%-11s  %-11s\n','n','Percent Energy in First n Eigenvalues');
    fprintf(fileID,'%-11f  %-11.4f\n',[(1:num_eig);first_n_eigenvalues_energy]);
    fclose(fileID);
elseif(opt==3)
    %title('Eigenvalues of Univariate $B$ Covariance Matrix','interpreter','Latex')
    title('Eigenvalues of Univariate $B$ Correlation Matrix','interpreter','Latex')
    ti = get(gca,'TightInset');
    set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
    set(gca,'units','centimeters')
    pos = get(gca,'Position');
    ti = get(gca,'TightInset');
    set(gcf, 'PaperUnits','centimeters');
    set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    saveas(h,'univariate_B_correlation_matrix_eigs.pdf');
    save('univariate_B_covariance_matrix_eigs.mat','S1')
    fileID = fopen('energy_of_first_n_B_uni_cov_evals.txt','w');
    fprintf(fileID,'%-11s  %-11s\n','n','Percent Energy in First n Eigenvalues');
    fprintf(fileID,'%-11f  %-11.4f\n',[(1:num_eig);first_n_eigenvalues_energy]);
    fclose(fileID);
end


h=figure;
plot(1:num_eig,eig_vec_percent,'o','MarkerFaceColor','b')
xlabel('Eigenvalue')
if(opt==1)
    title({'Eigenvalues of Univariate $b_{u}$ Correlation Matrix','as a Fraction of Total Energy'},'interpreter','Latex')
    ti = get(gca,'TightInset');
    set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
    set(gca,'units','centimeters')
    pos = get(gca,'Position');
    ti = get(gca,'TightInset');
    set(gcf, 'PaperUnits','centimeters');
    set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    saveas(h,'univariate_bu_correlation_matrix_eigs_percent.pdf');
elseif(opt==2)
    title({'Eigenvalues of Univariate $b_{s}$ Correlation Matrix','as a Fraction of Total Energy'},'interpreter','Latex')
    ti = get(gca,'TightInset');
    set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
    set(gca,'units','centimeters')
    pos = get(gca,'Position');
    ti = get(gca,'TightInset');
    set(gcf, 'PaperUnits','centimeters');
    set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    saveas(h,'univariate_bs_correlation_matrix_eigs_percent.pdf');
elseif(opt==3)
    title({'Eigenvalues of Univariate $B$ Correlation Matrix','as a Fraction of Total Energy'},'interpreter','Latex')
    ti = get(gca,'TightInset');
    set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
    set(gca,'units','centimeters')
    pos = get(gca,'Position');
    ti = get(gca,'TightInset');
    set(gcf, 'PaperUnits','centimeters');
    set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
    saveas(h,'univariate_B_correlation_matrix_eigs_percent.pdf');
end


end
