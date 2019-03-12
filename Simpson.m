function [int] = Simpson(f,low,high)
int=(high-low)/6*(f(low)+4*f((low+high)/2)+f(high));
end

