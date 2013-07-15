clear all;
%Initialization
Fs = 1600;                          % Sampling Frequency(>5*f)
f  = 300;                           % Frequency   
t =(0 : 1 : 999);                   % Time Samples
window_size = 100;                  % Window Size
step_size = 50;                    % Step Size
if(window_size>=step_size)
    % Get sinewaves samples 
    sine_waves_values=sine_waves_samples( f , Fs , t );
    [m,n]=size(sine_waves_values);
    % Create TimeStamp For Csv File
    CsvStamp=create_timestamp(sine_waves_values);
    % Print Samples to CSV file
    % in order to be used as input at streaminsight app with timestamp
    create_csv_input(CsvStamp , sine_waves_values);
    % Calculate Correlation factor between ALL vectors
    % and store result to a 4x4 array
    Correlation_Factor_Full=corr(sine_waves_values');
    % Calculate Correlation factor between windowed vectors.
    % Also apply a step_size. Store result to a cell of 4x4 arrays
    Correlation_Factor_Windows_Hops=windowed_correlation_hops...
        (sine_waves_values,  window_size , step_size);
    % Correlation Factor of Hop_window is stored and printed in csv file
    % in every line of csv there is the correlation factor between every 
    % input sinewaves values for the current window
    print_output_to_csv(Correlation_Factor_Windows_Hops);
else
    fprintf('Windows Size must be >= Step Size\n');
end    