function [ w ] = epan( n )
%EPAN Generation of w ~ K for Epanechnikov kernel K
%
%  Reference
%     Shakhnarovich G. Statistical Data Cloning for Machine Learning. 
%     MSc thesis. Technion, Haifa, 2001, p. 26, (Algorithm 2).


%if ~exist('n','var')
%    n=1
%end

w=zeros(1,n);

for i=1:n
    while(true)
        w(i) = (rand()-0.5)*2;
        u = rand();
        if u <= 1 - w(i)*w(i);
            break; 
        end 
    end
end

end

