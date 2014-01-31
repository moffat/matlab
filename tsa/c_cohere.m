function [C,f,ph,cl] = c_cohere(x,y,m,dt)
% C_COHERE Calculates coherence between two time series
% Uses matlab's Signal Processing functions to calculate 
% and plot (if desired) coherence and phase and confidence intervals 
% [C,f,ph,cl] = c_cohere(x,y,m,dt)
%
% Input: x,y : time series (real)
%        m   : length of segments used for analysis
%        dt  : dt
%
% Output C   : Coherence squared estimate
%        ph  : Phase estimates, in degrees. 
%              ph > 0 => y leads
% inputs are time series x,y, which will be divided in chunks of size m
% dt is pretty obvious, I hope.

% @Carlos Moffat, 11/03/2004

w = hann(m);
n = length(x);
[C,f] = cohere(x,y,m,1/dt,w,m/2,'linear');
C(1)= []; f(1) = [];
Pxy = csd(x,y,m,1/dt,w,m/2,'linear');
ph  = angle(Pxy)*180/pi;
ph(1) = [];
dof = c_dof(w,n,m/2);
cl  = 1-(.05)^(2/(dof-2));

if nargout==0
    subplot(211), semilogx(f,C,'k.-');  c_refline(cl,'k:'); ylim([0 1]);
    xt = get(gca,'xtick');
    set(gca,'xtick',xt,'xtickLabel',num2str(1./xt'),'xaxislocation','top'); 
    xlabel('Period');
    ylabel('Coherence Squared');
    subplot(212), semilogx(f,ph,'k.-'); c_refline(0,'k:');
    ylim([-180 180]); xlabel('Frequency'); ylabel('Phase');
end
