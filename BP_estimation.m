set(groot, 'DefaultLineLineWidth', 4);
DBP0=80;
SBP0=120;
MAP0=2*DBP0/3+SBP0/3;
DBP1=80;
SBP1=180;
MAP1=2*DBP1/3+SBP1/3;
PTT1=0.1028;
PTT2=0.0893;
A=(MAP1-MAP0)/log(PTT2/PTT1);
disp(A)
DBP=MAP0+A*log(PTT./PTT1)-(SBP0-DBP0)/3*PTT1^2./PTT.^2;
SBP=DBP+(SBP0-DBP0)*PTT1^2./PTT.^2;
figure
yyaxis left
scatter(1:length(PTT),PTT)
ylabel("PTT (s)")
yyaxis right
hold on
plot(SBP,"Color",'r')
plot(DBP,"Color",'b')
ylabel("BP (mmHg)")
% plot(ones(1,length(SBP))*SBP0)
% plot(ones(1,length(SBP))*DBP0)
legend("PTT","Estimated SBP","Estimated DBP")