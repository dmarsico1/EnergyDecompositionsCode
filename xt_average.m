function output = xt_average(u,c1,c2,c3,opt)

if(opt==1)
    output=stack(c1,c2,1,c3,(1/(c2*c3))*sum(sum(u,2),4));
else
    output=(1/(c2*c3))*sum(sum(u,2),4);
end

end