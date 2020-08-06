function coeff = Lda1(training,group)
    class = sort(unique(group));
    C = arrayfun(@(x)training(group==x,:),class,'UniformOutput',false);
    
    mu  = mean(training);
    col = size(training,2);
    Sb = zeros(col,col);
    Sw = zeros(col,col);
    for i = class'
        c = C{i};
        x = mean(c) - mu;
        Sb = Sb + x'*x*length(c);
        Sw = Sw - cov(c)*length(training);
    end
    [V,D] = eigs(pinv(Sw)*Sb);
    coeff=real(V(:,1:2));
end