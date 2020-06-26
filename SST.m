%% Targets and receiver
Targ=16.4; % assuming target at 16.4 meters
D=(Targ*2*Fs)/c;
Rx=[Tx(end-D:end) Tx(1:(end-(D+1)))];
Cm=zeros(1,M+1);
for i=1:1:M+1
    if i==1
        Cm(i)=mean(Tx(1:corr_lengths(i)).*Rx(1:corr_lengths(i)));
    else
        Cm(i)=mean(Tx(corr_lengths(i-1)+1:corr_lengths(i)).*Rx(corr_lengths(i-1)+1:corr_lengths(i)));
    end
end
scl=2.5;
figure
plot(1:1:length(Cm),Cm)
grid on
title('cross correlation of SST as function of coherence lengths')
xlabel('distance(m)')
ylabel('cross correlation(Cm)')
axis([1 M -inf inf])
xt = get(gca, 'XTick');                                 % 'XTick' Values
set(gca, 'XTick', xt, 'XTickLabel', xt/scl)
CM=diff(Cm); % differentiating cross correlation
[pk,loc]=max(CM)
figure
plot(1:1:length(CM),CM)
grid on
title('Derivative of cross correlation of SST as function of coherence lengths')
xlabel('distance(m)')
ylabel('cross correlation(CM)')
xt = get(gca, 'XTick');                                 % 'XTick' Values
set(gca, 'XTick', xt, 'XTickLabel', xt/scl)
