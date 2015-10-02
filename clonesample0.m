function [ Xcloned, protonum ] = clonesample0( X, N )
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

% Choose numbers of objects to clone
protonum = randi(n, [N 1]);

% Cloned data
Xcloned = X(protonum,:);

end

