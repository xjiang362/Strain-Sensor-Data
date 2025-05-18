NN1=60./HR1(2:end)-60./HR1(1:end-1);
NN2=60./HR2(2:end)-60./HR2(1:end-1);
NN3=60./HR3(2:end)-60./HR3(1:end-1);
RMSSD1=sqrt(mean(NN1.^2));
RMSSD2=sqrt(mean(NN2.^2));
RMSSD3=sqrt(mean(NN3.^2));