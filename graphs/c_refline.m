function h=c_refline(v,s,ax)
% C_REFLINE plots a reference line 
%   h = C_REFLINE(v,s,ax) plots a line at value v (0 is default)
%   with properties s (default is 'k') and on axes 'ax' (default is 'x')
%
%   h is a handle to the line

% by Carlos Moffat (carlos.moffat@ucsc.edu)
% Created on:   2097-03-21 21:00:16
% Last Modified: 2015-07-10 09:54:45


hold on
if nargin==0
    v=0;
    s='k';
    [y,x]=size(v);
    ax='x';
elseif nargin==2
    v = v(:);
    [y,x]=size(v);
    if min(size(s))<max(size(v))
        s = repmat(s,[y 1]);
    end
    ax='x';
elseif nargin==1
    v = v(:);
    [y,x]=size(v);
    s(1:y,1)='k';
    ax='x';
else
    v = v(:);
    [y,x]=size(v);
    if min(size(s))<max(size(v))
        s = repmat(s,[y 1]);
    end
end

switch ax
    case 'x'
        for i = 1:y
            h(i) = plot(xlim,[v(i) v(i)],s(i,:));
        end
    case 'y'
        for i=1:y
            h(i)=plot([v(i) v(i)],ylim,s(i,:));
        end
end
