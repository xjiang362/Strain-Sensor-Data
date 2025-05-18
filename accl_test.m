set(groot,'defaultLineLineWidth',3)
set(groot,'defaultStairLineWidth',3)
set(groot, 'defaultAxesColorOrder', [0 0 0]); % [0 0 0] represents black in RGB
set(groot, 'defaultScatterMarkerFaceColor', 'k'); % 'r' sets the face color to red
set(groot, 'defaultScatterMarkerEdgeColor', 'k'); % 'b' sets the edge color to blue
set(groot,'defaultStemLineWidth',4)
set(groot,'defaultAxesFontSize',14)
set(groot,'defaultTextInterpreter','latex')
set(groot,'defaultLegendInterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex')
set(0, 'DefaultFigurePosition', [100, 100,800, 600]);
set(groot, 'DefaultAxesBox', 'off');
ACM1=ACM(1e5:3e5);
logical_index = ACM1 < 2e6;
ACM1(~logical_index)=NaN;
logical_index = ACM1 > 2.4e5;
ACM1(~logical_index)=NaN;
ACM1=movmean(ACM1,10000,"omitnan");
ACM1=-ACM1(31347:128105);
ACM1=ACM1-mean(ACM1);
ACM_cap=ACM1*18.72/6870;

SPG1=SPG(1e5:3e5);
logical_index = SPG1 < 2e6;
SPG1(~logical_index)=NaN;
logical_index = SPG1 > 1e5;
SPG1(~logical_index)=NaN;
SPG1=movmean(SPG1,10000,"omitnan");
SPG1 = SPG1(31347:128105)-mean(SPG1);
SPG_cap=SPG1*9.36/5700;

Signal3 = 0.27*cos(linspace(0, 8.024*pi, length(ACM1)));
figure()

yyaxis left;
plot(0:T:T*(length(ACM1)-1),ACM_cap,"LineStyle","-","Color",'r')
hold on
plot(0:T:T*(length(SPG1)-1),SPG_cap,"LineStyle","-","Color",[0,0,1])
ylabel("Capacitance Change (fF)")

yyaxis right;
plot(0:T:T*(length(ACM1)-1),Signal3,"LineStyle","- -","Color","k","LineWidth",5)
ylabel("Input Acceleration ($m/s^2$)")
ylim([-0.35,0.35])
hold off
legend('Accelerometer Design', 'Strain Sensor', 'Input Acceleration');
xlabel("Time (s)")
grid on
saveas(gcf,"accl.png")