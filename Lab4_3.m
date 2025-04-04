%This code sets up the time and frequency vectors for all the numerical
clear 
format long e
tend = 10;
tbeg = -10;
N = 100000;
tstep = (tend-tbeg)/N;
sampling_rate = 1/tstep;

%Time window =
tt = tbeg:tstep:tend-tstep;

load('lab4_num_expt3');

maxlag = 200;
%Autocorrelation of yt
Rxy = xcorr(yt,xt,maxlag);
%tau vector
tau_vec = -(maxlag*tstep):tstep:maxlag*tstep;
%Abs. PSD corresponding to yt
Sy = abs(fftshift(fft(fftshift(Rxy))));
%define the frequency vector corresponding to tau_vec
Ntau = length(tau_vec);
%Nyquist sampling rate
fmax = sampling_rate/2; 
fmin = -fmax;
fstep = (fmax-fmin)/Ntau;
%Frequency window
freq = fmin:fstep:fmax-fstep;

% plot(tt, xt);
% xlabel("time");
% ylabel("xt");
% % title("y(t)");
% grid on;
% grid minor;

plot(Rxy, Sy);
grid on;
grid minor;
