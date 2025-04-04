%This code sets up the time and frequency vectors for all the numerical
clear;
format long e
tend = 10;
tbeg = -10;
N = 100000;
tstep = (tend-tbeg)/N;
sampling_rate = 1/tstep;

%Time window =
tt = tbeg:tstep:tend-tstep;

load('lab4_num_expt2')

maxlag = 20000;
%Autocorrelation of yt
Ry  = xcorr(yt,yt,maxlag);
%tau vector
tau_vec = -(maxlag*tstep):tstep:maxlag*tstep;
%Abs. PSD corresponding to yt
Sy = abs(fftshift(fft(fftshift(Ry))));
%define the frequency vector corresponding to tau_vec
Ntau = length(tau_vec);
%Nyquist sampling rate
fmax = sampling_rate/2; 
fmin = -fmax;
fstep = (fmax-fmin)/Ntau;
%Frequency window
freq = fmin:fstep:fmax-fstep;

plot(freq, Ry);
xlabel("Frequency (Hz)");
ylabel("R_y");
title("R_y at maxlag = 20000");
grid on;
grid minor;

plot(tt, yt);
xlabel("time");
ylabel("yt");
title("y_t at maxlag = 20000");
grid on;
grid minor;