clc;
clear;
close all;

%1.citire imagine + transformare in imag grayscale
img1 = imread('X_&_0_1.jpg');
%img1 = imrotate(imread('X_&_0_2.jpg'),90);
img1 = imresize(img1,0.5);
gray = rgb2gray(img1);

figure;
subplot(2,1,1), imshow(img1);
title('Imag originala');
subplot(2,1,2), imshow(gray);
title('Imag grayscale');

%2. histograma imaginii alb_negru
%alegere prag din histograma
figure;
imhist(gray);
title('Histograma imagine grayscale')
prag = 70;

%3.obtinere imag binara complementata
imgBinara = preprocess(gray,prag);

%4. gasire elem conectate utiliz o vecinatatate V4
%5. extragerea proprietatilor regiunii
[nrObiecte,proprX0, t_en, t_area] = connectedElemAndRegionProprs(imgBinara);
nrObiecte
t_en
t_area


%6. filtrare imagine dupa proprietatile regiunii
intervalArie = [ 2500 7000];
intervalENZero = [0, 0.95];
intervalENX = [0.8, 1];
[imgElemArea,imgXEulerNo,imgZeroEulerNo] = filterImage(imgBinara, intervalArie, intervalENZero, intervalENX);

%7. etichetare X si 0
detectXand0(img1,nrObiecte,t_en, t_area,proprX0);

%8. gasire centroizi pt x si 0
[centroidX,centroidY,centroidX_X, centroidY_X,centroidX_0,centroidY_0] = findCentroid(img1,proprX0,t_area,t_en);
centroidX
centroidY
centroidX_X
centroidY_X
centroidX_0
centroidY_0

A = 2*ones(3,3);
%9.gasire pozitii in matrice pentru 0-uri
[A] = findCoordFor0(centroidX_0,centroidY_0, A);

%10.gasire pozitii in matrice pentru X-uri
[A] = findCoordForX(centroidX_X,centroidY_X,A);
A

%%11.predicite castigator
[player, remiza, nu_se_stie] = predictResult(A)