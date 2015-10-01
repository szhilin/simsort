function Params = setparam(featuresFile)

load(featuresFile); %raisin_results_CSandSimple
%load raisin_results_CSandSimple

%b1=b; b2=b; b1(1)=b1(1)-tr-0.01; b2(1)=b2(1)-tr+0.01;
b1=b; b2=b; b1(1)=b1(1)-tr; b2(1)=b2(1)-tr;

% Number of cloned particles
N=1000;

[Xcloned, protonum] = clonesample(featuresUsed,N,1);
%[Xcloned, protonum] = clonesample0(featuresUsed,N);
Lcloned = labels(protonum)+1;

% Ejector nozzle size, mm
%nozzle_dx=4.5;
%nozzle_dy=0.5;
%nozzle_sq=nozzle_dx*nozzle_dy;

% Particle size, mm
%particle_dx=5;
%particle_dy=2;

% Probability distribution of mis-ejected particles
p=[0.7 0.2 0.1];
Jet_cumprob=[0 cumsum(p)];
%ind=max(find(rand()>cumprob))-1;

Params=struct('B1',b1,...
    'B2',b2,...
    'Xsrc',featuresUsed,...
    'Lsrc',labels+1,...
    'Xcloned',Xcloned,...
    'Lcloned',Lcloned,...
    'Jet_cumprob',Jet_cumprob);

