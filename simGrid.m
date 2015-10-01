function [ gB1, gB2, SA, SR ] = simGrid( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

lb = 0;
ub =  0.3;
step = 0.01;

[gB1,gB2] = meshgrid(lb:step:ub, lb:step:ub);

N=size(gB1,1);

for i = 1:N
    for j = 1:N-i+1
        [SA(i,j) SR(i,j)] = costFun([gB1(i,j) gB2(i,j)]);
        disp([i j SA(i,j) SR(i,j)]);
    end
end


function [SA SR] = costFun(x)
global R1
global R2
global Params

mdl = 'loop';

Params.B1(1) = x(1);
Params.B2(1) = x(2);
R1 = Params.B1(1);
R2 = Params.B2(1);

% Simulate

try
  simOut = sim(mdl);
catch e
    if(isa(e,'MSLException'))
        SA = 1000;
        SR = 1000;
        return;
    end
end

% Get simulation outputs
%simAccepted = simOut.get('sim_Accepted');

%FN=sim_CMRejected(2,2,end);
%FP=sim_CMAccepted(2,1,end);

% Calculate objective function
%obj = -sim_Accepted(end); 
SR = sim_CMRejected(1,2,end);
SA = sim_CMAccepted(2,1,end);

