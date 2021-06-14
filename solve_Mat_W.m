function [W] = solve_Mat_W(X,lambda)
[n_rows,n_columns] = size(X);
W = zeros(n_columns,n_columns);
if n_columns <200
    for idx = 1:n_columns
        [w_i] = solve_wi(idx,X,lambda);
        W(:,idx) = w_i;
    end
else
    delete(gcp('nocreate'))
    N = maxNumCompThreads;
    parpool(N);
    parfor idx = 1:n_columns
        [w_i] = solve_wi(idx,X,lambda);
        W(:,idx) = w_i;
    end
end
