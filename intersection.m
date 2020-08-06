function [fval,T]=intersection(mutset0,mutset00);
[m,l]=size(mutset0);
[n,l]=size(mutset00);
c=ones(m+n,1);
A0=[mutset0',-mutset00'];
a1=[ones(1,m),zeros(1,n)];
b1=[zeros(1,m),ones(1,n)];
Aeq=[A0;a1;b1];
beq=[zeros(l,1);1;1];
lb=zeros(m+n,1);
ub=ones(m+n,1);
[s,fval]=linprog(c,[],[],Aeq,beq,lb,ub);

if length(s)==0
    T=1;%un-intersection
else 
    T=0;%intersection
end
end
