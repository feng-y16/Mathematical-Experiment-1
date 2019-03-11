function [] = interpolation_compare(f,low,high,num_of_points)
x=linspace(low,high,num_of_points);
y=zeros(num_of_points,1);
for i=1:1:num_of_points
    y(i)=f(x(i));
end
p=linspace(low-2,high+2,20*num_of_points);
y_p=zeros(20*num_of_points,1);
for i=1:1:20*num_of_points
    y_p(i)=f(p(i));%为y=f(x)的图像提供数据
end

y1=polyinterp(x,y,p);        % 多项式插值
y2= interp1(x,y,p);          % 分段线性插值
y3= interp1(x,y,p,'pchip');  % 分段三次插值
y4= interp1(x,y,p,'spline'); % 三次样条插值

subplot(2,2,1); 
plot(p,y_p,p,y1,'LineWidth',3)
hold
scatter(x,y,20,'filled')
xlabel('x')
ylabel('$y=\frac{1}{1+x^2}$','interpreter','Latex')
title('多项式插值')
set(gca,'FontSize',18)

subplot(2,2,2); 
plot(p,y_p,p,y2,'LineWidth',3)
hold
scatter(x,y,20,'filled')
xlabel('x')
ylabel('$y=\frac{1}{1+x^2}$','interpreter','Latex')
title('分段线性插值')
set(gca,'FontSize',18)

subplot(2,2,3); 
plot(p,y_p,p,y3,'LineWidth',3)
hold
scatter(x,y,20,'filled')
xlabel('x')
ylabel('$y=\frac{1}{1+x^2}$','interpreter','Latex')
title('分段三次插值')
set(gca,'FontSize',18)

subplot(2,2,4); 
plot(p,y_p,p,y4,'LineWidth',3)
hold
scatter(x,y,20,'filled')
xlabel('x')
ylabel('$y=\frac{1}{1+x^2}$','interpreter','Latex')
title('三次样条插值')
set(gca,'FontSize',18)

set(gcf,'outerposition',get(0,'screensize'));
saveas(gcf,['1_1_' num2str(num_of_points) 'points.png'])
close
%suptitle(['插值结果比较_' num2str(num_of_points) '个插值点'])
end

