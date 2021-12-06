%simple program to just plot the vertical velocity and cloud water at a
%given time

time=3530;

h=figure;

ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(gca,'units','centimeters')
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);


subplot(2,1,1)
contour(xt,zm,w(:,:,time))
axis tight
xlabel('x (m)')
ylabel('z (m) ')
title('(a)')
colorbar

subplot(2,1,2)
contour(xt,zt,1e3*ql(:,:,1,time))
axis tight
xlabel('x (m) ')
ylabel('z (m)')
title('(b)')
colorbar

saveas(h,strcat('variable_subplot',num2str(time),'.pdf'));