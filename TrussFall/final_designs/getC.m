function mat = getC(filename, joints, mem)
% Gets the Connection matrix,
%filename: name of text file 
%mem: members number
%joints: joints member

mat = zeros(joints, mem);
fid = fopen(filename);
line = fgetl(fid);
while(line ~= -1)
    [m, j] = strtok(line, '.');
     m = str2double(m);
     j1 = j(3) - 64;
     j2 = j(4) - 64;
     mat(j1,m) = 1;
     mat(j2,m) = 1;
     line = fgetl(fid);
end
end

