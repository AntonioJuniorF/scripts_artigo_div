clear variables; close all; clc

% PAR�METROS DE ENTRADA:
N.EVT = 1000000;
N.DIV = 10;    % n�mero de divis�es
N.PTS = 10000; % truth

% CRIAR BANCO DE DADOS: 
[sg,bg] = datasetGenSingle(N,'Bimodal');

% GERAR PDFS:
[sg,bg] = PDFGEN(sg,bg);
% PREPARAR COMPARA��ES
[sg.COMP]= COMPFIX(sg,'scan');
[bg.COMP]= COMPFIX(bg,'scan');

% CALCULAR DIVERG�NCIAS
[sg,bg] = DIVFIX(sg,bg)
