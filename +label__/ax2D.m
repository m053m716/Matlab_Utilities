function ax = ax2D(ax,varargin)
%AX2D  Apply labels and limits to 2-D axes
%
%  ax = label__.ax2D(ax);
%  ax = label__.ax2D(ax,pars);
%  ax = label__.ax2D(__,'NAME',value,...);
%
%  -- inputs --
%  ax  :  matlab.graphics.axis.Axes object
%  
%  pars : (optional) Parameters struct (match elements of defs.Axes2)
%           --> Can also use <'NAME',value> argument pair syntax to set
%               individual fields of the struct
%
%  -- output --
%  ax  :  Input object with updated axes labels and limits
%           Updates following properties of axes (any can be modified using
%           <'NAME',value> syntax in input arguments)
%           * 'LineWidth'       (LINE_WIDTH)
%           * 'Title.Color'     (TITLE_COLOR)
%           * 'Title.FontName'  (TITLE_FONT)
%           * 'Title.FontSize'  (TITLE_SIZE)
%           * 'Title.FontWeight' (TITLE_WEIGHT)
%           * 'XColor'          (XCOLOR)
%           * 'XLabel.FontName' (XLABEL_FONT)
%           * 'XLabel.FontSize' (XLABEL_SIZE)
%           * 'XLabel.FontWeight' (XLABEL_WEIGHT)
%           * 'XLim'            (XLIM)
%           * 'XTick'           (XTICK)
%           * 'XTickLabels'     (XTICKLAB)
%           * 'YColor'          (YCOLOR)
%           * 'YLabel.FontName' (YLABEL_FONT)
%           * 'YLabel.FontSize' (YLABEL_SIZE)
%           * 'YLabel.FontWeight' (YLABEL_WEIGHT)
%           * 'YLim'            (YLIM)
%           * 'YTick'           (YTICK)
%           * 'YTickLabels'     (YTICKLAB)

if nargin < 1
   ax = gca;
elseif ~isa(ax,'matlab.graphics.axis.Axes')
   error(['LABEL__:' mfilename ':BadClass'],...
      ['\n\t->\t<strong>[LABEL__.AX2D]:</strong> ' ...
       'Invalid input class for `ax` (''%s'')\n'],class(ax));
end

pars = p__.parseParameters('Axes2',varargin{:});

ax.LineWidth = pars.LINE_WIDTH;

ax.Title.Color = pars.TITLE_COLOR;
ax.Title.FontName = pars.TITLE_FONT;
ax.Title.FontSize = pars.TITLE_SIZE;
ax.Title.FontWeight = pars.TITLE_WEIGHT;

ax.XColor = pars.XCOLOR;
ax.XLabel.FontName = pars.XLABEL_FONT;
ax.XLabel.FontSize = pars.XLABEL_SIZE;
ax.XLabel.FontWeight = pars.XLABEL_WEIGHT;
if ~strcmpi(pars.XLIM,'auto')
   ax.XLim = pars.XLIM;
end
if ~strcmpi(pars.XTICK,'auto')
   ax.XTick = pars.XTICK;
end
if ~strcmpi(pars.XTICKLAB,'auto')
   ax.XTickLabels = pars.XTICKLAB;
end

ax.YColor = pars.YCOLOR;
ax.YLabel.FontName = pars.YLABEL_FONT;
ax.YLabel.FontSize = pars.YLABEL_SIZE;
ax.YLabel.FontWeight = pars.YLABEL_WEIGHT;
if ~strcmpi(pars.YLIM,'auto')
   ax.YLim = pars.YLIM;
end
if ~strcmpi(pars.YTICK,'auto')
   ax.YTick = pars.YTICK;
end
if ~strcmpi(pars.YTICKLAB,'auto')
   ax.YTickLabels = pars.YTICKLAB;
end


end