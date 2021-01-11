function t = otsutest(im)

    levels = 256;
    
    n = numel(im);
    nb = 0;
    no = n;
    ub = 0;
    if isfloat(im)
        N = levels;
        im2 = round(im*(N-1));
    else
        im2 = im;
        N = double(intmax(class(im))) + 1;
    end

    h = histc(im2(:), 0:N);
    uo = sum(im2(:))/n;

    s2b = zeros(N,1);
    for T=1:N

        nt = h(T);
        nb_new = nb + nt;
        no_new = no - nt;

        if (nb_new == 0) || (no_new == 0)
            continue;
        end

        ub = (ub*nb + nt*(T-1)) / nb_new;
        uo = (uo*no - nt*(T-1)) / no_new;
        

        s2b(T) = nb*no*(ub - uo)^2;

        nb = nb_new;
        no = no_new;

    end

    [~,t] = max(s2b);

