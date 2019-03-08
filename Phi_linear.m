function [y_point,error_y] = Phi_linear(x_point,x,y,error)
point_num=length(x);
if x_point<x(1)||x_point>x(point_num)
    fprintf('Out of range!')
else
    for i=1:1:point_num
        if x_point<x(i)
            break;
        else
            if x_point==x(i)
                y_point=y(i);
                error_y=error(i);
                return
            end
        end
    end
    lambda1=(x(i)-x_point)/(x(i)-x(i-1));
    lambda2=(x_point-x(i-1))/(x(i)-x(i-1));
    y_point=lambda1*y(i-1)+lambda2*y(i);
    error_y=max(y(i)+error(i)-y_point,y_point-y(i-1)+error(i-1));
    return 
end
end

