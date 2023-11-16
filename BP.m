function [mot_code,msg_estim] = BP(H, G)

[lambda,pho,deg_lambda,deg_pho] = calcul_degre(H);

[h,w] =  size(G);
trame = randi([0,1],1, h);
mot_code = mod(trame*G,2);
p=0.5;
eps=-1;
msg = BEC(mot_code,p,eps).';
for i=1:length(msg)

    if msg(i) == 0
        Lx(i) = 1e4;
    elseif msg(i) == eps
        Lx(i) = 0;  
     elseif msg(i) == 1
        Lx(i) = -1e4;
    end

end

[L_xc,L_cx,Lx_estim]=calcul_Lxc(Lx, 5, H);
msg_estim = (Lx_estim<=0);
t=1;
end

% Fonction calcul de L x vers c
% 
% function[L_xc,L_cx,Lx]=calcul_Lxc(Lx, Nit,H)
%     
%     [h,w] =  size(H);
%     L_xc = zeros(h, w);
%     L_cx = zeros(h, w);
%     for iter=1:Nit
%         for i=1:h
% 
%             indices = find(H(i, :) == 1);
%             
%             for ind = indices           %Boucle for mal executé, on doit d'abord remplir entièremetn L_xc avant de remplir L_cx
%                 other_bits = indices(indices ~= ind);
%                 L_xc(i, ind) = Lx(i) + sum(L_cx(i, other_bits));
%             end
%     
% 
%             for pi = 1:h
%                 L_cx(i, pi) = sum(L_xc(i,:)) - L_xc(i, pi);
%             end
%             Lx= sum(L_cx);
%            
%         end
%     end
% end
% 
% function[L_xc, L_cx, Lx_estim] = calcul_Lxc(Lx, Nit, H)
% 
%     [h, w] = size(H);
%     L_xc = zeros(h, w);
%     L_cx = zeros(h, w);
%     Lx_estim = zeros(1, w);
% 
%     for iter = 1:Nit
%         for i = 1:h
%             indices = find(H(i, :) == 1);
% 
%             for ind = indices
%                 other_bits = indices(indices ~= ind);
%                 L_xc(i, ind) = Lx(i) + sum(L_cx(i, other_bits));
%             end
% 
%             for pi = 1:h
%                 L_cx(i, pi) = sum(L_xc(i, :)) - L_xc(i, pi);
%             end
%         end
% 
%         Lx_estim = sum(L_cx, 1);
%     end
% end
% 

function[L_xc, L_cx, Lx_estim] = calcul_Lxc(Lx, Nit, H)

    [h, w] = size(H);
    L_xc = zeros(h, w);
    L_cx = zeros(h, w);
    Lx_estim = Lx;

    for iter = 1:Nit
        for i = 1:h
            indices = find(H(i, :) == 1);

            for ind = indices
                other_bits = indices(indices ~= ind);
                L_xc(i, ind) = Lx_estim(i) + sum(L_cx(i, other_bits));
            end

            for pi = 1:h
                
                L_cx(i, pi) = 2 * atanh(prod(tanh(L_xc(i,pi)/2)));
                % L_cx(i, pi) = sum(L_xc(i, :)) - L_xc(i, pi);
            end
        end
    end

    Lx_estim = sum(L_cx, 1);
end

