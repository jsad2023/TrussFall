C = getC("makejoe3.txt", 11, 19);
[joints, memebrs] = size(C);
%get Sx and Sy
Sx = zeros(joints, 3);
Sy = zeros(joints, 3);
Sx(2,1) = 1;
Sy(2,2) = 1;
Sy(11, 3) = 1;

%Make X and Y
%     A  B  C   D   E  F   G   H   I   J   K

X = [0, -7, 9, 9, 18, 18, 27, 27, 36, 36, 49];
Y = [0, 9, 9, 0, 9, 0, 9, 0, 9, 0, 9]; 
% Make J vector
L = zeros(2 * joints, 1);
L(joints + 'F' - 64) = 1;
%[values_are_valid, is_statically_determinate] = are_values_valid(C,X,Y,Sx,Sy,L)
%values_are_correct = are_values_correct(C, X, Y, Sx, Sy, L)

save('Joe3.mat', 'C', 'Sy', 'Sx', 'L', 'X', 'Y')

