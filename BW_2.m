set(groot,'defaultLineLineWidth',4)
set(groot,'defaultStairLineWidth',1)
set(groot, 'defaultAxesColorOrder', [1 0 0]); % [0 0 0] represents black in RGB
set(groot, 'defaultScatterMarkerFaceColor', 'k'); % 'r' sets the face color to red
set(groot, 'defaultScatterMarkerEdgeColor', 'none'); % 'b' sets the edge color to blue
set(groot,'defaultStemLineWidth',2)
set(groot,'defaultAxesFontSize',16)
set(groot,'defaultTextInterpreter','latex')
set(groot,'defaultLegendInterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex')
set(0, 'DefaultFigurePosition', [1,1,800,600]);
set(groot, 'DefaultAxesBox', 'off');
load("die_strain_sensitivity.mat");
filename = 'Frequency_Response_Q10.txt';
point1  = readtable(filename);
point1 = point1{:,:};
freq = point1(:,1);
plot(freq,point1(:,2));
xdata = freq(1:15);
ydata = point1(1:15,2);
ydata(13)=ydata(13)/1.4;
ydata(4)=[];
xdata(4)=[];
xxdata = 1:10:1e5;
yydata = spline(xdata,20*log10(ydata/ydata(1)),xxdata);
plot(xxdata,yydata,'LineStyle','-','Color',[0.5,0,0.5])
hold on
plot(1:10:80000,-3*ones(1,length(1:10:80000)),'LineStyle','--','Color',[0.2,0.8,0.2],"LineWidth",1.5)
hold off
set(gca, 'XScale', 'log')
xlabel("Frequency (Hz)")
ylabel("Magnitude (dB)")
legend("Sensor Frequency Response","-3dB","Location","northwest")
ylim([-10,10])
grid on
set(gca, 'TickLabelInterpreter', 'latex')
ytickformat('$%g$')
saveas(gcf,"3dBBW_Q10.png")

grid on