function [ minIndex, minVal ] = FindMinCharge( A, n, eMonth )
%FINDMAXCHARGE Summary of this function goes here
%   Detailed explanation goes here
minIndex=zeros(1,n);
for i=1:n
    minIndex(i)=25;
end

minVal=zeros(1,n);
for i=1:n
    minVal(i)=99999999999;
end

for i=1:n
    for j=1:24
        if A(i,j)<minVal(i)
            minVal(i)=A(i,j);
            minIndex(i)=j;
        elseif A(i,j)== minVal(i)
             if eMonth(i,j)<eMonth(i, minIndex(i))
                minVal(i)=A(i,j);
                minIndex(i)=j;
             end
        end
    end
end

for i=1:n
    if minVal(i)<0
        minVal(i)=0;
    end
end

end

