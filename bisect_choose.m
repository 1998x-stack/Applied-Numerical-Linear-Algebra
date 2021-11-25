function root=bisect_choose(choose_f,x_low,x_high,tol)
    if choose_f==1
        func=@(x)(poly1(x));
    elseif choose_f==2
        func=@(x)(poly2(x));
    elseif choose_f==3
        func=@(x)(poly3(x));
    else
        func=@(x)(poly4(x));
    end
    f_low=func([x_low]);
    f_high=func([x_high]);

    while x_high-x_low>2*tol
        x_mid=(x_low+x_high)/2;
        f_mid=func([x_mid]);
        
        if f_low*f_mid<0
            x_high=x_mid;
            f_high=f_mid;
        elseif f_mid*f_high<0
            x_low=x_mid;
            f_low=f_mid;
        else
            x_low=x_mid;
            x_high=x_mid;
        end
        
    end
    root=(x_low+x_high)/2;



end