function [pairs1,pairs2] = findpairs2(vec1, vec2,dist)
pairs1=NaN(1,min(length(vec1),length(vec2)));
pairs2=NaN(1,min(length(vec1),length(vec2)));
for i = 1:length(vec1)
    for j =1:length(vec2)
        if abs(vec1(i)-vec2(j))<dist
            break;
        end
    end
    pairs1(i)=vec1(i);
    pairs2(i)=vec2(j);
end
