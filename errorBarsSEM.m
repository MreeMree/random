function N = errorBarsSEM(x,y,n,k)
    N = x(k)+[-1 1]*1*y(k)/sqrt(n);
    
    % x – mean
    % y – stdev
    % n – sample size
    % k – iteration
    
end
