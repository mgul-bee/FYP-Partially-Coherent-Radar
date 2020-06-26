clc;
clear all;
close all;
format short
%% time specifications
M=300;   % M+1 coherence lengths 
N=15;  % N+1 phase jumps in each coherence window <=8
Fc=6e9; % carrier frequency
Fs=16*Fc; % sampling Frequency
c=3e8; % speed of light
init_cycles=2; % no. of cycles in 1st coherence window, per phase length
incr_cycles=1; % no. of  cycles to be  added to each coherence length, per phase length
phi=(-pi+(2*pi/((N+1)*(M+1))):(2*pi/((N+1)*(M+1))):pi); % uniform phase jumps
%phi= 2*pi*rand(1,(N+1)*(M+1)); % random phase jumps
Tx=[];
corr_lengths=[];
%% Transmission Signal Synthesis
for i=1:1:M+1
    for j=1:1:N+1
        t=0:1/Fs:(init_cycles/Fc+(i-1)*incr_cycles/Fc)-(1/Fs);
        Tx=horzcat(Tx,cos(2*pi*Fc*t+phi(j+(i-1)*(N+1))));
    end
    corr_lengths(i)=(N+1)*(length(t)); % coherence lengths 
end