function compAnalysis(inputfile, varargin)
%Main function for computational analysis of a truss
%Format: compAnalysis(inputfile) or compAnalysis(inputfile, outputfile) 
%Makes file that contains variables

if fopen(inputfile) == -1
    disp('File open of input file is unsuccsessful')
else
    n = nargin;
    %Opens the ouptut file to write
    if n == 2
        outputfile = varargin{1};
        if fopen(outputfile) ~= -1
            error('Data file is already made')
        end
    end
    %Change the input file for different problems
    %calculates forces
    [T, compress_or_tens, straw_lengths, total_load] = get_forces_in_members(inputfile);

    %Get Cost
    load(inputfile,'C');
    cost = getCost(C, straw_lengths);

    %Get theoritical max load
    max_load = getMaxLoad(T,straw_lengths);
    %Print Results
    if n == 1
        printResults(T,compress_or_tens, total_load, cost, max_load)
    elseif n == 2
        outputfile = varargin{1};
        printResults2File(T,compress_or_tens, total_load, cost, max_load, outputfile)
    end
end
end
