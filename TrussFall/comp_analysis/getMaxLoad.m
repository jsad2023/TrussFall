function max_load = getMaxLoad(T,straw_lengths, C)
%Calculates theoritical max load of the truss. Will ask user if to use
%either the euler buckling fit or the empirical fit
%Format: max_load = getMaxLoad(Forces_in_members, straw_lengths)
 
[~, members] = size(C);
%ask user if whether to use  the euler buckling fit or the empirical fit
disp('Use empirical fit or euler buckling fit to get theortical max load?')
method = menu('Choose a method:', 'Euler Buckling Fit', 'Empirical Fit');
if method == 1
    A = 1340.9; %puts in paramer
    buckling = A * straw_lengths .^ (-2);
elseif method == 2
    A = 197.7; a = 1.238;
    buckling = A * straw_lengths .^ (-a);
end
    
%Get scaling ratios
SR = (T(1:members))' ./ buckling; 

%Get Max Load
max_load = 1 / max(SR);
end
    
    