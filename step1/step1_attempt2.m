% Step 1: Input the value of n
n = input('Enter the value of n (a positive integer): ');

% Validate if n is a positive integer
if ~isnumeric(n) || n <= 0 || mod(n, 1) ~= 0
    error('Invalid input. Please enter a positive integer for n.');
end


% Prompt the user to input the values of the submodular function as a row vector
f_values = input('Enter the values of the submodular function as a row vector: ');

% Validate the size of the input vector
expected_size = 2^n;
if ~isvector(f_values) || numel(f_values) ~= expected_size
    error(['Invalid input size. Please enter a row vector of size 1x', num2str(expected_size)]);
end

% Compute the sorted permutation of the coordinates of f_values
[~, permutation] = sort(f_values, 'descend');

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
        f_Si = sum(f_values(Si));
    end
    f_S_iminus1 = sum(f_values(permutation(1:i-1)));
    
    % Calculate Lovasz extension for this step
    lovasz_extension = lovasz_extension + (f_Si - f_S_iminus1) * f_values(permutation(i));
end

disp('Value of the Lovasz extension:');
disp(lovasz_extension);

