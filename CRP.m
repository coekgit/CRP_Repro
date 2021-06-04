function [P] = CRP(X,Eigen_NUM,lambda);

[W] = solve_Mat_W(X,lambda);
S_L = X*(eye(size(X,2))-W-W'+W*W')*X';
S_T = cov(X').*(size(X,2)-1);

[P,Gen_Value]=Find_K_Max_Gen_Eigen(S_L,S_T,Eigen_NUM);
end