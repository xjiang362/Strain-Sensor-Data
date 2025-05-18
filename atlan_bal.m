function [xpos,ypos]=atlan_bal(data1,data2,color,pos)
xpos=(data1+data2)/2;
ypos=data2-data1;
% p=polyfit(xpos,ypos,1);
% yfit=polyval(p,xpos);
% std_val=std(ypos);
scatter(xpos,ypos,'filled','MarkerFaceColor',color,'MarkerEdgeColor',color)
set_box(pos);
% hold on
% plot(xpos,yfit)
% plot(xpos,yfit+1.96*std_val,'--r')
% plot(xpos,yfit-1.96*std_val,'--r')
% hold off