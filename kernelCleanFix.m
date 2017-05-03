function [X,pdf] = kernelCleanFix(data,nPoint,f)
disp(['[KDE][OPTIMIZER][..]']); %display de controle
%==========================================================================
% KERNEL Optimizer para problemas de 1 Dimens�o:
%=================================================
% Entradas: data: dados de Kernel
%           nPoint: n�mero de pontos do kernel
%           f: fator de suaviza��o do lambda �timo
%           e: el�tron=1 jato=0
%           v: n�mero das vari�veis da LH
%=================================================
% Sa�das:   x: range X do Kernel
%           p: probabilidades do Kernel
numDiv=10;
numDiv1=2;

disp(['[KDE][OPTIMIZER][OK]']); %display de controle
%==========================================================================
% C�lculando KERNEL
%==========================================================================
disp(['[KDE][PDF][..]']); %display de controle
n=length(data);             % n�mero de eventos
nd=1;                       % N�mero de dimens�es

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [x,y] = histmean(data,100,'linear','auto');
% std_gauss = stdgauss(data);
% std_gauss = std(data);
% h =((4/(nd+2))^(1/(nd+4)))*std_gauss*n^(-1/(nd+4)); % c�lculo do h("rule-of-thumb") �timo pelo AMISE
X = linspace(min(data),max(data),nPoint); %range X do kernel
h =((4/(nd+2))^(1/(nd+4)))*std(data)*n^(-1/(nd+4)); % c�lculo do h("rule-of-thumb") �timo pelo AMISE
h=h*f;
% [R] = roughness(x,y);
% h = ((6/R)^(1/3))*length(data).^(-1/3);
% disp(['[h=' num2str(h1) '] [h_r=' num2str(h) '][OK]']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h = ones(1,length(data))*h;
Hi =h.^2;

% ==========================================================================
% Fazendo os C�lculos do KERNEL ND de banda Fixa e Vari�vel
%==========================================================================
if length(data)>=70000
    pdf=[];
    for j=1:numDiv
        pdf=[pdf ((1/n)*sum((repmat((Hi.^(-1/2)),nPoint/numDiv,1).*Kn(repmat((Hi.^(-1/2)),nPoint/numDiv,1).*((repmat(X((1+(nPoint/numDiv)*(j-1)):(nPoint/numDiv)*(j)),length(data),1)')-repmat(data,nPoint/numDiv,1)))),2))'];
    end
else
    pdf=[];
    for j=1:numDiv1
        pdf=[pdf ((1/n)*sum((repmat((Hi.^(-1/2)),nPoint/numDiv1,1).*Kn(repmat((Hi.^(-1/2)),nPoint/numDiv1,1).*((repmat(X((1+(nPoint/numDiv1)*(j-1)):(nPoint/numDiv1)*(j)),length(data),1)')-repmat(data,nPoint/numDiv1,1)))),2))'];
    end
end
disp('[KDE][PDF][OK]'); %display de controle


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% h=diff(x);
% r=ksr(x,y/ah,h,nPoint);
% pdf=r.f;
% X=r.x;

end

