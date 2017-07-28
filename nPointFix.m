function [nPoint] = nPointFix(nPoint,Div,n,nd)
%==========================================================================
% FUN��O PARA AJUSTAR O N�MERO DE PONTOS DE ACORDO COM AS DIVIS�ES DO 
% FASTKDE, PARA A DIVIS�O SER UM N�MERO INTEIRO:
%==========================================================================
if nd == 1
    if n>=69998
        nPoint = nPoint - mod(nPoint,Div.L);
    else
        nPoint = nPoint - mod(nPoint,Div.S);
    end
    
else
    if n>20000
        nPoint = nPoint - mod(nPoint,Div.D);
    end
end

end