function getBuckling(straw_lengths)
%Calculates the buckling force and the uncertainity in the buckling force
%based on the empirical best fit from the data of the whole class
%Straw_lengths - vector containing the length of straws in centimeters
%Equation: W(N) = A  * L ^ -a; Paramters A, a;

%A = 197.7 +- 56.9
A = 197.7;
delta_A = 56.9;
%a = 1.238 +- 0.114
a = 1.238;
delta_a = 0.114;
%Calculate Buckling
buckling = A * straw_lengths  .^ (-a);
%Calculate Error
%Use partial derivatives to calculate the differential of buckling forche
%which will be our error
%
diff1 = delta_A * straw_lengths ^ (-a);
diff2 = -A * delta_a * log(straw_lengths) .* straw_lengths .^ (-a);
delta_buckling = diff1 + diff2;

disp("Buckling Forces with Uncertainity")
disp("Will display in same order of vector")
for i = 1:length(buckling)
    fprintf("m%d: %.2f ± %.3f Newtons\n", i, buckling(i), delta_buckling)
end

