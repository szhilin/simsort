function Params = setparam(featuresFile)
load(featuresFile); %raisin_results_CSandSimple
%load raisin_results_CSandSimple
%b1=b; b2=b; b1(1)=b1(1)-tr-0.01; b2(1)=b2(1)-tr+0.01;
b1=b; b2=b; b1(1)=b1(1)-tr; b2(1)=b2(1)-tr;

N=1000;
[Xcloned, protonum] = clonesample(featuresUsed,N,1);
%[Xcloned, protonum] = clonesample0(featuresUsed,N);
Lcloned = labels(protonum)+1;

Params=struct('B1',b1,...
    'B2',b2,...
    'Xsrc',featuresUsed,...
    'Lsrc',labels+1,...
    'Xcloned',Xcloned,...
    'Lcloned',Lcloned)

