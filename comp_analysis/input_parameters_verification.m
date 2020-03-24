%Preliminary Truss Analysis

% Step 1 - Set Up Variables
%I think that this step should be in a file. Do the rest in another file
%Connection Matrix C

%Row rreps joint # and col is member #
%In example Truss there are 5 joints and 7 members. 5-joint/7-member truss.
%5j/7m
% Hence in C,  5 rows and 7 cols
% sum of each column should only be 2 as each member is only connected to 
%two joints
% sum of each row  should be # of members attached
%to corresponding joint
%Indicate a connection of member 1 to joints 1 and 2 by placing a 1 at
%(1,1) & (2,1)

%System must will be 8 by 13
  %  1 2 3 4 5 6 7 8 9 0 1 2 3
  C=[1 1 0 0 0 0 0 0 0 0 0 0 0; %A
     1 0 1 1 0 0 0 0 0 0 0 0 0; %B 
     0 0 1 0 1 1 0 0 0 0 0 0 0; %C
     0 1 0 1 1 0 1 1 0 0 0 0 0; %D
     0 0 0 0 0 1 1 0 1 1 0 0 0; %E
     0 0 0 0 0 0 0 1 1 0 1 1 0; %F
     0 0 0 0 0 0 0 0 0 1 1 0 1; %G
     0 0 0 0 0 0 0 0 0 0 0 1 1]; %H

%Connection matrix of support forces along each axis

%Statically determined Truss, supported by one pin and one roller joint
%3 unkonwn rxns
%Put a 1 at joint j where unknown rxn force is

Sx=[1 0 0; 
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 0];
    
Sy=[0 1 0;
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 0;
    0 0 1];  



%Location Vectors
%Truss defined by location of joints
%j elemenmmts corresponding to location of jth joint

X=[0, 0, 4, 4, 8, 8, 12, 12];
Y=[0, 4, 8, 4, 8, 4, 4, 0];
  

%Load Vector
%Known forces on each joint; vector has 2j elements
% first j elements are loads in x dir. and last j elements are loads in y
% dir.

%First joint columns should be horizantal loads while second joint columns is vertical loads
[joints, members] = size(C);
L = zeros(2 * joints, 1);
L(joints + 4) = 25;
    
fprintf('Do you want to check if the variables are right?\n')
should_we_check = input('Enter 1 for yes or 0 for no: ');
if should_we_check
    %Check if system is valid and statically determinate
    [values_are_valid, is_statically_determinate] = are_values_valid(C, X, Y, Sx, Sy, L);
    
    %Checks if values are correct with user
    if values_are_valid && is_statically_determinate
      values_are_correct = are_values_correct(C, X, Y, Sx, Sy, L);
    else
      values_are_correct = false;
    end
else
    values_are_correct = true;
end
    
    %%Before saving variables to a file, shoule ask the user to check if inputs are correct by
    %%printing what the input variables indicate and having the program pause to give the user
    %%to check if that's correct. 
    
    if values_are_correct
      save('TrussVerificationProblem_JustinSadler_JosephGraham_PierreBoucher.mat','C','Sx','Sy','X','Y','L')
    else
      disp('Something went wrong. Variable will not be saved')
    end
