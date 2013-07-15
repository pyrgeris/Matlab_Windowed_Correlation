function [CsvStamp]=create_timestamp(sine_waves_values) 
    [~,n]=size(sine_waves_values);
    CsvStamp=cell(n,1);
    frequency=0.200; %200 ms
    stamp = datenum(2012,08,21,4,0,0);
    for i=1:n
        C=datevec(stamp);
        CsvStamp{i}=datestr(C,'mm/dd/yyyy HH:MM:SS.FFF'); 
        C(6)=C(6)+frequency;
        stamp=datenum(C);
    end
end