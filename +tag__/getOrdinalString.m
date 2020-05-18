function tag = getOrdinalString(n,capitalize_first_letter)
%GETORDINALSTRING  Returns ordinal char e.g. 'first' for 1, 'second' for 2
%
%  tag = tag__.getOrdinalString(n);
%  tag = tag__.getOrdinalString(n,capitalize_first_letter);
%
%  -- Input --
%  n : Integer ordinal scalar (e.g. 1 or 2, ... 1000, etc.)
%     --> If given as array, returns cell array of same size.
%
%  capitalize_first_letter : Default is false; set true to return with
%                             capitalized first letter (e.g. 'First' or
%                             'Twenty-Third');
%  -- Output --
%  tag : Char array, unless `n` is non-scalar, then it's a cell array of
%           same size as `n`

if nargin < 2
   capitalize_first_letter = false;
end

if numel(n) > 1
   tag = cell(size(n));
   for ii = 1:numel(n)
      tag{ii} = tag__.getOrdinalString(n(ii),capitalize_first_letter);
   end
   return;
end

if n < 0
   tag = sprintf('(%s)',tag__.getOrdinalString(n,capitalize_first_letter));
   return;
end

if n >= 1000
   switch rem(n,10)
      case 2
         tag = sprintf('%g-nd',n);
      case 3
         tag = sprintf('%g-rd',n);
      otherwise
         tag = sprintf('%g-th',n);
   end
   return;
end

if n >= 100
   k = floor(n/100);
   K = k*100;
   tens_ = n - K;
   switch k
      case 1
         if rem(n,K)==0
            tag = 'one-hundredth';
         else
            tag = sprintf('one-hundred-%s',...
               tag__.getOrdinalString(tens_,capitalize_first_letter));
         end
      case 2
         if rem(n,K)==0
            tag = 'two-hundredth';
         else
            tag = sprintf('two-hundred-%s',...
               tag__.getOrdinalString(tens_,capitalize_first_letter));
         end
      case 3
         if rem(n,K)==0
            tag = 'three-hundredth';
         else
            tag = sprintf('three-hundred-%s',...
               tag__.getOrdinalString(tens_,capitalize_first_letter));
         end
      case 4
         if rem(n,K)==0
            tag = 'four-hundredth';
         else
            tag = sprintf('four-hundred-%s',...
               tag__.getOrdinalString(tens_,capitalize_first_letter));
         end
      case 5
         if rem(n,K)==0
            tag = 'five-hundredth';
         else
            tag = sprintf('five-hundred-%s',...
               tag__.getOrdinalString(tens_,capitalize_first_letter));
         end
      case 6
         if rem(n,K)==0
            tag = 'six-hundredth';
         else
            tag = sprintf('six-hundred-%s',...
               tag__.getOrdinalString(tens_,capitalize_first_letter));
         end
      case 7
         if rem(n,K)==0
            tag = 'seven-hundredth';
         else
            tag = sprintf('seven-hundred-%s',...
               tag__.getOrdinalString(tens_,capitalize_first_letter));
         end
      case 8
         if rem(n,K)==0
            tag = 'eight-hundredth';
         else
            tag = sprintf('eight-hundred-%s',...
               tag__.getOrdinalString(tens_,capitalize_first_letter));
         end
      case 9         
         if rem(n,K)==0
            tag = 'nine-hundredth';
         else
            tag = sprintf('nine-hundred-%s',...
               tag__.getOrdinalString(tens_,capitalize_first_letter));
         end
      otherwise
         error('Should not be possible');
   end
   if capitalize_first_letter
      tag(1) = upper(tag(1));
      idx = regexp(tag,'-','once')+1;
      tag(idx) = upper(tag(idx));
   end
   return;
end

if n >= 20
   k = floor(n/10);
   K = k*10;
   ones_ = n - K;
   switch K
      case 20
         if rem(n,K)==0
            tag = 'twentieth';
         else
            tag = sprintf('twenty-%s',...
               tag__.getOrdinalString(ones_,capitalize_first_letter));
         end
      case 30
         if rem(n,K)==0
            tag = 'thirtieth';
         else
            tag = sprintf('thirty-%s',...
               tag__.getOrdinalString(ones_,capitalize_first_letter));
         end
      case 40
         if rem(n,K)==0
            tag = 'fourtieth';
         else
            tag = sprintf('fourty-%s',...
               tag__.getOrdinalString(ones_,capitalize_first_letter));
         end
      case 50
         if rem(n,K)==0
            tag = 'fiftieth';
         else
            tag = sprintf('fifty-%s',...
               tag__.getOrdinalString(ones_,capitalize_first_letter));
         end
      case 60
         if rem(n,K)==0
            tag = 'sixtieth';
         else
            tag = sprintf('sixty-%s',...
               tag__.getOrdinalString(ones_,capitalize_first_letter));
         end
      case 70
         if rem(n,K)==0
            tag = 'seventieth';
         else
            tag = sprintf('seventy-%s',...
               tag__.getOrdinalString(ones_,capitalize_first_letter));
         end
      case 80
         if rem(n,K)==0
            tag = 'eightieth';
         else
            tag = sprintf('eighty-%s',...
               tag__.getOrdinalString(ones_,capitalize_first_letter));
         end
      case 90
         if rem(n,K)==0
            tag = 'ninetieth';
         else
            tag = sprintf('ninety-%s',...
               tag__.getOrdinalString(ones_,capitalize_first_letter));
         end
      otherwise
         error('Should not be possible');
   end 
   if capitalize_first_letter
      tag(1) = upper(tag(1));
   end
   return;
end

switch n
   case 0
      tag = 'zero-th';
   case 1
      tag = 'first';
   case 2
      tag = 'second';
   case 3
      tag = 'third';
   case 4
      tag = 'fourth';
   case 5
      tag = 'fifth';
   case 6
      tag = 'sixth';
   case 7
      tag = 'seventh';
   case 8
      tag = 'eighth';
   case 9
      tag = 'ninth';
   case 10
      tag = 'tenth';
   case 11
      tag = 'eleventh';
   case 12
      tag = 'twelfth';
   case 13
      tag = 'thirteenth';
   case 14
      tag = 'fourteenth';
   case 15
      tag = 'fifteenth';
   case 16
      tag = 'sixteenth';
   case 17
      tag = 'seventeenth';
   case 18
      tag = 'eighteenth';
   case 19
      tag = 'nineteenth';
   otherwise
      error('Should not be possible');
end

if capitalize_first_letter
   tag(1) = upper(tag(1));
end


end