function compare_results(m)
    format long g
    %open results of correlation from SI
    fid = fopen('output.csv');
    Cell_with_timestamps = textscan(fid, '%s', 'delimiter', ',');
    Values_SI = cell2mat(cellfun(@str2num, Cell_with_timestamps{1}, 'UniformOutput', false));
    Result_SI = reshape(Values_SI,m,[])';
    fclose(fid);
    %open results of correlation from Matlab
    fid = fopen('result.csv');
    Cell_with_values = textscan(fid, '%f', 'delimiter', ',');
    Values_M = cell2mat(Cell_with_values);
    Result_M = reshape(Values_M,m,[])';
    fclose(fid);
    Result_M = roundn(Result_M,-5);
    Result_SI = roundn(Result_SI,-5);
    if isequal(Result_M,Result_SI), disp('Equal!');
end

