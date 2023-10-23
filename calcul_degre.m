function [lambda,pho] = calcul_degre(H)
format rat
[nb_parite, nb_variables]=size(H);

h_col=sum(H);
[GC,GR] = groupcounts(h_col');
lengc=length(GC);

for i=1:lengc

    lambda_t(i)=GC(i)/nb_variables;
    deg_lambda(i) = GR(i)-1;
end

lambda= @(x) lambda_t .* x.^deg_lambda;


h_lig=sum(H');
[GC,GR] = groupcounts(h_lig');
lengc=length(GC);

for i=1:lengc
    pho_t(i)=GC(i)/nb_parite
    deg_pho(i) = GR(i)-1
end

pho= @(x) pho_t .* x.^deg_pho;

end

