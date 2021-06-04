function [w_i] = LRS(y,X,lambda)
P = inv(X'*X+lambda*eye(size(X,2)))*X';
w_i = P*y;
end