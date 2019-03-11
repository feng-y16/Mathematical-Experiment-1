function [int] = compound_Simpson(f,low,high,num_of_points)
x=linspace(low,high,2*num_of_points-1);
y=zeros(2*num_of_points-1,1);
for i=1:1:2*num_of_points-1
    y(i)=f(x(i));
end

int=2*sum(y)+2*sum(y(2:2:end))-y(1)-y(2*num_of_points-1);
int=int/6*(x(3)-x(1));
end

