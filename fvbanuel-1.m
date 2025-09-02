function[p]= newton(f, df, p0, N, tol, tol_fp)
n=1;
q=f(p0);
while n<=N
    p=p0-q/df(p0); q=f(p);
    if abs(q)<tol_fp
       fprintf('|f(p)| is smaller than %0.2e' , tol_fp) ;
        return
    elseif abs(p-p0)<tol
       fprintf('p is converged with |p_{n+1}-p_{n}| smaller than %0.2e' , tol) ;
        return
    end
    n=n+1;
    p0=p;
end
    disp('Maximum number of iteration is reached')
end