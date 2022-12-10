function cm = red2blue(n,Reverse)
%RED2BLUE A Red to Blue Colormap from ColorBrewer
%
%   RED2BLUE(M) is a diverging red-to-blue colormap.
%   Source: colorbrewer2.org 
% 
%

% by Carlos Moffat (carlos.moffat@ucsc.edu)
% Created on:   2015-07-09 21:10:26
% Last Modified: 2015-07-20 14:46:26

switch true
    case nargin < 1
        Reverse = false;
        n = 64;
    case nargin < 2
        Reverse = false;
end
rgb = [103   0  31; ...
       178  24  43; ...
       214  96  77; ...
       244 165 130; ...
       253 219 199;...
       247 247 247; ...
       209 229 240; ...
       146 197 222; ...
        67 147 195; ...
        33 102 172; ...
         5  48  97]./255;

nn = numel(rgb(:))/3;
nn = linspace(0,1,nn);
n  = linspace(0,1,n) ;
cm = interp1(nn,rgb,n);

if Reverse
    cm = flip(cm);
end
