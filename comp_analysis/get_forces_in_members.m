function [T, compress_or_tens, straw_lengths, total_load] = get_forces_in_members(inputfile)
%%Header
%Format: [T, compres_or_tens, uncertainties, straw_lengths] = get_forces_in_members(filename)
%
% JS Algorithm - Steps 2 -7 
%I think the rest of this should be in a seprate file
%2.
%% Load variables:
load(inputfile,'C', 'Sx', 'Sy', 'X', 'Y', 'L')
%Puts numbers of joints and members into variables

[joints, members] = size(C);

%% Constructing the equilibrium equations 

A = zeros( 2*joints, members+3); %Pre-allocates coefficient matrix
straw_lengths = zeros(1, members); %Pre-allocates vector containing length of straws
total_load = sum(L);

%Loop through columns of C
for j = 1:members
    connect_joints = find(C(:,j)); %finds out which rows in C contain a 1
    row1 = connect_joints(1);
    row2 = connect_joints(2); %This will tell us which joints are connected for member j.
    %Computes unit vector of horizantal and vertical component of dist from joint 1 to joint 2
    x_dist = (X(row2) - X(row1));
    y_dist = (Y(row2) - Y(row1));
    %Gets magnitude of distance between joints
    dist = sqrt( x_dist ^ 2 + y_dist ^ 2);
    straw_lengths(j) = dist;
    
    %Inputs into matrix A
    A(row1,j) = x_dist / dist;
    A(row2,j) = - x_dist / dist; %Use negative to reverse direction
    %Go down by 'joints'  for the y components
    A((row1 + joints),j) = y_dist / dist;
    A((row2 + joints),j) = - y_dist / dist;
end

%% Puts Sx and Sy into matrix A 
%Sx are put in the first half of the rows of A, and last three columns

A(1:joints, ( members + 1 ):( members + 3 ) ) = Sx;
A( (joints + 1 ): (2 * joints), ( members + 1 ):( members + 3 ))  = Sy;   

%% Gets Tensions of each memeber 1:members will be member forces, 
T = inv(A) * L;

%% Rounds variables
T = round(T, 3, 'significant');



%%Finds which forces are positive or negative

compress_or_tens = cell(1,members);
for i = 1:members
    if  T(i) > 0
        compress_or_tens{i} = '(T)';
    elseif T(i) < 0
        compress_or_tens{i} = '(C)';
    else
        compress_or_tens{i} = 'Zero';
    end
end
        









