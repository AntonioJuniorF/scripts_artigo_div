function [le,ld] = tail_choice_pdf(xrange,yrange,TH)

h = diff(xrange); h = h(1);

dy = abs(diff(yrange)/h);
dyn = abs(diff(yrange)/h)/max(abs(diff(yrange)/h));
py = yrange/max(yrange);

ind.dy = find(dy<TH);
ind.dyn = find(dyn<TH);
ind.py = find(py<TH);

le.dy=xrange(ind.dy((find(diff(ind.dy)>2)))); le.dy = min(le.dy);
le.dyn=xrange(ind.dyn((find(diff(ind.dyn)>2)))); le.dyn = min(le.dyn);
le.py=xrange(ind.py((find(diff(ind.py)>2)))); le.py = min(le.py);

ld.dy=xrange(ind.dy((find(diff(ind.dy)>2))+1)); ld.dy = max(ld.dy);
ld.dyn=xrange(ind.dyn((find(diff(ind.dyn)>2))+1)); ld.dyn = max(ld.dyn);
ld.py=xrange(ind.py((find(diff(ind.py)>2))+1)); ld.py = max(ld.py);

if isempty(le.dy)
    le.dy = min(xrange);
end
if isempty(le.dyn)
    le.dyn = min(xrange);
end
if isempty(le.py)
    le.py = min(xrange);
end

if isempty(ld.dy)
    ld.dy = max(xrange);
end
if isempty(ld.dyn)
    ld.dyn = max(xrange);
end
if isempty(ld.py)
    ld.py = max(xrange);
end

% figure
% plot(xrange,yrange,'-k','DisplayName','PDF'); hold on
% plot(le.dy,0,'*r',ld.dy,0,'*r','DisplayName','Diff')
% plot(le.dyn,0,'*g',ld.dyn,0,'*g','DisplayName','Normalized Diff')
% plot(le.py,0,'ob',ld.py,0,'ob','DisplayName','Probability')
% % legend show
% axis tight
% grid on
% set(gca, 'GridLineStyle',':')

end
