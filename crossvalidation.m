function [ ind ] = crossvalidation(ind,numblock )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Fun��o efetuar a crossvalidation                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Descri��o: Efetuar a crossvalida��o                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ELETRON

event=floor((length(ind.e)/numblock));

blocksort=randperm(numblock);

ind.ek=[];
for i=blocksort(1:end/2)
    
    ind.ek=[ind.ek ind.e((1+event*(i-1)):event*(i))'];

end
ind.ev=[];
for i=blocksort(((end/2)+1):end)
    
    ind.ev=[ind.ev ind.e((1+event*(i-1)):event*(i))'];

end

%% JET

event=floor((length(ind.j)/numblock));

blocksort=randperm(numblock);

ind.jk=[];
for i=blocksort(1:end/2)
    
    ind.jk=[ind.jk ind.j((1+event*(i-1)):event*(i))'];

end
ind.jv=[];
for i=blocksort(((end/2)+1):end)
    
    ind.jv=[ind.jv ind.j((1+event*(i-1)):event*(i))'];

end

