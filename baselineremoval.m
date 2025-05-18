function [data_baseline_removed,hpks,hlocs] = baselineremoval(data_wt)
[pks,locs]=findpeaks(-data_wt,"MinPeakDistance",0.6e4,"MinPeakProminence",max(data_wt)/4-min(data_wt)/4);
trend=zeros(1,length(data_wt));
for i =1:numel(locs)-1
    [p,S,mu]=polyfit(locs(i:i+1),-pks(i:i+1),1);
    trend(locs(i):locs(i+1))=polyval(p,(locs(i):locs(i+1)),[],mu);
end
data=data_wt-trend;
% data2=zeros(1,length(data));
[hpks,hlocs]=findpeaks(data(locs(1):locs(end)),"MinPeakDistance",1e4,"MinPeakProminence",max(data)/4-min(data)/4);
% 
% 
% for i =1:numel(pairs1)-1
%     data2(locs(i):locs(i+1))=data(locs(i):locs(i+1))/hpks(i);
% end
data_baseline_removed = normalize(data);