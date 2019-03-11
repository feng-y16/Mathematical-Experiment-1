function [table] = maketable(f,max)
table=zeros(max+2,11);
table(1,2:11)=linspace(0,0.9,10);
table(2:max+2,1)=linspace(0,max,max+1)';
for i=0:1:9
    for j=0:1:max
        table(j+2,i+2)=f(j+0.1*i);
    end
end
end

