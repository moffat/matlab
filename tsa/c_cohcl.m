function l=c_cohcl(dof)
% C_COHCL Confidence level for Coherence Squared Estimation
% l = c_cohcl(dof)

l=1-(.05)^(2/(dof-2));