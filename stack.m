function output = stack(d1,d2,d3,d4,y)
%y is a column vector
%d1 is z,d2 is x, d3 is y, d4 is time
stack=zeros(d1,d2,d3,d4);
for i=1:d4
    for j=1:d2
        stack(:,j,1,i)=y;
    end
end

output=stack;

end