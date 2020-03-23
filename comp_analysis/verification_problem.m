%%Main script for verificaion problem

%This line of code can be deleted after script successfuly runs once 
%%Main script for verificaion problem

%This line of code can be deleted after script successfuly runs once 
%Makes file that contains variables
fid = fopen('TrussVerificationProblem_JustinSadler_JosephGraham_PierreBoucher.mat');
if fid == -1
    input_parameters_verification
end

filename = 'TrussVerificationProblem_JustinSadler_JosephGraham_PierreBoucher.mat';
%calculates forces
[T, compress_or_tens, straw_lengths, total_load] = get_forces_in_members(filename);
%%Gotta make a function to get cost and theoritical max load to print

printResults(T,compress_or_tens, total_load)
