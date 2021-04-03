function [A] = findCoordForX(centroidX_X,centroidY_X,A)
    for i= 1: length(centroidX_X)
        if((centroidX_X(i) >= 450 && centroidX_X(i)<=580) && (centroidY_X(i) >= 450 && centroidY_X(i) <=550))
            A(1,1) = 1;
        elseif((centroidX_X(i) >= 750 && centroidX_X(i)<880) && (centroidY_X(i) >= 450 && centroidY_X(i) <=550))
            A(1,2) = 1;
        elseif((centroidX_X(i) >= 1050 && centroidX_X(i)<1180) && (centroidY_X(i) >= 450 && centroidY_X(i) <=550))
            A(1,3) = 1;
        elseif((centroidX_X(i) >= 450 && centroidX_X(i)<=580) && (centroidY_X(i) >= 750 && centroidY_X(i) <=850))
            A(2,1) = 1;
        elseif((centroidX_X(i) >= 750 && centroidX_X(i)<880) && (centroidY_X(i) >= 750 && centroidY_X(i) <=850))
            A(2,2) = 1;
        elseif((centroidX_X(i) >= 1050 && centroidX_X(i)<1180) && (centroidY_X(i) >= 750 && centroidY_X(i) <=850))
            A(2,3) = 1;
        elseif((centroidX_X(i) >= 450 && centroidX_X(i)<=580) && (centroidY_X(i) >= 1080 && centroidY_X(i) <=1200))
            A(3,1) = 1;
        elseif((centroidX_X(i) >= 750 && centroidX_X(i)<880) && (centroidY_X(i) >= 1080 && centroidY_X(i) <=1200))
            A(3,2) = 1;
        elseif((centroidX_X(i) >= 1050 && centroidX_X(i)<1180) && (centroidY_X(i) >= 1080 && centroidY_X(i) <=1200))
            A(3,3) = 1;
        end
    end
end

