function max_load = GetMaxLoad(T,straw_lengths, C)
%Calculates theoritical max load of the truss. Will ask user if to use
%either the euler buckling fit or the empirical fit
%Format: max_load = getMaxLoad(Forces_in_members, straw_lengths)
 
[~, members] = size(C);
%ask user if whether to use  the euler buckling fit or the empirical fit

%We're using empircal fit to calculate buckling force
B = 1400;
buckling = B * straw_lengths .^ (-2);


compression_forces = T(1:members);
compression_forces(find(compression_forces >= 0)) = 0;
%Get scaling ratios
SR = abs(compression_forces ./ buckling'); 

%Get Max Load
max_load = 1 / max(SR);
end
    
    
