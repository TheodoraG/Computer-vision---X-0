function [imgElemArea,imgXEulerNo,imgZeroEulerNo] = filterImage(imgBinara, intervalArie, intervalENZero, intervalENX)
    %gasire elem X si 0 dupa arie
    imgElemArea = bwpropfilt(imgBinara, 'Area', intervalArie);
    %diferentiere x si 0 dupa nr lui Euler
    imgZeroEulerNo = bwpropfilt(imgBinara, 'EulerNumber', intervalENZero);
    imgXEulerNo = bwpropfilt(imgBinara, 'EulerNumber', intervalENX);

    figure;
    imshow(imgElemArea);
    title('Imagine cu X si 0 - filtrare dupa arie');

    figure;
    imshow(imgZeroEulerNo);
    title('Imagine cu 0 -uri - filtrare dupa nr lui Euler');

    figure;
    imshow(imgXEulerNo);
    title('Imagine cu x -uri - filtrare dupa nr lui Euler');
end

