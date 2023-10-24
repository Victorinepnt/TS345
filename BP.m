function [msg] = BP(H, G)

[lambda,pho,deg_lambda,deg_pho] = calcul_degre(H);

[h,w] =  size(G);
trame = randi([0,1],1, h);
mot_code = (trame *G);
p=0.7;
eps=-1;
msg = BEC(mot_code,p,eps)';
for i=1:length(msg)

    if msg(i) == 0
        Lx(i) = 1e4;
    elseif msg(i) == eps
        Lx(i) = 0;  
     elseif msg(i) == 1
        Lx(i) = -1e4;
    end

end

[L_xc,L_cx]=calcul_Lxc(Lx, 5, H);

tp=1;
end

% Fonction calcul de L x vers c
% 
function[L_xc,L_cx]=calcul_Lxc(L_x, Nit,H)
    
    [h,w] =  size(H);
    L_xc = L_x;
    for iter=1:Nit
        for j=1:w

            for ci=1:h
                ind=find(H(ci,:)==1);
                product = tan(L_xc(ind)/2);
                p = prod(product);
                L_cx(ci,j) = 2*atan(p);
            end  

            for pi=1:w
                ind=find(H(:,pi)==1);
                L_cx_ = L_cx(ind);
                L_xc(j,pi) = L_x(j) + sum(L_cx_(:));
            end 
            
           
        end
    end
end
