function [W] = solve_Mat_W(Train_SET,lambda)
[n_rows,n_columns] = size(Train_SET);
W = zeros(n_columns,n_columns);
delete(gcp('nocreate'))
N = maxNumCompThreads;
parpool(N);
parfor idx = 1:n_columns
    idx;
    [w_i] = solve_wi(idx,Train_SET,lambda);
    W(:,idx) = w_i;
end
