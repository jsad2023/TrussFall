function printResults(T,compress_or_tens, load, varargin)
%%Prints results. If there is a filename added to the last paramter, prints the results to the file.
%%Format printResults(T,compress_or_tens, load, varargin)

%%Should edit later to include theoritical max load and cost of truss. 

n = nargin;
members = length(T) - 3;
rxn_names = ["Sx1", "Sy1", "Sy2"]; 
if n == 4
  fid = fopen(varargin{1});
  if fid == -1
    fid = fopen(varargin{1}, 'w');   
  end
end

%Use 2 for loops to print everything
%May print to a file in the future, but for now print to console
fprintf('\\ %% EK301, Section A4, Truss Fall, Justin Sadler, Joseph Graham, Pierre Boucher, 3/17/2020\n')
fprintf('Load: %3f N\n', load)  

fprintf('Member forces in Newtons: \n')
for i = 1:members
   if n == 4
      fprintf(fid, 'm%d: %3f %s\n', i, abs(T(i)), compress_or_tens{i});
    else
      fprintf('m%d: %3f %s\n', i, abs(T(i)), compress_or_tens{i})
    end
end

fprintf('Reaction forces in Newtons: \n')
for i = 1:3
  if n == 4
        fprintf(fid, '%s: %3f\n', rxn_names(i), T(i + members));
  else
        fprintf('%s: %3f\n', rxn_names(i), T(i + members))
  end
end

if n == 4
  closeresult = fclose(fid);
  if closeresult == 0
    disp('File close successful')
  else
    disp('File close unsuccessful')
  end
end
