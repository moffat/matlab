function s = c_basescale(lat)
%C_BASESCALE Rescale Figure 
%	C_BASESCALE, without any arguments, rescales the
%       current figure (where x is lon and y is lat), so
%       that dx = dy. It uses the mean latitude of the figure.
%
%	C_BASESCALE(LAT) uses LAT instead
%
%	S = C_BASESCALE gives the ratio between dlon/dlat at that 
%	latitude, which is used to rescale the map
%
%       Note this only makes sense if the area being plotted is
% 	quite small. Otherwise you should use Rich Pawlowicz' m_map,
%	for example. 
%
%	@Carlos Moffat, 2004-2009

% ChangeLog:
% v1.1 11/05/09 Make it independent of the seawater routines (I know...)
% v1.0 05/10/06 Cleaned the code a bit

if nargin == 0
    lat = mean(ylim);
end

s = cos(lat*pi/180);
if nargout == 0
    set(gca,'DataAspectratio',[1 s 1]);
end
