function d_m = corrcoefint(a,n)
%CORRCOEFINT Confidence interval of correlation coefficient
% 
% d_m = corrcoefint(a,n)
% 
% a	= confidence level for (1-a)100% confidence interval
% n	= integer number of independent samples in your series
% 
% d_m	=  half the length of the confidence interval
%
% Calculates half the length of the maximum confidence interval length
% of a linear correlation coefficiet, given a prespecified confidence
% level and sample size.
%
% See also CORRCOEF TINV STATS

d_m=tinv(1-a/2,n-1) / sqrt(n - 1 + tinv(1-a/2,n-1)^2 );
