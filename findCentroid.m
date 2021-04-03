function [centroidX,centroidY,centroidX_X, centroidY_X,centroidX_0,centroidY_0] = findCentroid(img1,proprX0,t_area,t_en)
    centroidX =[];
    centroidY =[];
    centroidX_X =[];
    centroidY_X =[];
    centroidX_0 =[];
    centroidY_0 =[];

    figure;
    imshow(img1); hold on;
    for x = 1:numel(proprX0)
        t_area_new = t_area(x);
        t_en_new = t_en(x);
        if  t_area_new >2500 && t_area_new < 7000
            plot(proprX0(x).Centroid(1),proprX0(x).Centroid(2),'ro');

            if t_en_new == 1
               elem = 'X';
               centroidX_X = [centroidX_X proprX0(x).Centroid(1)];
               centroidY_X = [centroidY_X proprX0(x).Centroid(2)];
            else
               elem = '0';
               centroidX_0 = [centroidX_0 proprX0(x).Centroid(1)];
               centroidY_0 = [centroidY_0 proprX0(x).Centroid(2)];
            end
            %[arrayCentroidX ,arrayCentroid(n,1), arrayCentroid(n,2)];
            centroidX = [centroidX proprX0(x).Centroid(1)];
            centroidY = [centroidY proprX0(x).Centroid(2)];

        end
   end

end

