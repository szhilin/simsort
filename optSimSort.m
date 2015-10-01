function optSimSort()

opts = gaoptimset('PlotFcns',{@gaplotbestf;@gaplotbestindiv}, ...
    'Generations', 10, ...
    'StallGenLimit', 10, ...
    'Display', 'iter');

lb = [-1 -1];
ub = [ 1  1];

IntCon = [];

tic

[x,fval,exitflag,output,population,scores] = ga(@costFun, 2, [], [], [], [], ...
    lb, ub, [], IntCon, opts)

toc

%function setupSim()
%set_param(Simulink.ConfigSet,'StopTime','40')

function obj = costFun(x)
global R1
global R2
global Params
%mdl = 'loop_wo_displays';
mdl = 'loop';

%R1=x(1);
%R2=x(2);

% Set model arguments
%Params=setparam('raisin_results_CSandSimple.mat');
Params.B1(1) = x(1);
Params.B2(1) = x(2);
R1 = Params.B1(1);
R2 = Params.B2(1);

% Simulate
simOut = sim(mdl);

% Get simulation outputs
%simAccepted = simOut.get('sim_Accepted');

%FN=sim_CMRejected(2,2,end);
%FP=sim_CMAccepted(2,1,end);

% Calculate objective function
%obj = -sim_Accepted(end); 
obj = sim_CMRejected(2,2,end) + sim_CMAccepted(2,1,end);
