function [w_i] = solve_wi(i,X,lambda)
[Eigen_NUM ,Train_NUM] = size(X);
% Eigen_NUM = Train_NUM;
k=i;
A=zeros(Eigen_NUM,Train_NUM-1);
if k==1
   y=X(:,1);
   A=X(:,2:Train_NUM);
   %solve the L2_minimization through LRS
   [w]=LRS(y,A,lambda);
   w_i=[0 w'];
else
   y=X(:,k);
   A(:,1:k-1)=X(:,1:k-1);
   A(:,k:Train_NUM-1)=X(:,k+1:Train_NUM);
   %solve the L2_minimization through LRS
   [w]=LRS(y,A,lambda);
   w_i=[w(1:k-1)' 0 w(k:Train_NUM-1)'];
end
clear A;
end