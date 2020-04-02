function [ maxIndex, maxVal ] = FindMaxCharge( A, n, eMonth )
%FINDMAXCHARGE Summary of this function goes here
%   Detailed explanation goes here

maxIndex=zeros(1,n);
maxVal=zeros(1,n);

for i=1:n
    maxIndex(i)=-1;
    maxVal(i)=-1;
end

for i=1:n
    for j=1:24
        if A(i,j)>maxVal(i)
            maxVal(i)=A(i,j);
            maxIndex(i)=j;
        elseif A(i,j)==maxVal(i)
            if eMonth(i,j)>eMonth(i, maxIndex(i))
                maxVal(i)=A(i,j);
                maxIndex(i)=j;
            end
        end
    end
end

end

