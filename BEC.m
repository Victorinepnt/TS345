function [trame_sortie] = BEC(trame,p,eps)

len = length(trame);
trame_sortie=zeros(len,1);
for i=1:len
    if trame(i)==0
        if rand()<p
            trame_sortie(i)=0;
        else
            trame_sortie(i)=eps;
        end
    else
        if rand()<p
            trame_sortie(i)=1;
        else
            trame_sortie(i)=eps;
        end
    end
      
end

