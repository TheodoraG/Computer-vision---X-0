function [A] = findCoordFor0(centroidX_0,centroidY_0, A)
    for i= 1: length(centroidX_0)
        if((centroidX_0(i) >= 450 && centroidX_0(i)<=580) && (centroidX_0(i) >= 450 && centroidY_0(i) <=550))
            A(1,1) = 0;
        elseif((centroidX_0(i) >= 750 && centroidX_0(i)<880) && (centroidY_0(i) >= 450 && centroidY_0(i) <=550))
            A(1,2) = 0;
        elseif((centroidX_0(i) >= 1050 && centroidX_0(i)<1180) && (centroidY_0(i) >= 450 && centroidY_0(i) <=550))
            A(1,3) = 0;
        elseif((centroidX_0(i) >= 450 && centroidX_0(i)<=580) && (centroidY_0(i) >= 750 && centroidY_0(i) <=850))
            A(2,1) = 0;
        elseif((centroidX_0(i) >= 750 && centroidX_0(i)<880) && (centroidY_0(i) >= 750 && centroidY_0(i) <=850))
            A(2,2) = 0;
        elseif((centroidX_0(i) >= 1050 && centroidX_0(i)<1180) && (centroidY_0(i) >= 750 && centroidY_0(i) <=850))
            A(2,3) =0;
        elseif((centroidX_0(i) >= 450 && centroidX_0(i)<=580) && (centroidY_0(i) >= 1080 && centroidY_0(i) <=1200))
            A(3,1) = 0;
        elseif((centroidX_0(i) >= 750 && centroidX_0(i)<880) && (centroidY_0(i) >= 1080 && centroidY_0(i) <=1200))
            A(3,2) = 0;
        elseif((centroidX_0(i) >= 1050 && centroidX_0(i)<1180) && (centroidY_0(i) >= 1080 && centroidY_0(i) <=1200))
            A(3,3) = 0;
        end
    end
end

