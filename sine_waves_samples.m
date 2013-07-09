function [data] = sine_waves_samples( f , Fs , t )
data(1,:)=sin(2*pi*f/Fs*t)'; 
data(2,:)=cos(2*pi*f/Fs*t)';
data(3,:)=sin(2*pi*f/Fs*t)';
data(4,:)=sin(2*pi*(1/4)*f/Fs*t)';
end

