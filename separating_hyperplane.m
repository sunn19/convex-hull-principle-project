function [w,b] = separating_hyperplane(mutset0,mutset00)
%Input:
%      mutset0 is m*col dimensional matrix
%      mutset00 is n*col dimensional matrix
%Output:
%      separating hyperplane: w^T*x + b = 0
%      w is the normal vector
%      b is the offset item

%mosek should be added in path before running, which can be downloaded in https://www.mosek.com

[m,col] = size(mutset0);
[n,col] = size(mutset00);
mutset = [mutset0;mutset00];
[N,col] = size(mutset);
H = diag([ones(col,1);0]);
f = zeros(col+1,1);
y(1:m) = 1;y(m+1:m+n) = -1;
A = [];
for i = 1:N
    A(i,:) = [-y(i)*mutset(i,:),-y(i)];
end
b = -ones(N,1);
mosek_path = '/Users/sunnan/mosek/9.2/toolbox/r2015a';
addpath(mosek_path);
try
    [x,fval] = quadprog(H,f,A,b,[],[],[],[],[]);
catch ME
    disp( 'Error with mosek toolbox, use built-in quadprog instead. ');
    rmpath(mosek_path);
    opts = optimoptions('quadprog','Display','off');
    [x,fval] = quadprog(H,f,A,b,[],[],[],[],[],opts);
    addpath(mosek_path);
end
w = x(1:col);b = x(col+1);

end

