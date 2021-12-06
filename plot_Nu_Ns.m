%function to plot the squared buoyancy frequencies

function plot_Nu_Ns(Nu,Ns,Nu_after,zt,opt)

%opt=1 means just regular Nu and Ns
%opt=2 means that they are the adjusted versions

h=figure;
plot(zt,Ns,'*')
xlabel('$z\,\,(m)$','Interpreter','latex')
ylabel('$N_{s}^{2}(z)\,\,\,\,\,(s^{-2})$','Interpreter','latex')
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
if(opt==1)
    saveas(h,'Ns^2.pdf');
    save('Ns^2.mat','Ns')
else
    saveas(h,'Ns^2_adjusted.pdf');
    save('Ns^2_adjusted.mat','Ns')
end

h=figure;
plot(zt,Nu,'*')
axis tight
xlabel('$z\,\,(m)$','Interpreter','latex')
ylabel('$N_{u}^{2}(z)\,\,\,\,\,(s^{-2})$','Interpreter','latex')
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
if(opt==1)
    saveas(h,'Nu^2.pdf');
    save('Nu^2.mat','Nu')
else
    saveas(h,'Nu^2_adjusted.pdf');
    save('Nu^2_adjusted.mat','Nu')
end

%plot Nu and the adjusted Nu on the same plot

h=figure;
plot(Nu,zt,'r',Nu_after,zt,'o','LineWidth',2.2,'MarkerSize',3.5,'MarkerFaceColor',[0 0 1])
axis tight
ylabel('$z\,\,(m)$','Interpreter','latex')
xlabel('$N_{u}^{2}(z)\,\,\,\,\,(s^{-2})$','Interpreter','latex')
legend({'$N_{u}^{2}$','Adjusted $N_{u}^{2}$'},'Interpreter','latex','Location','northwest')
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
saveas(h,'Nu^2_and_adjusted_Nu^2.pdf');

end