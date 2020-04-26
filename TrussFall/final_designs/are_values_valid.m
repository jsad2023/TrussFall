function [values_are_valid, is_statically_determinate] = are_values_valid(C,X,Y,Sx,Sy,L)
%Checks if system is statically determinate and if the values of X,Y,Sx,Sy, and L are valid for connection matrix C.
%Format: [values_are_valid, is_statically determinate] = are_values_valid(C, X, Y, Sx, Sy, L);

%Checks if system is statically determinate 

[joints, members] = size(C)

if members + 3 ~= 2 * joints
  fprintf('Not_Statically_Determinate!\nNumber of members must equal 2 * number_of_joints - 3') 
  is_statically_determinate = false;    

else
  is_statically_determinate = true;
end

%Initializes are_values_valid
values_are_valid = true;
%Checks if sum of entries in each column is equal to 2
column_sums = sum(C);
is_2 = column_sums == 2; %Vectors with logical values. 1 - values is 2, 0- value is not 2
for i = 1:length(column_sums)
  if ~is_2(i)
    fprintf('Sum of entries in column %d of matrix C is %d. Should be 2\n', i, column_sums(i))
    values_are_valid = false;
  end
end

%%Go through X,Y,Sx,Sy, and L to make sure their sizes are correct 
[row_x, col_x] = size(Sx); [row_y, col_y] = size(Sy);
correct_values = [joints, joints, joints, 3, joints, 3, 2 * joints];
inputed_values = [length(X), length(Y), row_x, col_x, row_y, col_y, length(L)];
value_names = {'Length of X', 'Length of Y', 'Rows of Sx','Columns of Sx','Rows of Sy', ...
  'Columns of Sy', 'Length of L'};
if any(inputed_values ~= correct_values)
  for i = 1:length(value_names)
    if inputed_values(i) ~= correct_values(i)
      fprint('%s: Expected Value: %d, Got: %d\n',value_names{i},correct_value(i),inputed_value(i))
    end
  end
  values_are_valid = false;
end
end


