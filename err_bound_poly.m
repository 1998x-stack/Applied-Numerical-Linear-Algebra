function [p,bp,p_delta,real_err,err_bound,cond_poly]=err_bound_poly(x,epsilon)

    A=[1,-18,144,-672,2016,-4032,5376,-4608,2304,-512];
    

    p=A(1);
    bp=abs(A(1));
    p_delta=A(1);
    for i=2:length(A)
        p=p*x+A(i);
        bp=abs(x)*bp+abs(A(i));
        
        
        delta=2*(rand(1)-0.5)*epsilon;
        delta_=2*(rand(1)-0.5)*epsilon;
        p_delta=(p_delta*x*(1+delta)+A(i))*(1+delta_);
    end
    real_err=abs(p_delta-p);
    err_bound=2*(length(A)-1)*epsilon*bp;
    cond_poly=abs(bp/p);

end
