function [ h ] = estimatebw( X )
%ESTIMATEBW Estimates bandwidth for kernel smoothing
%   X - whitened data matrix 
%   h - bandwidth estimates
%
% Depends on KDE toolbox by Alexander Ihler 
% (http://www.ics.uci.edu/~ihler/code/kde.html)

coder.extrinsic('ksdensity'); 

h=zeros(size(X,2),1);

for i=1:size(X,2)
%    p = kde( X(:,i)', 'LCV',[],'Epanechnikov'); 
%    p = kde( X(:,i)', 'HALL',[],'Epanechnikov'); 
%    p = kde( X(:,i)', 'MSP',[],'Epanechnikov'); 
%    p = kde( X(:,i)', 'HSJM',[],'Epanechnikov'); 

%    p = kde( X(:,i)', 'ROT',[],'Epanechnikov'); 
%    h(i,1) = getBW(p,1);
    
   [f,xi,bw]=ksdensity(X(:,i),'kernel','epanechnikov');
   h(i)=2*bw;
end

