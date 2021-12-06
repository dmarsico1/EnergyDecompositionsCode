function output = x_average(c1,c2,c3,u)
%u is a two dimensional x-z array 

output=stack(c1,c2,1,c3,(1/c2)*sum(u,2));

end