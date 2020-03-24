function printResults2File(T,compress_or_tens, total_load, cost, max_load, outputfile)
%prints the results to the file.
%Format printResults(T,compress_or_tens, total_load, cost, max_load, varargin)

members = length(T) - 3;
rxn_names = ["Sx1", "Sy1", "Sy2"]; 
fid = fopen(outputfile,'w');

%Use 2 for loops to print everything
fprintf(fid,'\\ %% EK301, Section A4, Truss Fall, Justin Sadler, Joseph Graham, Pierre Boucher, 3/17/2020\n');
fprintf(fid,'Load: %4f N\n', total_load);
%Print member forces
fprintf(fid,'Member forces in Newtons: \n');
for i = 1:members
  fprintf(fid,'m%d: %.3g %s\n', i, abs(T(i)), compress_or_tens{i});
end
%Print reaction forces
fprintf(fid,'Reaction forces in Newtons: \n');
for i = 1:3
    fprintf(fid,'%s: %.3g\n', rxn_names(i), T(i + members));
end
%Print Cost Theoritical max load
    fprintf(fid,'Cost of the Truss: $%.3g\n', cost);
    fprintf(fid,'Theoretical max load / cost ratio in N/$: %.3g\n', ...
        max_load / cost);
end
