
%Need Joe to give me the Which joints There is a horizantal rxn, a verical
%rxn, and the magnitude of the load

%Make C

%    1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19
C = [1, 0, 0, 0, 1, 0, 1, 1, zeros(1,11); %A
     1, 1, 0, 1, zeros(1,15); %B
     0, 1, 1, zeros(1,16);             %C
     0, 0, 1, 1, 1, 1, zeros(1,13);    %D
     zeros(1,5),    1, 1, 0, 1, 1 zeros(1,9); %E
     zeros(1,7),          1, 1, 0, 1, 1, zeros(1,7); %F
     zeros(1,9),                 1, 1, 0, 1, 1, zeros(1,5); %G
     zeros(1,11),                     1, 1, 0, 1, 1, 0, 0, 0; %H
     zeros(1,13),                            1, 1, 0, 1, 1, 0; %I
     zeros(1,15),                                  1, 1, 0, 1; %J
     zeros(1,17),                                         1  1]; %K

[joints, members] = size(C);
%ASK JOE Sx ??? Sy ????
Sx = zeros(joints, 3);
Sy = zeros(joints, 3);
Sx(3,1) = 1; Sy(3,2) = 1; Sy(joints,3) = 1;

%Put a one where rxn forces are
%X and Y
 X = [16, 8, 0, 16, 25, 25, 34, 34, 42, 42, 55];
 Y = [0, 4.5, 9, 9, 9, 0, 9, 0, 9, 0, 9];
 
 %Make L
 %GET JOE TO GIVE ME THE MAGNITUDE OF LOAD
 L = zeros(2 * joints, 1);
 L(joints + 6) = 4.9;
 
 %Uncomment when all issues are dealt with
 save('TrussShortDesignV1_JustinSadler_JosephGraham_PierreBoucher.mat','C','Sx','Sy','X','Y','L')

 
 
     