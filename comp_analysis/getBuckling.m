function getBuckling(straw_lengths)
%Calculates the buckling force and the uncertainity in the buckling force
%based on the empirical best fit from the data of the whole class
%Straw_lengths - vector containing the length of straws in centimeters
%Equation: W(N) = B  * L ^ -2 +- 2 * sigma; Paramters B, sigma;

%B = 1400 N*cm^2; sigma = 1.6 N 
B = 1400; sigma = 1.6;
buckling = B * L .^ (-2);
delta_buckling = 2 * sigma;

%Displays results
disp("Buckling Forces with Uncertainity")
disp("Will display in same order of vector")
for i = 1:length(buckling)
    fprintf("%d. %.2f ± %.3f Newtons\n", i, buckling(i), abs(delta_buckling(i)))
end
end
