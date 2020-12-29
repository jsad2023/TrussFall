function values_are_correct = are_values_correct(C, X, Y, Sx, Sy, L)
%Has the user double check to see if the values the variables that the variable indicate are correct
%Format: values_are_correct = are_values_correct(C, X, Y, Sx, Sy, L)

values_are_correct = true; %initializes variable
%check connection matrix

[joints, members] = size(C);

for j = 1:members
  connected_joints = find(C(:,j)); %Find where C indicates joints are connected by member j
  fprintf('Is member %d connected to joints %d and %d?: \n', j, connected_joints(1),connected_joints(2))
  values_are_correct = check_if_right;
end


for i = 1:joints
  %Checks if coordiants are correct
  fprintf('Is joint %d located at\nX =  %.3f\nY = %.3f\n', i, X(i), Y(i))
  values_are_correct = check_if_right;
  
  %Checks if Sx,Sy, and L is correct
  
  if Sx(i,1)
    fprintf('Is a horizantal reaction force exerted at joint %d\n',i)
    values_are_correct = check_if_right;
  end
  
  if Sy(i,2)
    fprintf('Is a vertical reaction force exerted at joint %d\n',i)
    values_are_correct = check_if_right;
  end
  
   if Sy(i,3)
    fprintf('Is a vertical reaction force exerted at joint %d\n',i)
     values_are_correct = check_if_right;
   end
    
    if L(i)
    fprintf('Is a load of %.3f exerted at joint %d\n', L(i), i)
    values_are_correct = check_if_right;
    end
 end

 
 function values_are_correct = check_if_right()
 %Asks the user if what what inputted was right
 %Format = is_right = check_if_right
 is_right = input('Type ''1'' for yes and ''0'' for no: ');
      if is_right
          values_are_correct = true;
      else
          values_are_correct = false;
      end
 end
end
 
 
     



