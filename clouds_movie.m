%create a movie of the buoyancy, B, as a function of time

function clouds_movie(B,X,Z,NT)

v = VideoWriter('B_movie.avi');
v.FrameRate=15;
open(v);

for j = 1:NT
    surf(X/1000,Z/1000,(B(:,:,j))); 
    title('$B\,\,\,\,\,(\frac{m}{s^{2}}$)','Interpreter','latex')
    xlabel('x (km)');
    ylabel('z (km)');
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

end