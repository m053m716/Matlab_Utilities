function varargout = Axes2(varargin)
%AXES2  Parameters for 2D axes labeling, etc.
%
%  pars = defs.Axes2();
%  [var1,var2,...] = defs.Axes2('var1Name','var2Name',...);

pars.LINE_WIDTH = 1;
pars.TITLE_FONT = 'Arial';   
pars.TITLE_SIZE = 16;         
pars.TITLE_COLOR = 'k';
pars.TITLE_WEIGHT = 'bold';
pars.XTICK = 'auto';
pars.XTICKLABELS = 'auto';
pars.XLIM = 'auto';
pars.XCOLOR = 'k';
pars.XLABEL_FONT = 'Arial';
pars.XLABEL_SIZE = 14;
pars.XLABEL_WEIGHT = 'normal';
pars.YTICK = 'auto';
pars.YTICKLABELS = 'auto';
pars.YLIM = 'auto';
pars.YCOLOR = 'k';
pars.YLABEL_FONT = 'Arial';
pars.YLABEL_SIZE = 14;
pars.YLABEL_WEIGHT = 'normal';

if nargin < 1
   varargout = {pars};   
else
   F = fieldnames(pars);   
   if (nargout == 1) && (numel(varargin) > 1)
      varargout{1} = struct;
      for iV = 1:numel(varargin)
         idx = strcmpi(F,varargin{iV});
         if sum(idx)==1
            varargout{1}.(F{idx}) = pars.(F{idx});
         end
      end
   elseif nargout > 0
      varargout = cell(1,nargout);
      for iV = 1:nargout
         idx = strcmpi(F,varargin{iV});
         if sum(idx)==1
            varargout{iV} = pars.(F{idx});
         end
      end
   else
      for iV = 1:nargin
         idx = strcmpi(F,varargin{iV});
         if sum(idx) == 1
            fprintf('<strong>%s</strong>:',F{idx});
            disp(pars.(F{idx}));
         end
      end
   end
end

end