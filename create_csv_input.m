function create_csv_input( CsvStamp, sine_waves_values )
    fid = fopen('input.csv','w');
    for i=1:size(CsvStamp);
        fprintf(fid, '%s,%d,%d,%d,%d\n', CsvStamp{i} , sine_waves_values(1:4,i));
    end
    fclose(fid);
end

