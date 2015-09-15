function [ Xcloned, protonum ] = clonesample( X, N )
%CLONE Generation of Xcloned^(N) distributed with PDF estimate 
%     based on X^(n) with Epanechnikov kernel K and estimated bandwidth h 
%  Input:  
%     X - source matrix with data to clone
%     N - objects number in cloned data matrix
%  Output:
%     Xcloned - data matrix with N cloned objects
%     protonum - numbers of source objects which are 
%                prototypes of cloned ones
%  Reference:
%     Shakhnarovich G. Statistical Data Cloning for Machine Learning. 
%     MSc thesis. Technion, Haifa, 2001, p. 25, (Algorithm 1).
%  Example:
%     CovX = [10  -6; -6 5];
%     mu = [0 0];
%     S = mvnrnd(mu,CovX,100);
%     Scloned = clonesample(S,200);
%     figure
%     scatter(S(:,1),S(:,2),'b.')
%     hold on
%     scatter(Scloned(:,1),Scloned(:,2),'r.')

% Get size of source data matrix
[n d] = size(X);

% Whiten source data matrix
[Xwh, mu, invMat, whMat] = whiten(X,0.0001);

% Estimate kernel smoothing bandwidthes
h = estimatebw( Xwh );
%save -ascii Xwh.dat Xwh
%h = [0.7850228; 0.6657917] % c(dpik(S[,1],kernel="epanech"), dpik(S[,2],kernel="epanech"))

% Choose numbers of objects to clone
k = randi(n, [N 1]);
protonum = k;

% Get N x d matrix of random weights w ~ K, where K is Epanechnikov kernel
w = reshape(epan(N*d), N, d);

% Calc kernel smoothed errors by scaling weights to bandwidthes
E = bsxfun(@times, w, h');

% Clone k-th objects by adding errors
Xwhcloned = Xwh(k,:) + E;

% Dewhiten cloned data
Xcloned = bsxfun(@plus, Xwhcloned*invMat, mu);

end

