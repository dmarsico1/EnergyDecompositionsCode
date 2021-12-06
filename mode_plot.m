%function to plot the saturated, unsaturated, and B buoyancy modes.

%the surf and contour plots for each mode are made, for a total of six
%plots


function mode_plot(U1,U2,U3,c1,c2,mode_number,xgrid,zgrid)

plotmode1=vec2mat(U1(1:c1*c2,mode_number),c2);
plotmode2=vec2mat(U2(1:c1*c2,mode_number),c2);
plotmode3=vec2mat(U3(1:c1*c2,mode_number),c2);

str_mode=sprintf('%.1i',mode_number);

h=figure;
surf(xgrid,zgrid,plotmode1)
xlabel('x (m)')
ylabel('z (m)')
title({strcat('B-Mode','-',str_mode)},'interpreter','Latex')
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
saveas(h,strcat('Univariate_Buoyancy_Mode','-',str_mode,'.pdf'));

h=figure;
surf(xgrid,zgrid,plotmode2)
xlabel('x (m)')
ylabel('z (m)')
title({strcat('$b_{u}$-Mode','-',str_mode)},'interpreter','Latex')
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
saveas(h,strcat('Univariate_Unsaturated_Buoyancy_Mode','-',str_mode,'.pdf'));

h=figure;
surf(xgrid,zgrid,plotmode3);
xlabel('x (m)')
ylabel('z (m)')
title({strcat('$b_{s}$-Mode','-',str_mode)},'interpreter','Latex')
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
saveas(h,strcat('Univariate_Saturated_Buoyancy_Mode','-',str_mode,'.pdf'));


h=figure;
contour(xgrid,zgrid,plotmode1)
axis tight
xlabel('x (m)')
ylabel('z (m)')
title({strcat('B-Mode','-',str_mode)},'interpreter','Latex')
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
colorbar
saveas(h,strcat('Univariate_Buoyancy_Mode_contour','-',str_mode,'.pdf'));

h=figure;
contour(xgrid,zgrid,plotmode2)
axis tight
xlabel('x (m)')
ylabel('z (m)')
title({strcat('$b_{u}$-Mode','-',str_mode)},'interpreter','Latex')
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
colorbar
saveas(h,strcat('Univariate_Unsaturated_Buoyancy_Mode_contour','-',str_mode,'.pdf'));

h=figure;
contour(xgrid,zgrid,plotmode3);
axis tight
xlabel('x (m)')
ylabel('z (m)')
title({strcat('$b_{s}$-Mode','-',str_mode)},'interpreter','Latex')
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
colorbar
saveas(h,strcat('Univariate_Saturated_Buoyancy_Mode_contour','-',str_mode,'.pdf'));

%save the plot data
save(strcat('Univariate_Buoyancy_Mode','-',str_mode,'.mat'),'plotmode1')
save(strcat('Univariate_Unsaturated_Buoyancy_Mode','-',str_mode,'.mat'),'plotmode2')
save(strcat('Univariate_Saturated_Buoyancy_Mode','-',str_mode,'.mat'),'plotmode3')

end