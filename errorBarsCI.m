function M = errorBarsCI(x,y,n,k)
    M = x(k)+[-1 1]*1.960*y(k)/sqrt(n);
    
    % x – mean
    % y – stdev
    % n – sample size
    % k – iteration
    
    % 90% CI alpha is 1.645
    % 95% CI alpha is 1.960
    % 99% CI alpha is 2.576
    
end
