%% targets and reflections
targ_speed=6; % = 2,4,6
Targ0=16;
targ_pos=(Targ0*2*Fs)/c; % initial target position in number of samples (round trip delay in samp)
C_m=zeros(1,M+1);
C_M=zeros(1,M+1);
for i=1:1:M+1
    D0=targ_pos;
    if i==1
        ph_shift=0;
    else
        ph_shift=targ_speed*i*10; % phase shift for each sweep-per-point
    end
    DD=D0+ph_shift;
    rx=[Tx(end-D0:end) Tx(1:(end-(D0+1)))];
    RRx=[Tx(end-DD:end) Tx(1:(end-(DD+1)))];
    if i==1
        C_m(i)=mean(Tx(1:corr_lengths(i)).*rx(1:corr_lengths(i)));
        C_M(i)=mean(Tx(1:corr_lengths(i)).*RRx(1:corr_lengths(i)));
    else
        C_m(i)=mean(Tx(corr_lengths(i-1)+1:corr_lengths(i)).*rx(corr_lengths(i-1)+1:corr_lengths(i)));
        C_M(i)=mean(Tx(corr_lengths(i-1)+1:corr_lengths(i)).*RRx(corr_lengths(i-1)+1:corr_lengths(i)));
    end
end
figure
scl=2.5;
plot(1:1:length(C_m),C_m)
grid on
axis([1 M -inf inf])
hold on
xt = get(gca, 'XTick');                                 % 'XTick' Values
set(gca, 'XTick', xt, 'XTickLabel', xt/scl)
plot(1:1:length(C_M),C_M)
hold on
envelope(C_M,2,'peak')
hold on
xt = get(gca, 'XTick');                                 % 'XTick' Values
set(gca, 'XTick', xt, 'XTickLabel', xt/scl)