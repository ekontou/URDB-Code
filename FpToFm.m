function [ fMonth ] = FpToFm( fpMonth, fperiods, n )

fMonth=fpMonth;
for i=1:n
    if ~isnan(fpMonth(i))
        getIndex=fperiods(i, fpMonth(i)+1);
        if ~isnan(getIndex)        
            fMonth(i)=getIndex;
        else
            fMonth(i)=0;
        end
    else
        fMonth(i)=99999;
    end
    
end

end

