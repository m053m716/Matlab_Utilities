function ax = setEvenLimits(ax)
%SETEVENLIMITS  "Evens" the axes limits of axes in an array
%
%  ax = label__.setEvenLimits(ax);
%
%  -- Input --
%  ax : Array of axes handles
%
%  -- Output --
%  ax : Same as input, but should have equal xlim and ylim for each element

yy = [inf, -inf];
xx = [inf, -inf];
for i = 1:numel(ax)
   if ~strcmpi(ax(i).Type,'axes')
      continue;
   end
   yy = [min(yy(1),ax(i).YLim(1)) max(yy(2),ax(i).YLim(2))];
   xx = [min(xx(1),ax(i).XLim(1)) max(xx(2),ax(i).XLim(2))];
end
if any(isinf(yy))
   yy = [0 1];
end
if any(isinf(xx))
   xx = [0 1];
end
for i = 1:numel(ax)
   if ~strcmpi(ax(i).Type,'axes')
      continue;
   end
   ax(i).XLim = xx;
   ax(i).YLim = yy;
end

end