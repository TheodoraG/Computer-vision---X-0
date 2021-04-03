function [imgBinara] = preprocess(gray,prag)
    %3. binarizare imagine grayscale cu pragul ales
    imgBinara = imbinarize(gray, prag/255);

    figure;
    imshow(imgBinara);
    title('Img binara ')

    %complementare img binarizata
    imgBinara = imcomplement(imgBinara);
    imshow(imgBinara);
    title('Img binara complementata ')

end

