function [ wMonth ] = WpToW( wpMonth, weperiods, n )

wMonth=wpMonth;
for i=1:n
    for j=1:24
        if ~isnan(wpMonth(i,j))
            getIndex=weperiods(i,wpMonth(i,j)+1);
            if ~isnan(getIndex)
                wMonth(i,j)=getIndex;
            else
                wMonth(i,j)=0;
            end
        else
            wMonth(i,j)=0;
        end
    end
end

end

