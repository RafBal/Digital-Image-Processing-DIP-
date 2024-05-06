close all
clc
clear all

R = imread('B4TM_1996.tif');
G = imread('B4TM_2006.tif');

RGB(:,:,1) = R;
RGB(:,:,2) = G;
RGB(:,:,3) = G;

imagesc(RGB)