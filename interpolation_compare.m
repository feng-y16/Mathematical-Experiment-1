function [] = interpolation_compare(f,low,high,num_of_points)
x=linspace(low,high,num_of_points);
y=zeros(num_of_points,1);
for i=1:1:num_of_points
    y(i)=f(x(i));
end
p=linspace(low-2,high+2,20*num_of_points);
y_p=zeros(20*num_of_points,1);
for i=1:1:20*num_of_points
    y_p(i)=f(p(i));%Ϊy=f(x)��ͼ���ṩ����
end

y1=polyinterp(x,y,p);        % ����ʽ��ֵ
y2= interp1(x,y,p);          % �ֶ����Բ�ֵ
y3= interp1(x,y,p,'pchip');  % �ֶ����β�ֵ
y4= interp1(x,y,p,'spline'); % ����������ֵ

subplot(2,2,1); 
plot(p,y_p,p,y1,'LineWidth',3)
hold
scatter(x,y,20,'filled')
xlabel('x')
ylabel('$y=\frac{1}{1+x^2}$','interpreter','Latex')
title('����ʽ��ֵ')
set(gca,'FontSize',18)

subplot(2,2,2); 
plot(p,y_p,p,y2,'LineWidth',3)
hold
scatter(x,y,20,'filled')
xlabel('x')
ylabel('$y=\frac{1}{1+x^2}$','interpreter','Latex')
title('�ֶ����Բ�ֵ')
set(gca,'FontSize',18)

subplot(2,2,3); 
plot(p,y_p,p,y3,'LineWidth',3)
hold
scatter(x,y,20,'filled')
xlabel('x')
ylabel('$y=\frac{1}{1+x^2}$','interpreter','Latex')
title('�ֶ����β�ֵ')
set(gca,'FontSize',18)

subplot(2,2,4); 
plot(p,y_p,p,y4,'LineWidth',3)
hold
scatter(x,y,20,'filled')
xlabel('x')
ylabel('$y=\frac{1}{1+x^2}$','interpreter','Latex')
title('����������ֵ')
set(gca,'FontSize',18)

set(gcf,'outerposition',get(0,'screensize'));
saveas(gcf,['1_1_' num2str(num_of_points) 'points.png'])
close
%suptitle(['��ֵ����Ƚ�_' num2str(num_of_points) '����ֵ��'])
end

