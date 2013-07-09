function [ cell_array ] = windowed_correlation_hops( array_with_samples , window_size , step_size )
[~,N]=size(array_with_samples);
windows=(1:step_size:N-1);
num_windows = size(windows,2);
if step_size<window_size
	cell_array=cell(1,num_windows+1);
    for i=1:num_windows-1
        if step_size*i<window_size
            cell_array{1,i}=corr(array_with_samples(:,windows(i):windows(i)+window_size)');
        else 
            if i<num_windows-1
                cell_array{1,i}=corr(array_with_samples(:,windows(i-1):windows(i-1)+window_size-1)');
            else
                cell_array{1,i}=corr(array_with_samples(:,windows(i-1):windows(i-1)+window_size-1)');
                cell_array{1,i+1}=corr(array_with_samples(:,windows(i):N)');
            end
        end
    end
    cell_array{1,num_windows+1}=corr(array_with_samples(:,windows(num_windows):N)');
else
	cell_array=cell(1,num_windows);
	for i=1:num_windows-1
		cell_array{1,i}=corr(array_with_samples(:,windows(i):windows(i+1)-1)');
    end
    cell_array{1,num_windows}=corr(array_with_samples(:,windows(num_windows):N)');
end
end