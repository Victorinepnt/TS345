clear;
close all;
clc;

addpath('lib/matlab-tanner-graphs/');
addpath('lib/matlab-tanner-graphs/')


%% BP


H = [1 0 1 0 1 0 1;0 1 1 0 0 1 1;0 0 0 1 1 1 1];
G =  tanner_graph(H);
[mot_code,msg_estim] = BP(H, G);