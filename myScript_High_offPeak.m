% INPUT DATA (matrix dJan, dFeb, dMar,..) 
% INPUT DATA (matrix eJan, eFeb, eMar,...)
% INPUT DATA (matrix 
% n=7506; % #utility rates
% w=50; %kW of usage per plug per charge 
taxis=1:1:24;

% tpatternkwh=[40 40 40 40 40 40 40 40 40 40 40 0 0 0 0 0 0 0 0 0 40 40 40 40]; %charging energy profile
stpatternkwh=sum(tpatternkwh,2);


%energy rates based on period
eJan=EpToE(epJan,eperiods,n);
eFeb=EpToE(epFeb,eperiods,n);
eMar=EpToE(epMar,eperiods,n);
eApr=EpToE(epApr,eperiods,n);
eMay=EpToE(epMay,eperiods,n);
eJun=EpToE(epJun,eperiods,n);
eJul=EpToE(epJul,eperiods,n);
eAug=EpToE(epAug,eperiods,n);
eSep=EpToE(epSep,eperiods,n);
eOct=EpToE(epOct,eperiods,n);
eNov=EpToE(epNov,eperiods,n);
eDec=EpToE(epDec,eperiods,n);

%weekend energy rates based on period 
wJan=WpToW(weJan,weperiods,n);
wFeb=WpToW(weFeb,weperiods,n);
wMar=WpToW(weMar,weperiods,n);
wApr=WpToW(weApr,weperiods,n);
wMay=WpToW(weMay,weperiods,n);
wJun=WpToW(weJun,weperiods,n);
wJul=WpToW(weJul,weperiods,n);
wAug=WpToW(weAug,weperiods,n);
wSep=WpToW(weSep,weperiods,n);
wOct=WpToW(weOct,weperiods,n);
wNov=WpToW(weNov,weperiods,n);
wDec=WpToW(weDec,weperiods,n);

%fixed demand rates
fJan=FpToF(fdJan,fperiods,n);
fFeb=FpToF(fdFeb,fperiods,n);
fMar=FpToF(fdMar,fperiods,n);
fApr=FpToF(fdApr,fperiods,n);
fMay=FpToF(fdMay,fperiods,n);
fJun=FpToF(fdJun,fperiods,n);
fJul=FpToF(fdJul,fperiods,n);
fAug=FpToF(fdAug,fperiods,n);
fSep=FpToF(fdSep,fperiods,n);
fOct=FpToF(fdOct,fperiods,n);
fNov=FpToF(fdNov,fperiods,n);
fDec=FpToF(fdDec,fperiods,n);

ffJan=repmat(fJan,1,24);
ffFeb=repmat(fFeb,1,24);
ffMar=repmat(fMar,1,24);
ffApr=repmat(fApr,1,24);
ffMay=repmat(fMay,1,24);
ffJun=repmat(fJun,1,24);
ffJul=repmat(fJul,1,24);
ffAug=repmat(fAug,1,24);
ffSep=repmat(fSep,1,24);
ffOct=repmat(fOct,1,24);
ffNov=repmat(fNov,1,24);
ffDec=repmat(fDec,1,24);


%demand TOU rates (where applicable)
dJan=DpToD(dpJan,dperiods,n);
dFeb=DpToD(dpFeb,dperiods,n);
dMar=DpToD(dpMar,dperiods,n);
dApr=DpToD(dpApr,dperiods,n);
dMay=DpToD(dpMay,dperiods,n);
dJun=DpToD(dpJun,dperiods,n);
dJul=DpToD(dpJul,dperiods,n);
dAug=DpToD(dpAug,dperiods,n);
dSep=DpToD(dpSep,dperiods,n);
dOct=DpToD(dpOct,dperiods,n);
dNov=DpToD(dpNov,dperiods,n);
dDec=DpToD(dpDec,dperiods,n);



%%%Find min among the hours and charge then 
%Demand charge (only applicable to TOU demand charging)
[minHourJan, minChargeJan]=FindMinCharge(dJan, n, eJan);
[minHourFeb, minChargeFeb]=FindMinCharge(dFeb, n, eFeb);
[minHourMar, minChargeMar]=FindMinCharge(dMar, n, eMar);
[minHourApr, minChargeApr]=FindMinCharge(dApr, n, eApr);
[minHourMay, minChargeMay]=FindMinCharge(dMay, n, eMay);
[minHourJun, minChargeJun]=FindMinCharge(dJun, n, eJun);
[minHourJul, minChargeJul]=FindMinCharge(dJul, n, eJul);
[minHourAug, minChargeAug]=FindMinCharge(dAug, n, eAug);
[minHourSep, minChargeSep]=FindMinCharge(dSep, n, eSep);
[minHourOct, minChargeOct]=FindMinCharge(dOct, n, eOct);
[minHourNov, minChargeNov]=FindMinCharge(dNov, n, eNov);
[minHourDec, minChargeDec]=FindMinCharge(dDec, n, eDec);
% 
% %Energy charge weekday
% [maxEHourJan, maxEChargeJan]=FindMaxCharge1(eJan, n);
% [maxEHourFeb, maxEChargeFeb]=FindMaxCharge1(eFeb, n);
% [maxEHourMar, maxEChargeMar]=FindMaxCharge1(eMar, n);
% [maxEHourApr, maxEChargeApr]=FindMaxCharge1(eApr, n);
% [maxEHourMay, maxEChargeMay]=FindMaxCharge1(eMay, n);
% [maxEHourJun, maxEChargeJun]=FindMaxCharge1(eJun, n);
% [maxEHourJul, maxEChargeJul]=FindMaxCharge1(eJul, n);
% [maxEHourAug, maxEChargeAug]=FindMaxCharge1(eAug, n);
% [maxEHourSep, maxEChargeSep]=FindMaxCharge1(eSep, n);
% [maxEHourOct, maxEChargeOct]=FindMaxCharge1(eOct, n);
% [maxEHourNov, maxEChargeNov]=FindMaxCharge1(eNov, n);
% [maxEHourDec, maxEChargeDec]=FindMaxCharge1(eDec, n);
% %Energy charge weekend
% [maxWHourJan, maxWChargeJan]=FindMaxCharge1(wJan, n);
% [maxWHourFeb, maxWChargeFeb]=FindMaxCharge1(wFeb, n);
% [maxWHourMar, maxWChargeMar]=FindMaxCharge1(wMar, n);
% [maxWHourApr, maxWChargeApr]=FindMaxCharge1(wApr, n);
% [maxWHourMay, maxWChargeMay]=FindMaxCharge1(wMay, n);
% [maxWHourJun, maxWChargeJun]=FindMaxCharge1(wJun, n);
% [maxWHourJul, maxWChargeJul]=FindMaxCharge1(wJul, n);
% [maxWHourAug, maxWChargeAug]=FindMaxCharge1(wAug, n);
% [maxWHourSep, maxWChargeSep]=FindMaxCharge1(wSep, n);
% [maxWHourOct, maxWChargeOct]=FindMaxCharge1(wOct, n);
% [maxWHourNov, maxWChargeNov]=FindMaxCharge1(wNov, n);
% [maxWHourDec, maxWChargeDec]=FindMaxCharge1(wDec, n);

%prepare matrices for annual cost calculations
resultJan=zeros(1,n);
resultFeb=zeros(1,n);
resultMar=zeros(1,n);
resultApr=zeros(1,n);
resultMay=zeros(1,n);
resultJun=zeros(1,n);
resultJul=zeros(1,n);
resultAug=zeros(1,n);
resultSep=zeros(1,n);
resultOct=zeros(1,n);
resultNov=zeros(1,n);
resultDec=zeros(1,n);

ceJan=zeros(n,24);
ceFeb=zeros(n,24);
ceMar=zeros(n,24);
ceApr=zeros(n,24);
ceMay=zeros(n,24);
ceJun=zeros(n,24);
ceJul=zeros(n,24);
ceAug=zeros(n,24);
ceSep=zeros(n,24);
ceOct=zeros(n,24);
ceNov=zeros(n,24);
ceDec=zeros(n,24);

cewJan=zeros(n,24);
cewFeb=zeros(n,24);
cewMar=zeros(n,24);
cewApr=zeros(n,24);
cewMay=zeros(n,24);
cewJun=zeros(n,24);
cewJul=zeros(n,24);
cewAug=zeros(n,24);
cewSep=zeros(n,24);
cewOct=zeros(n,24);
cewNov=zeros(n,24);
cewDec=zeros(n,24);

totcostJan=zeros(1,n);
totcostFeb=zeros(1,n);
totcostMar=zeros(1,n);
totcostApr=zeros(1,n);
totcostMay=zeros(1,n);
totcostJun=zeros(1,n);
totcostJul=zeros(1,n);
totcostAug=zeros(1,n);
totcostSep=zeros(1,n);
totcostOct=zeros(1,n);
totcostNov=zeros(1,n);
totcostDec=zeros(1,n);


YC=zeros(1,n);
DC=zeros(1,n);
EC=zeros(1,n);
MF=zeros(1,n);

%Demand Cost 

% A=[dJan; dFeb; dMar; dApr; dMay; ...];
for taxis=1:1:24
    for i=1:n
        if demandType(i)==3 %TOU demand
        %Demand Costs (maximum matrix result)
        resultJan(i)=minChargeJan(i)*w;
        resultFeb(i)=minChargeFeb(i)*w;
        resultMar(i)=minChargeMar(i)*w;
        resultApr(i)=minChargeApr(i)*w;
        resultMay(i)=minChargeMay(i)*w;
        resultJun(i)=minChargeJun(i)*w;
        resultJul(i)=minChargeJul(i)*w;
        resultAug(i)=minChargeAug(i)*w;
        resultSep(i)=minChargeSep(i)*w;
        resultOct(i)=minChargeOct(i)*w;
        resultNov(i)=minChargeNov(i)*w;
        resultDec(i)=minChargeDec(i)*w;
         
%%% Energy Costs (that correspond to minimum demand charge time of day)
%Weekday calculation
    
        ceJan(i,taxis)=eJan(i,taxis)*tpatternkwh(taxis);
        ceFeb(i,taxis)=eFeb(i,taxis)*tpatternkwh(taxis);
        ceMar(i,taxis)=eMar(i,taxis)*tpatternkwh(taxis);
        ceApr(i,taxis)=eApr(i,taxis)*tpatternkwh(taxis);
        ceMay(i,taxis)=eMay(i,taxis)*tpatternkwh(taxis);
        ceJun(i,taxis)=eJun(i,taxis)*tpatternkwh(taxis);
        ceJul(i,taxis)=eJul(i,taxis)*tpatternkwh(taxis);
        ceAug(i,taxis)=eAug(i,taxis)*tpatternkwh(taxis);
        ceSep(i,taxis)=eSep(i,taxis)*tpatternkwh(taxis);
        ceOct(i,taxis)=eOct(i,taxis)*tpatternkwh(taxis);
        ceNov(i,taxis)=eNov(i,taxis)*tpatternkwh(taxis);
        ceDec(i,taxis)=eDec(i,taxis)*tpatternkwh(taxis);
        
%weekend calculation      
        cewJan(i,taxis)=wJan(i,taxis)*tpatternkwh(taxis);
        cewFeb(i,taxis)=wFeb(i,taxis)*tpatternkwh(taxis);
        cewMar(i,taxis)=wMar(i,taxis)*tpatternkwh(taxis);
        cewApr(i,taxis)=wApr(i,taxis)*tpatternkwh(taxis);
        cewMay(i,taxis)=wMay(i,taxis)*tpatternkwh(taxis);
        cewJun(i,taxis)=wJun(i,taxis)*tpatternkwh(taxis);
        cewJul(i,taxis)=wJul(i,taxis)*tpatternkwh(taxis);
        cewAug(i,taxis)=wAug(i,taxis)*tpatternkwh(taxis);
        cewSep(i,taxis)=wSep(i,taxis)*tpatternkwh(taxis);
        cewOct(i,taxis)=wOct(i,taxis)*tpatternkwh(taxis);
        cewNov(i,taxis)=wNov(i,taxis)*tpatternkwh(taxis);
        cewDec(i,taxis)=wDec(i,taxis)*tpatternkwh(taxis);
           
        
    elseif demandType(i)==2 %flat demand case
        %Demand Cost Flat (pull number from a different matrix) 
        resultJan(i)=fJan(i)*w;
        resultFeb(i)=fFeb(i)*w;
        resultMar(i)=fMar(i)*w;
        resultApr(i)=fApr(i)*w;
        resultMay(i)=fMay(i)*w;
        resultJun(i)=fJun(i)*w;
        resultJul(i)=fJul(i)*w;
        resultAug(i)=fAug(i)*w;
        resultSep(i)=fSep(i)*w;
        resultOct(i)=fOct(i)*w;
        resultNov(i)=fNov(i)*w;
        resultDec(i)=fDec(i)*w;
        
        %Energy cost at maximum for electricity TOU
        %Weekday calculation
%Weekday calculation
        ceJan(i,taxis)=eJan(i,taxis)*tpatternkwh(taxis);
        ceFeb(i,taxis)=eFeb(i,taxis)*tpatternkwh(taxis);
        ceMar(i,taxis)=eMar(i,taxis)*tpatternkwh(taxis);
        ceApr(i,taxis)=eApr(i,taxis)*tpatternkwh(taxis);
        ceMay(i,taxis)=eMay(i,taxis)*tpatternkwh(taxis);
        ceJun(i,taxis)=eJun(i,taxis)*tpatternkwh(taxis);
        ceJul(i,taxis)=eJul(i,taxis)*tpatternkwh(taxis);
        ceAug(i,taxis)=eAug(i,taxis)*tpatternkwh(taxis);
        ceSep(i,taxis)=eSep(i,taxis)*tpatternkwh(taxis);
        ceOct(i,taxis)=eOct(i,taxis)*tpatternkwh(taxis);
        ceNov(i,taxis)=eNov(i,taxis)*tpatternkwh(taxis);
        ceDec(i,taxis)=eDec(i,taxis)*tpatternkwh(taxis);
        
%weekend calculation      
        cewJan(i,taxis)=wJan(i,taxis)*tpatternkwh(taxis);
        cewFeb(i,taxis)=wFeb(i,taxis)*tpatternkwh(taxis);
        cewMar(i,taxis)=wMar(i,taxis)*tpatternkwh(taxis);
        cewApr(i,taxis)=wApr(i,taxis)*tpatternkwh(taxis);
        cewMay(i,taxis)=wMay(i,taxis)*tpatternkwh(taxis);
        cewJun(i,taxis)=wJun(i,taxis)*tpatternkwh(taxis);
        cewJul(i,taxis)=wJul(i,taxis)*tpatternkwh(taxis);
        cewAug(i,taxis)=wAug(i,taxis)*tpatternkwh(taxis);
        cewSep(i,taxis)=wSep(i,taxis)*tpatternkwh(taxis);
        cewOct(i,taxis)=wOct(i,taxis)*tpatternkwh(taxis);
        cewNov(i,taxis)=wNov(i,taxis)*tpatternkwh(taxis);
        cewDec(i,taxis)=wDec(i,taxis)*tpatternkwh(taxis);

        
    else %no demand case
        %No Demand Cost
        resultJan(i)=0;
        resultFeb(i)=0;
        resultMar(i)=0;
        resultApr(i)=0;
        resultMay(i)=0;
        resultJun(i)=0;
        resultJul(i)=0;
        resultAug(i)=0;
        resultSep(i)=0;
        resultOct(i)=0;
        resultNov(i)=0;
        resultDec(i)=0;
        
        %Energy cost same calculation as in the flat demand case
%Weekday calculation
        ceJan(i,taxis)=eJan(i,taxis)*tpatternkwh(taxis);
        ceFeb(i,taxis)=eFeb(i,taxis)*tpatternkwh(taxis);
        ceMar(i,taxis)=eMar(i,taxis)*tpatternkwh(taxis);
        ceApr(i,taxis)=eApr(i,taxis)*tpatternkwh(taxis);
        ceMay(i,taxis)=eMay(i,taxis)*tpatternkwh(taxis);
        ceJun(i,taxis)=eJun(i,taxis)*tpatternkwh(taxis);
        ceJul(i,taxis)=eJul(i,taxis)*tpatternkwh(taxis);
        ceAug(i,taxis)=eAug(i,taxis)*tpatternkwh(taxis);
        ceSep(i,taxis)=eSep(i,taxis)*tpatternkwh(taxis);
        ceOct(i,taxis)=eOct(i,taxis)*tpatternkwh(taxis);
        ceNov(i,taxis)=eNov(i,taxis)*tpatternkwh(taxis);
        ceDec(i,taxis)=eDec(i,taxis)*tpatternkwh(taxis);
        
%weekend calculation      
        cewJan(i,taxis)=wJan(i,taxis)*tpatternkwh(taxis);
        cewFeb(i,taxis)=wFeb(i,taxis)*tpatternkwh(taxis);
        cewMar(i,taxis)=wMar(i,taxis)*tpatternkwh(taxis);
        cewApr(i,taxis)=wApr(i,taxis)*tpatternkwh(taxis);
        cewMay(i,taxis)=wMay(i,taxis)*tpatternkwh(taxis);
        cewJun(i,taxis)=wJun(i,taxis)*tpatternkwh(taxis);
        cewJul(i,taxis)=wJul(i,taxis)*tpatternkwh(taxis);
        cewAug(i,taxis)=wAug(i,taxis)*tpatternkwh(taxis);
        cewSep(i,taxis)=wSep(i,taxis)*tpatternkwh(taxis);
        cewOct(i,taxis)=wOct(i,taxis)*tpatternkwh(taxis);
        cewNov(i,taxis)=wNov(i,taxis)*tpatternkwh(taxis);
        cewDec(i,taxis)=wDec(i,taxis)*tpatternkwh(taxis);

        end
    end
end

  %redifine the format of the matrices to go into the total monthly
        %costs calculation
%Weekday calculation
        ceJanr=sum(ceJan,2);
        ceFebr=sum(ceFeb,2);
        ceMarr=sum(ceMar,2);
        ceAprr=sum(ceApr,2);
        ceMayr=sum(ceMay,2);
        ceJunr=sum(ceJun,2);
        ceJulr=sum(ceJul,2);
        ceAugr=sum(ceAug,2);
        ceSepr=sum(ceSep,2);
        ceOctr=sum(ceOct,2);
        ceNovr=sum(ceNov,2);
        ceDecr=sum(ceDec,2);
        
%weekend calculation      
        cewJanr=sum(cewJan,2);
        cewFebr=sum(cewFeb,2);
        cewMarr=sum(cewMar,2);
        cewAprr=sum(cewApr,2);
        cewMayr=sum(cewMay,2);
        cewJunr=sum(cewJun,2);
        cewJulr=sum(cewJul,2);
        cewAugr=sum(cewAug,2);
        cewSepr=sum(cewSep,2);
        cewOctr=sum(cewOct,2);
        cewNovr=sum(cewNov,2);
        cewDecr=sum(cewDec,2);

        %transpose all matrices to be include in the total montly cost calculation
  %Weekday calculation
        ceJanr=transpose(ceJanr);
        ceFebr=transpose(ceFebr);
        ceMarr=transpose(ceMarr);
        ceAprr=transpose(ceAprr);
        ceMayr=transpose(ceMayr);
        ceJunr=transpose(ceJunr);
        ceJulr=transpose(ceJulr);
        ceAugr=transpose(ceAugr);
        ceSepr=transpose(ceSepr);
        ceOctr=transpose(ceOctr);
        ceNovr=transpose(ceNovr);
        ceDecr=transpose(ceDecr);
        
%weekend calculation      
        cewJanr=transpose(cewJanr);
        cewFebr=transpose(cewFebr);
        cewMarr=transpose(cewMarr);
        cewAprr=transpose(cewAprr);
        cewMayr=transpose(cewMayr);
        cewJunr=transpose(cewJunr);
        cewJulr=transpose(cewJulr);
        cewAugr=transpose(cewAugr);
        cewSepr=transpose(cewSepr);
        cewOctr=transpose(cewOctr);
        cewNovr=transpose(cewNovr);
        cewDecr=transpose(cewDecr);
        
        
% Total Monthly Costs
for i=1:n
    totcostJan(i)=resultJan(i)+ceJanr(i)*(31-8)+cewJanr(i)*8+monthF(i);
    totcostFeb(i)=resultFeb(i)+ceFebr(i)*(28-8)+cewFebr(i)*8+monthF(i);
    totcostMar(i)=resultMar(i)+ceMarr(i)*(31-8)+cewMarr(i)*8+monthF(i);
    totcostApr(i)=resultApr(i)+ceAprr(i)*(30-8)+cewAprr(i)*8+monthF(i);
    totcostMay(i)=resultMay(i)+ceMayr(i)*(31-8)+cewMayr(i)*8+monthF(i);
    totcostJun(i)=resultJun(i)+ceJunr(i)*(30-8)+cewJunr(i)*8+monthF(i);
    totcostJul(i)=resultJul(i)+ceJulr(i)*(31-8)+cewJulr(i)*8+monthF(i);
    totcostAug(i)=resultAug(i)+ceAugr(i)*(31-8)+cewAugr(i)*8+monthF(i);
    totcostSep(i)=resultSep(i)+ceSepr(i)*(30-8)+cewSepr(i)*8+monthF(i);
    totcostOct(i)=resultOct(i)+ceOctr(i)*(31-8)+cewOctr(i)*8+monthF(i);
    totcostNov(i)=resultNov(i)+ceNovr(i)*(30-8)+cewNovr(i)*8+monthF(i);
    totcostDec(i)=resultDec(i)+ceDecr(i)*(31-8)+cewDecr(i)*8+monthF(i);
end

%Total Costs (time metric accordingly defined)
for i=1:n
    YC(i)=(totcostJan(i)+totcostFeb(i)+totcostMar(i)+totcostApr(i)+totcostMay(i)+totcostJun(i)+ totcostJul(i)+totcostAug(i)+totcostSep(i)+totcostOct(i)+totcostNov(i)+totcostDec(i))/(365*stpatternkwh);
    DC(i)=(resultJan(i)+resultFeb(i)+resultMar(i)+resultApr(i)+resultMay(i)+resultJun(i)+resultJul(i)+resultAug(i)+resultSep(i)+resultOct(i)+resultNov(i)+resultDec(i))/(365*stpatternkwh);
    EC(i)=(ceJanr(i)*(31-8)+cewJanr(i)*8+ceFebr(i)*(28-8)+cewFebr(i)*8+ceMarr(i)*(31-8)+cewMarr(i)*8+ceAprr(i)*(30-8)+cewAprr(i)*8+ceMayr(i)*(31-8)+cewMayr(i)*8+ceJunr(i)*(30-8)+cewJunr(i)*8+ceJulr(i)*(31-8)+cewJulr(i)*8+ceAugr(i)*(31-8)+cewAugr(i)*8+ceSepr(i)*(30-8)+cewSepr(i)*8+ceOctr(i)*(31-8)+cewOctr(i)*8+ceNovr(i)*(30-8)+cewNovr(i)*8+ceDecr(i)*(31-8)+cewDecr(i)*8)/(356*stpatternkwh);
    MF(i)=12*monthF(i)/(365*stpatternkwh);
end

YC=transpose(YC);
DC=transpose(DC);
EC=transpose(EC);
MF=transpose(MF);
YC=DC+EC+MF;

YC=YC((YC~=0) & (YC<=20));
DC=DC((YC~=0) & (YC<=20));
EC=EC((YC~=0) & (YC<=20));
MF=MF((YC~=0) & (YC<=20));
demandTypeN=demandType((YC~=0) & (YC<=20));

%histogram for on peak charges
TC3o=DC+EC+MF;

%minimum rates based on gisID
gisIDN=gisID((YC~=0) & (YC<=20));

% idxtry = accumarray(gisIDN, TC3o, [], @minarg);
% 
% % fix position in terms of the whole vector
% offset1 = cumsum([0;accumarray(gisIDN,1)]);
% idxtry = idxtry + offset1(1:end-1);
% 
% % corresponding min values
% YC=TC3o(idxtry);
% MF=MF(idxtry);
% DC=DC(idxtry);
% EC=EC(idxtry);
% demandTypeN=demandTypeN(idxtry);
TC3on=DC+EC+MF;
%%%%%%%%%%%%%%%%  USEFUL BOXPLOT
% figure
% boxplot( YC ,demandTypeN,'Labels',{'No Demand','Flat Demand','TOU Demand'},'Symbol','o')
% ylabel('[$/kWh]')
% title('Avg Cost - High Utilization Small Station (1-plug), off-peak')
% ylim([-0.01 0.8])
% figure
% boxplot( DC ,demandTypeN,'Labels',{'No Demand','Flat Demand','TOU Demand'},'Symbol','o')
% ylabel('[$/kWh]')
% title('Avg Demand Cost - High Utilization Small Station (1-plug), off-peak')
% ylim([-0.01 0.3])
% figure
% boxplot( EC ,demandTypeN,'Labels',{'No Demand','Flat Demand','TOU Demand'},'Symbol','o')
% ylabel('[$/kWh]')
% title('Avg Energy Cost - High Utilization Small Station (1-plug), off-peak')
% ylim([-0.01 0.3])

%mean statistics case
meand1=mean(DC(demandTypeN==1));
meand2=mean(DC(demandTypeN==2));
meand3=mean(DC(demandTypeN==3));

meane1=mean(EC(demandTypeN==1));
meane2=mean(EC(demandTypeN==2));
meane3=mean(EC(demandTypeN==3));

meanf1=mean(MF(demandTypeN==1));
meanf2=mean(MF(demandTypeN==2));
meanf3=mean(MF(demandTypeN==3));

meanY1=mean(YC(demandTypeN==1));
meanY2=mean(YC(demandTypeN==2));
meanY3=mean(YC(demandTypeN==3));

%create MEAN vectors as gprstats does 
DMeanHighOffPeak=[meand1;meand2;meand3];
EMeanHighOffPeak=[meane1;meane2;meane3];
YCMeanHighOffPeak=[meanY1;meanY2;meanY3];
FMeanHighOffPeak=[meanf1;meanf2;meanf3];

% Statistics toolbox required script
% DMeanHighOffPeak=grpstats(DC,demandTypeN)
% EMeanHighOffPeak=grpstats(EC,demandTypeN)
% YCMeanHighOffPeak=grpstats(YC,demandTypeN)
% FMeanHighOffPeak=grpstats(MF,demandTypeN)

%scatterplot case
% figure
% gscatter(demandTypeN,YC)
% ylim([-0.01, 5])

%%%%%%%%%%%%%%%%% USEFUL BOXPLOT
% StateID2N=StateID2((YC~=0) & (YC<=20));
% meanDCStateLS1=grpstats(DC(demandTypeN==1),StateID2N(demandTypeN==1));
% meanDCStateLS2=grpstats(DC(demandTypeN==2),StateID2N(demandTypeN==2));
% meanDCStateLS3=grpstats(DC(demandTypeN==3),StateID2N(demandTypeN==3));
% meanECStateLS1=grpstats(EC(demandTypeN==1),StateID2N(demandTypeN==1));
% meanECStateLS2=grpstats(EC(demandTypeN==2),StateID2N(demandTypeN==2));
% meanECStateLS3=grpstats(EC(demandTypeN==3),StateID2N(demandTypeN==3));
% meanMFStateLS1=grpstats(MF(demandTypeN==1),StateID2N(demandTypeN==1));
% meanMFStateLS2=grpstats(MF(demandTypeN==2),StateID2N(demandTypeN==2));
% meanMFStateLS3=grpstats(MF(demandTypeN==3),StateID2N(demandTypeN==3));
% 
% stateLS1=[meanDCStateLS1 meanECStateLS1 meanMFStateLS1];
% stateLS2=[meanDCStateLS2 meanECStateLS2 meanMFStateLS2];
% stateLS3=[meanDCStateLS3 meanECStateLS3 meanMFStateLS3];
% meanStateLS1=grpstats(StateID2N(demandTypeN==1),StateID2N(demandTypeN==1));
% meanStateLS2=grpstats(StateID2N(demandTypeN==2),StateID2N(demandTypeN==2));
% meanStateLS3=grpstats(StateID2N(demandTypeN==3),StateID2N(demandTypeN==3));
% 
% figure1 = figure('Colormap',[0 0 0;0 0.45 0.74;1 0 0],'Color',[1 1 1]);
% subplot(3,1,1)
% HLS=bar(meanStateLS1,fliplr(stateLS1),'stacked');
% ylim([0 0.6])
% xlim([0 52])
% title('Levelized Electricity Cost Estimates [$/kWh] - No Demand Charges - High Utilization Small Station Off Peak')
% ylabel('[$/kWh]')
% set(gca,'Xtick',0:1:52);
% xt_label = get(gca, 'XTick');
% set(gca, 'XTick', xt_label, 'XTickLabel', {'' 'AK' 'AL' 'AR' 'AZ' 'CA' 'CO' 'CT' 'DC' 'DE' 'FL' 'GA' 'HI' 'IA' 'ID' 'IL' 'IN' 'KS' 'KY' 'LA' 'MA' 'MD' 'ME' 'MI' 'MN' 'MO' 'MS' 'MT' 'NC' 'ND' 'NE' 'NH' 'NJ' 'NM' 'NV' 'NY' 'OH' 'OK' 'OR' 'PA' 'RI' 'SC' 'SD' 'TN' 'TX' 'UT' 'VA' 'VT' 'WA' 'WI' 'WV' 'WY' ''})
% legend1=legend([fliplr(HLS)],{'Demand Charges','Energy Charges','Fixed Charges'});
% hold on
% subplot(3,1,2)
% bar(meanStateLS2, fliplr(stateLS2),'stacked')
% ylim([0 3.5])
% xlim([0 52])
% title('Levelized Electricity Cost Estimates [$/kWh]- Flat Demand Charges - High Utilization Small Station Off Peak')
% ylabel('[$/kWh]')
% set(gca,'Xtick',0:1:52);
% xt_label = get(gca, 'XTick');
% set(gca, 'XTick', xt_label, 'XTickLabel', {'' 'AK' 'AL' 'AR' 'AZ' 'CA' 'CO' 'CT' 'DC' 'DE' 'FL' 'GA' 'HI' 'IA' 'ID' 'IL' 'IN' 'KS' 'KY' 'LA' 'MA' 'MD' 'ME' 'MI' 'MN' 'MO' 'MS' 'MT' 'NC' 'ND' 'NE' 'NH' 'NJ' 'NM' 'NV' 'NY' 'OH' 'OK' 'OR' 'PA' 'RI' 'SC' 'SD' 'TN' 'TX' 'UT' 'VA' 'VT' 'WA' 'WI' 'WV' 'WY' ''})
% hold on
% subplot(3,1,3)
% bar(meanStateLS3,fliplr(stateLS3),'stacked')
% ylim([0 1.7])
% xlim([0 52])
% title('Levelized Electricity Cost Estimates [$/kWh]- TOU Demand Charges - High Utilization Small Station Off Peak')
% ylabel('[$/kWh]')
% set(gca,'Xtick',0:1:52);
% xt_label = get(gca, 'XTick');
% set(gca, 'XTick', xt_label, 'XTickLabel', {'' 'AK' 'AL' 'AR' 'AZ' 'CA' 'CO' 'CT' 'DC' 'DE' 'FL' 'GA' 'HI' 'IA' 'ID' 'IL' 'IN' 'KS' 'KY' 'LA' 'MA' 'MD' 'ME' 'MI' 'MN' 'MO' 'MS' 'MT' 'NC' 'ND' 'NE' 'NH' 'NJ' 'NM' 'NV' 'NY' 'OH' 'OK' 'OR' 'PA' 'RI' 'SC' 'SD' 'TN' 'TX' 'UT' 'VA' 'VT' 'WA' 'WI' 'WV' 'WY' ''})
