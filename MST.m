%% Targets 
Targ0=20;
D0=round((Targ0*2*Fs)/c);
Targ1=40;
D1=round((Targ1*2*Fs)/c);
Targ2=60;
D2=round((Targ2*2*Fs)/c);
Rx1=[Tx(end-D0:end) Tx(1:(end-(D0+1)))]; % reflection of first target seperately
Rx2=[Tx(end-D1:end) Tx(1:(end-(D1+1)))]; % reflection of second target seperately
Rx3=[Tx(end-D2:end) Tx(1:(end-(D2+1)))]; % reflection of second target seperately
RX=Rx1+Rx2+Rx3; % combined reflections of 1st and 2nd target
% Correlation at coherence lengths
Cm1=zeros(1,M+1);
Cm2=zeros(1,M+1);
cm=zeros(1,M+1);
for i=1:1:M+1
    if i==1
        Cm1(i)=mean(Tx(1:corr_lengths(i)).*Rx1(1:corr_lengths(i)));
        Cm2(i)=mean(Tx(1:corr_lengths(i)).*Rx2(1:corr_lengths(i)));
        cm(i)=mean(Tx(1:corr_lengths(i)).*RX(1:corr_lengths(i)));
    else
        Cm1(i)=mean(Tx(corr_lengths(i-1)+1:corr_lengths(i)).*Rx1(corr_lengths(i-1)+1:corr_lengths(i)));
        Cm2(i)=mean(Tx(corr_lengths(i-1)+1:corr_lengths(i)).*Rx2(corr_lengths(i-1)+1:corr_lengths(i)));
        cm(i)=mean(Tx(corr_lengths(i-1)+1:corr_lengths(i)).*RX(corr_lengths(i-1)+1:corr_lengths(i)));
    end
    
end
scl=2.5;
% display each target seperately
figure
subplot(221)
plot(1:1:length(Cm1),Cm1)
axis([1 M -inf inf])
grid on
xt = get(gca, 'XTick');                                 % 'XTick' Values
set(gca, 'XTick', xt, 'XTickLabel', xt/scl)
title('cross correlation of SST as function of coherence lengths')
xlabel('coherence lengths(lm)')
ylabel('cross correlation(Cm)')
subplot(222)
plot(1:1:length(Cm2),Cm2)
axis([1 M -inf inf])
grid on
xt = get(gca, 'XTick');                                 % 'XTick' Values
set(gca, 'XTick', xt, 'XTickLabel', xt/scl)
title('cross correlation of SST as function of coherence lengths')
xlabel('coherence lengths(lm)')
ylabel('cross correlation(Cm)')

CM1=diff(Cm1);
CM2=diff(Cm2);
subplot(223)
plot(1:1:length(CM1),CM1)
grid on
xt = get(gca, 'XTick');                                 % 'XTick' Values
set(gca, 'XTick', xt, 'XTickLabel', xt/scl)
title('Dericative of cross correlation of SST as function of coherence lengths')
xlabel('coherence lengths(lm)')
ylabel('cross correlation(Cm)')
[pk1,loc1]=max(CM1)
subplot(224)
plot(1:1:length(CM2),CM2)
grid on
xt = get(gca, 'XTick');                                 % 'XTick' Values
set(gca, 'XTick', xt, 'XTickLabel', xt/scl)
title('Dericative of cross correlation of SST as function of coherence lengths')
xlabel('coherence lengths(lm)')
ylabel('cross correlation(Cm)')

% Display both targets at once,
figure
subplot(211)
plot(1:1:length(cm),cm)
axis([1 M -inf inf])
grid on
xt = get(gca, 'XTick');                                 % 'XTick' Values
set(gca, 'XTick', xt, 'XTickLabel', xt/scl)
title('Cross correlation of MST as function of coherence lengths')
xlabel('distance(m)')
ylabel('cross correlation(Cm)')

subplot(212)
c_m=diff(cm);
plot(1:1:length(c_m),c_m)
grid on
xt = get(gca, 'XTick');                                 % 'XTick' Values
set(gca, 'XTick', xt, 'XTickLabel', xt/scl)
title('Dericative of cross correlation of MST as function of coherence lengths')
xlabel('distance(m)')
ylabel('cross correlation(Cm)')
