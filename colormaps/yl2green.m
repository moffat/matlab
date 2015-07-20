function cm = yl2green(n)
%YL2GREEN A Yellow to Greens Colormap from ColorBrewer
%
%   YL2GREEN(M) is a sequential yellow-to-green colormap.
%   Source: colorbrewer2.org 
% 
%

% by Carlos Moffat (carlos.moffat@ucsc.edu)
% Created on:   2015-07-09 21:10:26
% Last Modified: 2015-07-20 14:46:01

if nargin == 0
    n = 64;
end

rgb = [255 255 229;...
       247 252 185;...
       217 240 163;...
       173 221 142;...
       120 198 121;...
        65 171  93;...
        35 132  67;...
         0 104  55;...
         0  69  41]./255;


nn = numel(rgb(:))/3;
nn = linspace(0,1,nn);
n  = linspace(0,1,n) ;
cm = interp1(nn,rgb,n);
