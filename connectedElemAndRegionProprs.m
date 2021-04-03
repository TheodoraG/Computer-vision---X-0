function [nrObiecte,proprX0, t_en, t_area] = connectedElemAndRegionProprs(imgBinara)
    %4. gasire elem conectate utiliz o vecinatatate V4
    cc = bwconncomp(imgBinara, 4);
    nrObiecte = cc.NumObjects;

    %5. extragerea proprietatilor regiunii
    proprX0 = regionprops(cc, 'all');
    t_en = [proprX0.EulerNumber];
    t_area = [proprX0.Area];
end

