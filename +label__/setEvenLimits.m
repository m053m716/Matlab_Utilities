function ax = setEvenLimits(ax,varargin)
%SETEVENLIMITS  "Evens" the axes limits of axes in an array
%
%  -- Note: calls `label__.ax2D` on each `ax` --
%
%  ax = label__.setEvenLimits(ax);
%  ax = label__.setEvenLimits(ax,pars);
%  ax = label__.setEvenLimits(__,'NAME',value,...);
%
%  -- Input --
%  ax : Array of axes handles
%
%  varargin : (Optional) Can assign `pars` directly, and/or modify 
%					specific `pars` fields (from `defs.Axes2`) using
%					<'NAME',value> input pair syntax.
%
%  -- Output --
%  ax  :  Input object array with updated properties and even limits
%           
%				## Affected `axes` Properties ##
%
%			(any can be modified using <'NAME',value> syntax)
%
%			-- property --       -- ('NAME') --
%           * 'LineWidth'         (LINE_WIDTH)
%           * 'Title.Color'       (TITLE_COLOR)
%           * 'Title.FontName'    (TITLE_FONT)
%           * 'Title.FontSize'    (TITLE_SIZE)
%           * 'Title.FontWeight'  (TITLE_WEIGHT)
%           * 'XColor'            (XCOLOR)
%           * 'XDir' 		      (XDIR)
%           * 'XLabel.FontName'   (XLABEL_FONT)
%           * 'XLabel.FontSize'   (XLABEL_SIZE)
%           * 'XLabel.FontWeight' (XLABEL_WEIGHT)
%			* 'XLim' 		      (XLIM) -- sets initial bounds
%		    * 'XScale' 			  (XSCALE)
%           * 'XTick'             (XTICK)
%           * 'XTickLabels'       (XTICKLAB)
%           * 'YDir' 		      (YDIR)
%           * 'YColor'            (YCOLOR)
%           * 'YLabel.FontName'   (YLABEL_FONT)
%           * 'YLabel.FontSize'   (YLABEL_SIZE)
%           * 'YLabel.FontWeight' (YLABEL_WEIGHT)
%			* 'YLim' 		      (YLIM) -- sets initial bounds
%		    * 'YScale' 			  (YSCALE)
%           * 'YTick'             (YTICK)
%           * 'YTickLabels'       (YTICKLAB)

pars = p__.parseParameters('Axes2',varargin{:});

if strcmpi(pars.XLIM,'auto')
   xx = [inf, -inf];
else
   xx = pars.XLIM;
end
if strcmpi(pars.YLIM,'auto')
   yy = [inf, -inf];
else
   yy = pars.YLIM;
end
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

pars.XLIM = xx;
pars.YLIM = yy;

for i = 1:numel(ax)
   if ~strcmpi(ax(i).Type,'axes')
      continue;
   end
   ax(i) = label__.ax2D(ax(i),pars);
end

end