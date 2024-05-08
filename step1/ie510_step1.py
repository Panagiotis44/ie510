import itertools

def get_input_vector(n):
    while True:
        x = input(f"Enter {n} real values separated by spaces for the input vector x: ").split()
        if len(x) != n:
            print(f"Error: Input vector size must be {n}. Please try again.")
        else:
            try:
                x = [float(val) for val in x]
                return x
            except ValueError:
                print("Error: Please enter valid real numbers.")

def validate_submodular_function(submodular_function, n):
    if len(submodular_function) != 2**n:
        print(f"Error: Submodular function size must be 2^{n} = {2**n}. Please provide a valid list.")
        return False
    return True

# Function to convert a list of indices to a decimal value
def binary_to_decimal(indices):
    binary_str = ''.join(['1' if (i in indices) else '0' for i in range(len(indices))])
    return int(binary_str, 2)

# Main program
n = int(input("Enter the size of the set S: "))
submodular_function = input("Enter the submodular function values separated by spaces: ").split()
if validate_submodular_function(submodular_function, n):
    submodular_function = [float(val) for val in submodular_function]  # Convert to float
    x = get_input_vector(n)
    print("Input vector x:", x)
    sorted_x = sorted(x, reverse=True)
    print("Sorted input vector:", sorted_x)
    pi = [sorted_x.index(val) for val in x]
    print("Permutation indices:", pi)
    lovasz_expansion = 0
    for i in range(n):
        S_i = pi[:i+1]
        f_value_index = binary_to_decimal(S_i)
        f_value = submodular_function[f_value_index]
        if i == 0:
            f_value_prev = 0
        else:
            S_prev = pi[:i]
            f_value_prev_index = binary_to_decimal(S_prev)
            f_value_prev = submodular_function[f_value_prev_index]
        lovasz_expansion += (f_value - f_value_prev) * sorted_x[i]
    print("Lovasz expansion:", lovasz_expansion)
