function print_output_to_csv(cell_array)
temparray=cell2mat(cell_array)';
[m,~]=size(temparray);
resultarray=temparray(1:4:m,:);
csvwrite('result.csv',resultarray);
end