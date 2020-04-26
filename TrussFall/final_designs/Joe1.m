% joints x member matrix. Columns should add to 2
%1 if a member touches a joint, put a 1
%11 by 19 matrix

C = getC("makeJoe1.txt", 11, 19);
[joints, memebrs] = size(C);
%get Sx and Sy
Sx = zeros(joints, 3);
Sy = zeros(joints, 3);
Sx(3,1) = 1;
Sy(3,2) = 1;
Sy(11, 3) = 1;

%Make X and Y
%     A  B  C   D   E  F   G   H   I   J   K
X = [16, 8, 0, 16, 25, 25, 34, 34, 43, 43, 56];
Y = [0, 4.5,  9, 9, 9, 0, 9, 0, 9, 0, 9];

% Make J vector
L = zeros(2 * joints, 1);
L(joints + 'F' - 64) = 1;
%[values_are_valid, is_statically_determinate] = are_values_valid(C,X,Y,Sx,Sy,L)
%values_are_correct = are_values_correct(C, X, Y, Sx, Sy, L)

save('Joe1.mat', 'C', 'Sx', 'Sy', 'L', 'X', 'Y')
