function [ x1,y1] = discrRegion( x,y )

%%=========================================================================
%% Fun��o definir as regi�es HEAD, DERIV e TAIL
%%=========================================================================
%% Entradas:
%           x - Struct contendo o eixo x da fun��o an�litica
%           y   - Struct contento o eixo y da fun��o an�litica
%           
%% Sa�da:
%           x      - Struct contendo o eixo x da fun��o an�litica para cada
%           regiao
%           y      - Struct contendo o eixo y da fun��o an�litica para cada
%           regiao
%           ind    - Struct contendo os indices de head, deriv e tail 
%%
pct.tail=0.01;
pct.head=0.90;

maxY=max(y);

ind.tail=find(y<maxY*pct.tail);
ind.head=find(y>=maxY*pct.head);

indunion=union(ind.tail,ind.head);
ind.deriv=setdiff(1:length(y),indunion);

x1.head=x(ind.head);
x1.tail=x(ind.tail);
x1.deriv=x(ind.deriv);
x1.all=x;

y1.head=y(ind.head);
y1.tail=y(ind.tail);
y1.deriv=y(ind.deriv);
y1.all=y;
end

