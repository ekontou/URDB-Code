function [ eMonth ] = EpToEm( epMonth, eperiods, n )

eMonth=epMonth;
for i=1:n
    for j=1:24
        if ~isnan(epMonth(i,j))
            getIndex=eperiods(i,epMonth(i,j)+1);
            if ~isnan(getIndex)
                eMonth(i,j)=getIndex;
            else
                eMonth(i,j)=0;
            end
        else
            eMonth(i,j)=0;
        end
    end
end

end

