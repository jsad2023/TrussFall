function cost = getCost(C,straw_lengths)
%Calculates the cost of a truss based on the number of joints from the
%connection matrix and the straw lengths. Straw lengths will be stored in a
%vector 
%Format: cost = getCost(Connection_Matrix,staw_length)

[joints, ~] = size(C);

cost = 10 * joints + sum(straw_lengths);
end