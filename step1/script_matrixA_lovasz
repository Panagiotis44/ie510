clc, clearvars

% Prompt for the value of n
n = input('Enter the value of n (positive integer): ');

% Take matrix A as input
disp('Enter the matrix A (size n x n):');
A = input('');

% Check if A is a square matrix
[m, ~] = size(A);
if m ~= n
    error('Matrix A must be square (size n x n).');
end

% Define the submodular function f
f = @(S) sum(sum(A(S, S)));

% Prompt for vector x
x = input('Enter the vector x (size n): ');

% Check if x is a vector of size n
if numel(x) ~= n
    error('Vector x must have size n.');
end

% Compute the sorted permutation of the coordinates of x
[~, permutation] = sort(x, 'descend');

% Compute the prefix sets S1, S2, ..., Sn as a matrix of indices
prefix_sets_indices = cell(n, 1);
for i = 1:n
    prefix_sets_indices{i} = permutation(1:i);
end

% Compute the Lovász extension
lovasz_extension = 0;
for i = 1:n
    S_i = prefix_sets_indices{i};
    f_val_i = f(S_i);
    if i == 1
        f_val_prev = 0;
    else
        S_prev = prefix_sets_indices{i-1};
        f_val_prev = f(S_prev);
    end
    lovasz_extension = lovasz_extension + (f_val_i - f_val_prev) * x(permutation(i));
end

disp('Lovász extension:');
disp(lovasz_extension);
