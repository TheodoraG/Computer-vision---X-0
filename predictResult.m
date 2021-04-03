function [player, remiza, nu_se_stie] = predictResult(A)
    player = 3;
    remiza = 0;
    nu_se_stie = 0;
    %1.linia de sus
    if(A(1,1) == A(1,2) && A(1,2) == A(1,3))
        player = A(1,1);
        if(player == 1 || player == 0)
            fprintf('Castigator: %d - linia de sus \n', player);
        end
        %2.linia din mijloc
        elseif(A(2,1) == A(2,2) && A(2,2) == A(2,3))
            player = A(2,1);
            if(player == 1 || player == 0)
                fprintf('Castigator: %d - linia din mijloc \n', player);
            end
        %3.linia de jos
        elseif(A(3,1) == A(3,2)&& A(3,2) == A(3,3))
            player = A(3,1);
            if(player == 1 || player == 0)
                fprintf('Castigator: %d  - linia de jos \n', player);
            end
        %4.coloana din stanga
        elseif(A(1,1) == A(2,1) && A(2,1) == A(3,1))
            player = A(1,1);
            if(player == 1 || player == 0)
                fprintf('Castigator: %d - coloana din stanga \n', player);
            end
        %5.coloana din mijloc
        elseif(A(1,2) == A(2,2) && A(2,2) == A(3,2))
            player = A(1,2);
            if(player == 1 || player == 0)
                fprintf('Castigator: %d - coloana din mijloc \n', player);
            end
        %6.coloana din dreapta
        elseif(A(1,3) == A(2,3) && A(2,3) == A(3,2))
            player = A(1,3);
            if(player == 1 || player == 0)
                fprintf('Castigator: %d - coloana din dreapta \n', player);
            end
        %7.diagonala 1
        elseif(A(1,1) == A(2,2) && A(2,2) == A(3,3))
            player = A(1,1);
            if(player == 1 || player == 0)
                fprintf('Castigator: %d  - diagonala 1 \n', player);
            end
        %8.diagonala 2
        elseif(A(1,3) == A(2,2) && A(2,2) == A(3,1))
            player = A(1,3);
            if(player == 1 || player == 0)
                fprintf('Castigator: %d - diagonala 2 \n', player)
            end
        %remiza
        elseif(sum(sum(A(:,:)==1)) + sum(sum(A(:,:)==0))==9)
            fprintf('Remiza \n');
            remiza =1;
        else
            fprintf('Ambii jucatori pot sa castige inca \n');
            nu_se_stie = 1;
    end
end

