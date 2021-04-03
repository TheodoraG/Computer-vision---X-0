function [] = detectXand0(img1,nrObiecte,t_en, t_area,proprX0)
    img3 = img1;
    figure;

    %7. etichetare
    for n = 1:nrObiecte
        t_area_new = t_area(n);
        t_en_new = t_en(n);
    
        %%conditii
        if  t_area_new >2500 && t_area_new < 7000
  
              if t_en_new == 1
                elem = 'X';
              else
                 elem = '0';
              end  
        
            rgb = insertObjectAnnotation(img3, 'rectangle', proprX0(n).BoundingBox, elem, 'Color', 'blue','FontSize', 68);
            imshow(rgb)
            title('Elementele de X si 0 detectate')
            pause(0.5)
            hold on
            img3 = rgb;
        end
    end
hold off
end

