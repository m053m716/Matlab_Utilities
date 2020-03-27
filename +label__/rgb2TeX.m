function s = rgb2TeX(varargin)
%RGB2TEX  Return string to set text to a certain color using TeX format
%
%  s = label__.rgb2TeX([0.0, 1.0, 0.0]);
%  s = label__.rgb2TeX(0, 1, 0.0);
%  s = label__.rgb2TeX([0 255 0]);
%  s = label__.rgb2TeX(0, 255, 0);
%
%  Each of the above inputs would return:
%  s == '\color[rgb]{0,1.0,0} ' (contains trailing space)

switch nargin
   case 1
      rgb = varargin{1};
   case 3
      rgb = [varargin{1},varargin{2},varargin{3}];
   otherwise
      error(['LABEL__:' mfilename ':BadNumInputs'],...
         ['\n\t->\t<strong>[LABEL__.RGB2TEX]:</strong> ' ...
          'Must supply either 1 or 3 inputs (you gave %g)\n'],...
          nargin);
end

if isa(rgb,'uint8') || isa(rgb,'int8')
   rgb = double(rgb) ./ 255;
else
   if any(rgb > 1)
      rgb = round(double(rgb)) ./ 255;
   end
end

s = sprintf('\\color[rgb]{%g,%g,%g} ',rgb(1),rgb(2),rgb(3));

end