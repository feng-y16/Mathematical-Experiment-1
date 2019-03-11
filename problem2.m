f=inline('1/sqrt(2*pi)*exp(-0.5*x.^2)','x');
%f_fourth_derivative_negative=inline('-abs((2251799813685248*exp(-x^2/2))/1881475027264087 - (4503599627370496*x^2*exp(-x^2/2))/1881475027264087 + (2251799813685248*x^4*exp(-x^2/2))/5644425081792261)','x');

temp=abs(quad(f,-100,0)-0.5);
for i=10:1:100
    if abs(compound_Simpson(f,-100,0,i)-0.5)<temp
        break
    end
end
fprintf('i=%d\n',i);
tic
quad(f,-100,0);
toc
tic
compound_Simpson(f,-100,0,i);
toc

format hex
normcdf(0)
0.5

f_Simpson=inline('compound_Simpson(@(x)1/sqrt(2*pi)*exp(-0.5*x.^2),-100,x,92)','x');
f_quad=inline('quad(@(x)1/sqrt(2*pi)*exp(-0.5*x.^2),-100,x)','x');

table1=maketable(f_Simpson,5);
table2=maketable(f_quad,5);

error_test=zeros(51);
index=1;
for i=0:0.1:5
    error_test(index)=quad(f,-100,i,1e-9)-normcdf(i);
    index=index+1;
end
max(error_test(i))




num_of_table_points=60;
low=-3;
high=3;

x=linspace(low,high,num_of_table_points);
y1=zeros(num_of_table_points,1);
y2=zeros(num_of_table_points,1);
y3=zeros(num_of_table_points,1);
error1=zeros(num_of_table_points,1);
error2=zeros(num_of_table_points,1);
for i=1:1:num_of_table_points
    y1(i)=compound_Simpson(f,-100,x(i),92);
    y2(i)=quad(f,-100,x(i));
    y3(i)=quad(f,-100,x(i),1e-16);
    error1(i)=abs(y1(i)-y3(i));
    error2(i)=abs(y2(i)-y3(i));
end

test_points=500;
x_test=linspace(low,high,test_points);
y1_test=zeros(test_points,1);
y2_test=zeros(test_points,1);
error1_test=zeros(test_points,1);
error2_test=zeros(test_points,1);
for i=1:1:test_points
    [y1_test(i),error1_test(i)]=Phi_linear(x_test(i),x,y1,error1);
    [y2_test(i),error2_test(i)]=Phi_linear(x_test(i),x,y2,error2);
end
plot(x_test,error1_test,x_test,error2_test,'LineWidth',3);
legend('¸´ºÏÐÁÆÕÉ­·½·¨','quad·½·¨');
xlabel('x')
ylabel('Îó²î')
title('²åÖµÎó²îÍ¼')
set(gca,'FontSize',18)

set(gcf,'outerposition',get(0,'screensize'));
saveas(gcf,'2_1.png')
close

num_of_table_points=2000;
low=-5;
high=5;

x=linspace(low,high,num_of_table_points);
y1=zeros(num_of_table_points,1);
y2=zeros(num_of_table_points,1);
y3=zeros(num_of_table_points,1);
error1=zeros(num_of_table_points,1);
error2=zeros(num_of_table_points,1);
for i=1:1:num_of_table_points
    y1(i)=compound_Simpson(f,-100,x(i),92);
    y2(i)=quad(f,-100,x(i));
    y3(i)=quad(f,-100,x(i),1e-16);
    error1(i)=abs(y1(i)-y3(i));
    error2(i)=abs(y2(i)-y3(i));
end

test_points=300;
x_test=linspace(low,high,test_points);
y1_test=zeros(test_points,1);
y2_test=zeros(test_points,1);
error1_test=zeros(test_points,1);
error2_test=zeros(test_points,1);
for i=1:1:test_points
    [y1_test(i),error1_test(i)]=Phi_linear(x_test(i),x,y1,error1);
    [y2_test(i),error2_test(i)]=Phi_linear(x_test(i),x,y2,error2);
end
plot(x_test,error1_test,x_test,error2_test,'LineWidth',3);
legend('¸´ºÏÐÁÆÕÉ­·½·¨','quad·½·¨');
xlabel('x')
ylabel('Îó²î')
title('²åÖµÎó²îÍ¼')
set(gca,'FontSize',18)

set(gcf,'outerposition',get(0,'screensize'));
saveas(gcf,'2_2.png')
close