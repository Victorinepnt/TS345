function [lambda,pho,deg_lambda,deg_pho] = calcul_degre(H)
% format rat

[lambda_t,deg_lambda] = lambda_func(H);
[pho_t, deg_pho] = pho_func(H);

lambda= @(x) lambda_t .* x.^deg_lambda;
pho= @(x) pho_t .* x.^deg_pho;

end

function [lambda_t,deg_lambda] = lambda_func(H)

    [nb_parite, nb_variables]=size(H);
    
    h_col=sum(H);
    [GC,GR] = groupcounts(h_col');
    lengc=length(GC);
    
    for i=1:lengc
    
        lambda_t(i)=GC(i)/nb_variables;
        deg_lambda(i) = GR(i)-1;
    end

end

function [pho_t, deg_pho] = pho_func(H)
    [nb_parite, nb_variables]=size(H);

    h_lig=sum(H');
    [GC,GR] = groupcounts(h_lig');
    lengc=length(GC);
    
    for i=1:lengc
        pho_t(i)=GC(i)/nb_parite
        deg_pho(i) = GR(i)-1
    end
end
