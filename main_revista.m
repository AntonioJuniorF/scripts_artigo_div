clear variables; close all; clc

% PAR�METROS DE ENTRADA:
N.EVT = 10000;
N.DIV = 50;    % n�mero de divis�es
N.PTS = 100000; % truth

% CRIAR BANCO DE DADOS: 
[sg,bg] = datasetGenSingle(N,'Bimodal');

% GERAR PDFS:
[sg,bg] = PDFGEN(sg,bg);

% PREPARAR COMPARA��ES
[sg.COMP]= COMPFIX(sg,'scan');
[bg.COMP]= COMPFIX(bg,'scan');

% CALCULAR DIVERG�NCIAS
[Y.sg,sg] = DIVFIX(sg);
[Y.bg,bg] = DIVFIX(bg);
[M] = DIVCALC(Y);

% PLOTAR RESULTADOS
DOPLOT(M.ash.dy,M.ash.eq.dy,sg,'ASH')
% DOPLOT(M.hist.dy,M.hist.eq.dy,sg,'HIST')
% DOPLOT(M.kde.dy.fix,M.kde.eq.dy.fix,sg,'KDE FIX')
% DOPLOT(M.kde.dy.var,M.kde.eq.dy.var,sg,'KDE VAR')
