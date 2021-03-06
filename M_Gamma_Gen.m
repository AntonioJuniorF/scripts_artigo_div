function [sg,bg] = M_Gamma_Gen(sg,bg,N)

sg.n.x = N.PTS;
bg.n.x = N.PTS;

sg.pdf.truth.x = linspace(0,10,sg.n.x);
bg.pdf.truth.x = linspace(0,10,bg.n.x);

sg.A = 5;
bg.A = 5;

sg.B = 0.5;
bg.B = 0.4;

sg.pdf.truth.y = gampdf(sg.pdf.truth.x,sg.A,sg.B);
bg.pdf.truth.y = gampdf(bg.pdf.truth.x,bg.A,bg.B);


sg.n.evt = N.EVT;
bg.n.evt = N.EVT;

sg.evt = gamrnd(sg.A,sg.B,1,sg.n.evt);
bg.evt = gamrnd(bg.A,bg.B,1,bg.n.evt);

sg = rmfield(sg,'A');
bg = rmfield(bg,'A');

sg = rmfield(sg,'B');
bg = rmfield(bg,'B');






