function [ dMonth ] = DpToD( dpMonth, dperiods, n )

dMonth=dpMonth;
for i=1:n
    for j=1:24
        if ~isnan(dpMonth(i,j))
            getIndex=dperiods(i,dpMonth(i,j)+1);
            if ~isnan(getIndex)
                dMonth(i,j)=getIndex;
            else
                dMonth(i,j)=0;
            end
        else
            dMonth(i,j)=0;
        end
    end
end

end

