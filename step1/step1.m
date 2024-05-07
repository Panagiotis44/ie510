% Step 1: Input the value of n
n = input('Enter the value of n (a positive integer): ');

% Prompt for vector x
x = input('Enter the vector x (size n): ');

% Compute the sorted permutation of the coordinates of x
[~, permutation] = sort(x, 'descend');

prefix_sets_indices = cell(n, 1);
for i = 1:n
    prefix_sets_indices{i} = permutation(1:i);
end

% Initialize the Lovasz extension value
lovasz_extension = 0;

% Compute the Lovasz extension
for i = 1:n
    % Calculate Si
    Si = permutation(1:i);
    
    % Calculate f(Si) and f(S(i-1))
    if i == 1
        f_Si = 0; % By convention, f(S0) = 0
    else
        f_Si = sum(x(Si));
    end
    f_S_iminus1 = sum(x(permutation(1:i-1)));
    
    % Calculate Lovasz extension for this step
    lovasz_extension = lovasz_extension + (f_Si - f_S_iminus1) * x(permutation(i));
end

disp('Value of the Lovasz extension:');
disp(lovasz_extension);
