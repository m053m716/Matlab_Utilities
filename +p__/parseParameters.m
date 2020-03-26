function pars = parseParameters(defFile,varargin)
%PARSEPARAMETERS  Parse input default parameters of `defFile`
%
%  pars = p__.parseParameters(defFile);
%  --> Uses file in `+p__/+defs/<defFile>.m` to get parameters struct
%
%  pars = p__.parseParameters(defFile,pars);
%  --> Assigns pars directly
%
%  pars = p__.parseParameters(defFile,varargin{:});
%  --> Uses file in `+p__/+defs/<defFile>.m` to get parameters struct
%     --> Modifies parameter struct using `'NAME',value,...` syntax

switch numel(varargin)
   case 0
      pars = p__.defs.(defFile)();
   case 1
	  if ~isstruct(varargin{1})
	     error(['P__:' mfilename ':BadSyntax'],...
		    ['\n\t->\t<strong>[P__.PARSEPARAMETERS]:</strong> ' ...
			 'If only 2 arguments given, second must be parameters ' ...
			 '<strong>struct</strong>\n']);
	  end
      pars = varargin{1};
   otherwise
      pars = p__.defs.(defFile)();
      pars = p__.getOpt(pars,1,varargin{:});
end

end