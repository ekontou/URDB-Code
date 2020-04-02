% INPUT DATA (matrix dJan, dFeb, dMar,..) 
% INPUT DATA (matrix eJan, eFeb, eMar,...)
% INPUT DATA (matrix 
% n=7506; % #utility rates
% w=50; %power for one charger 
% t=0.40; % percentage of the hour that corresponds to DCFC charging (24 minutes)

eJan=EpToEm(epJan,eperiods,n);
eFeb=EpToEm(epFeb,eperiods,n);
eMar=EpToEm(epMar,eperiods,n);
eApr=EpToEm(epApr,eperiods,n);
eMay=EpToEm(epMay,eperiods,n);
eJun=EpToEm(epJun,eperiods,n);
eJul=EpToEm(epJul,eperiods,n);
eAug=EpToEm(epAug,eperiods,n);
eSep=EpToEm(epSep,eperiods,n);
eOct=EpToEm(epOct,eperiods,n);
eNov=EpToEm(epNov,eperiods,n);
eDec=EpToEm(epDec,eperiods,n);

wJan=WpToWm(weJan,weperiods,n);
wFeb=WpToWm(weFeb,weperiods,n);
wMar=WpToWm(weMar,weperiods,n);
wApr=WpToWm(weApr,weperiods,n);
wMay=WpToWm(weMay,weperiods,n);
wJun=WpToWm(weJun,weperiods,n);
wJul=WpToWm(weJul,weperiods,n);
wAug=WpToWm(weAug,weperiods,n);
wSep=WpToWm(weSep,weperiods,n);
wOct=WpToWm(weOct,weperiods,n);
wNov=WpToWm(weNov,weperiods,n);
wDec=WpToWm(weDec,weperiods,n);

fJan=FpToFm(fdJan,fperiods,n);
fFeb=FpToFm(fdFeb,fperiods,n);
fMar=FpToFm(fdMar,fperiods,n);
fApr=FpToFm(fdApr,fperiods,n);
fMay=FpToFm(fdMay,fperiods,n);
fJun=FpToFm(fdJun,fperiods,n);
fJul=FpToFm(fdJul,fperiods,n);
fAug=FpToFm(fdAug,fperiods,n);
fSep=FpToFm(fdSep,fperiods,n);
fOct=FpToFm(fdOct,fperiods,n);
fNov=FpToFm(fdNov,fperiods,n);
fDec=FpToFm(fdDec,fperiods,n);

dJan=DpToDm(dpJan,dperiods,n);
dFeb=DpToDm(dpFeb,dperiods,n);
dMar=DpToDm(dpMar,dperiods,n);
dApr=DpToDm(dpApr,dperiods,n);
dMay=DpToDm(dpMay,dperiods,n);
dJun=DpToDm(dpJun,dperiods,n);
dJul=DpToDm(dpJul,dperiods,n);
dAug=DpToDm(dpAug,dperiods,n);
dSep=DpToDm(dpSep,dperiods,n);
dOct=DpToDm(dpOct,dperiods,n);
dNov=DpToDm(dpNov,dperiods,n);
dDec=DpToDm(dpDec,dperiods,n);



%%%Find Max among the hours and charge then 
%Demand charge
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
%Energy charge weekday
[minEHourJan, minEChargeJan]=FindMinCharge1(eJan, n);
[minEHourFeb, minEChargeFeb]=FindMinCharge1(eFeb, n);
[minEHourMar, minEChargeMar]=FindMinCharge1(eMar, n);
[minEHourApr, minEChargeApr]=FindMinCharge1(eApr, n);
[minEHourMay, minEChargeMay]=FindMinCharge1(eMay, n);
[minEHourJun, minEChargeJun]=FindMinCharge1(eJun, n);
[minEHourJul, minEChargeJul]=FindMinCharge1(eJul, n);
[minEHourAug, minEChargeAug]=FindMinCharge1(eAug, n);
[minEHourSep, minEChargeSep]=FindMinCharge1(eSep, n);
[minEHourOct, minEChargeOct]=FindMinCharge1(eOct, n);
[minEHourNov, minEChargeNov]=FindMinCharge1(eNov, n);
[minEHourDec, minEChargeDec]=FindMinCharge1(eDec, n);
%Energy charge weekend
[minWHourJan, minWChargeJan]=FindMinCharge1(wJan, n);
[minWHourFeb, minWChargeFeb]=FindMinCharge1(wFeb, n);
[minWHourMar, minWChargeMar]=FindMinCharge1(wMar, n);
[minWHourApr, minWChargeApr]=FindMinCharge1(wApr, n);
[minWHourMay, minWChargeMay]=FindMinCharge1(wMay, n);
[minWHourJun, minWChargeJun]=FindMinCharge1(wJun, n);
[minWHourJul, minWChargeJul]=FindMinCharge1(wJul, n);
[minWHourAug, minWChargeAug]=FindMinCharge1(wAug, n);
[minWHourSep, minWChargeSep]=FindMinCharge1(wSep, n);
[minWHourOct, minWChargeOct]=FindMinCharge1(wOct, n);
[minWHourNov, minWChargeNov]=FindMinCharge1(wNov, n);
[minWHourDec, minWChargeDec]=FindMinCharge1(wDec, n);

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

ceJan=zeros(1,n);
ceFeb=zeros(1,n);
ceMar=zeros(1,n);
ceApr=zeros(1,n);
ceMay=zeros(1,n);
ceJun=zeros(1,n);
ceJul=zeros(1,n);
ceAug=zeros(1,n);
ceSep=zeros(1,n);
ceOct=zeros(1,n);
ceNov=zeros(1,n);
ceDec=zeros(1,n);

cewJan=zeros(1,n);
cewFeb=zeros(1,n);
cewMar=zeros(1,n);
cewApr=zeros(1,n);
cewMay=zeros(1,n);
cewJun=zeros(1,n);
cewJul=zeros(1,n);
cewAug=zeros(1,n);
cewSep=zeros(1,n);
cewOct=zeros(1,n);
cewNov=zeros(1,n);
cewDec=zeros(1,n);

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
         
%Energy Costs (electricity cost that corresponds to maximum demand
%charge time of day)
        ceJan(i)=eJan(i, minHourJan(i))*t*w;
        ceFeb(i)=eFeb(i, minHourFeb(i))*t*w;
        ceMar(i)=eMar(i, minHourMar(i))*t*w;
        ceApr(i)=eApr(i, minHourApr(i))*t*w;
        ceMay(i)=eMay(i, minHourMay(i))*t*w;
        ceJun(i)=eJun(i, minHourJun(i))*t*w;
        ceJul(i)=eJul(i, minHourJul(i))*t*w;
        ceAug(i)=eAug(i, minHourAug(i))*t*w;
        ceSep(i)=eSep(i, minHourSep(i))*t*w;
        ceOct(i)=eOct(i, minHourOct(i))*t*w;
        ceNov(i)=eNov(i, minHourNov(i))*t*w;
        ceDec(i)=eDec(i, minHourDec(i))*t*w;
        
        cewJan(i)=wJan(i, minHourJan(i))*t*w;
        cewFeb(i)=wFeb(i, minHourFeb(i))*t*w;
        cewMar(i)=wMar(i, minHourMar(i))*t*w;
        cewApr(i)=wApr(i, minHourApr(i))*t*w;
        cewMay(i)=wMay(i, minHourMay(i))*t*w;
        cewJun(i)=wJun(i, minHourJun(i))*t*w;
        cewJul(i)=wJul(i, minHourJul(i))*t*w;
        cewAug(i)=wAug(i, minHourAug(i))*t*w;
        cewSep(i)=wSep(i, minHourSep(i))*t*w;
        cewOct(i)=wOct(i, minHourOct(i))*t*w;
        cewNov(i)=wNov(i, minHourNov(i))*t*w;
        cewDec(i)=wDec(i, minHourDec(i))*t*w;
           
        
    elseif demandType(i)==2 %flat demand case
        %Demand Cost flat (pull number from a different matrix) 
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
        
        %Electricity cost at maximum for electricity TOU
        ceJan(i)=minEChargeJan(i)*t*w;
        ceFeb(i)=minEChargeFeb(i)*t*w;
        ceMar(i)=minEChargeMar(i)*t*w;
        ceApr(i)=minEChargeApr(i)*t*w;
        ceMay(i)=minEChargeMay(i)*t*w;
        ceJun(i)=minEChargeJun(i)*t*w;
        ceJul(i)=minEChargeJul(i)*t*w;
        ceAug(i)=minEChargeAug(i)*t*w;
        ceSep(i)=minEChargeSep(i)*t*w;
        ceOct(i)=minEChargeOct(i)*t*w;
        ceNov(i)=minEChargeNov(i)*t*w;
        ceDec(i)=minEChargeDec(i)*t*w;
        
        cewJan(i)=minWChargeJan(i)*t*w;
        cewFeb(i)=minWChargeFeb(i)*t*w;
        cewMar(i)=minWChargeMar(i)*t*w;
        cewApr(i)=minWChargeApr(i)*t*w;
        cewMay(i)=minWChargeMay(i)*t*w;
        cewJun(i)=minWChargeJun(i)*t*w;
        cewJul(i)=minWChargeJul(i)*t*w;
        cewAug(i)=minWChargeAug(i)*t*w;
        cewSep(i)=minWChargeSep(i)*t*w;
        cewOct(i)=minWChargeOct(i)*t*w;
        cewNov(i)=minWChargeNov(i)*t*w;
        cewDec(i)=minWChargeDec(i)*t*w;
        
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
        ceJan(i)=minEChargeJan(i)*t*w; 
        ceFeb(i)=minEChargeFeb(i)*t*w;
        ceMar(i)=minEChargeMar(i)*t*w;
        ceApr(i)=minEChargeApr(i)*t*w;
        ceMay(i)=minEChargeMay(i)*t*w;
        ceJun(i)=minEChargeJun(i)*t*w;
        ceJul(i)=minEChargeJul(i)*t*w;
        ceAug(i)=minEChargeAug(i)*t*w;
        ceSep(i)=minEChargeSep(i)*t*w;
        ceOct(i)=minEChargeOct(i)*t*w;
        ceNov(i)=minEChargeNov(i)*t*w;
        ceDec(i)=minEChargeDec(i)*t*w;
        
        cewJan(i)=minWChargeJan(i)*t*w;
        cewFeb(i)=minWChargeFeb(i)*t*w;
        cewMar(i)=minWChargeMar(i)*t*w;
        cewApr(i)=minWChargeApr(i)*t*w;
        cewMay(i)=minWChargeMay(i)*t*w;
        cewJun(i)=minWChargeJun(i)*t*w;
        cewJul(i)=minWChargeJul(i)*t*w;
        cewAug(i)=minWChargeAug(i)*t*w;
        cewSep(i)=minWChargeSep(i)*t*w;
        cewOct(i)=minWChargeOct(i)*t*w;
        cewNov(i)=minWChargeNov(i)*t*w;
        cewDec(i)=minWChargeDec(i)*t*w;
    end
end

% Total Monthly Costs
for i=1:n
    totcostJan(i)=resultJan(i)+ceJan(i)*(31-8)+cewJan(i)*8+monthF(i);
    totcostFeb(i)=resultFeb(i)+ceFeb(i)*(28-8)+cewFeb(i)*8+monthF(i);
    totcostMar(i)=resultMar(i)+ceMar(i)*(31-8)+cewMar(i)*8+monthF(i);
    totcostApr(i)=resultApr(i)+ceApr(i)*(30-8)+cewApr(i)*8+monthF(i);
    totcostMay(i)=resultMay(i)+ceMay(i)*(31-8)+cewMay(i)*8+monthF(i);
    totcostJun(i)=resultJun(i)+ceJun(i)*(30-8)+cewJun(i)*8+monthF(i);
    totcostJul(i)=resultJul(i)+ceJul(i)*(31-8)+cewJul(i)*8+monthF(i);
    totcostAug(i)=resultAug(i)+ceAug(i)*(31-8)+cewAug(i)*8+monthF(i);
    totcostSep(i)=resultSep(i)+ceSep(i)*(30-8)+cewSep(i)*8+monthF(i);
    totcostOct(i)=resultOct(i)+ceOct(i)*(31-8)+cewOct(i)*8+monthF(i);
    totcostNov(i)=resultNov(i)+ceNov(i)*(30-8)+cewNov(i)*8+monthF(i);
    totcostDec(i)=resultDec(i)+ceDec(i)*(31-8)+cewDec(i)*8+monthF(i);
end

%Total Costs (time metric accordingly defined)
for i=1:n
    YC(i)=(totcostJan(i)+totcostFeb(i)+totcostMar(i)+totcostApr(i)+totcostMay(i)+totcostJun(i)+ totcostJul(i)+totcostAug(i)+totcostSep(i)+totcostOct(i)+totcostNov(i)+totcostDec(i))/(365*w*t);
    DC(i)=(resultJan(i)+resultFeb(i)+resultMar(i)+resultApr(i)+resultMay(i)+resultJun(i)+resultJul(i)+resultAug(i)+resultSep(i)+resultOct(i)+resultNov(i)+resultDec(i))/(365*w*t);
    EC(i)=(ceJan(i)*(31-8)+cewJan(i)*8+ceFeb(i)*(28-8)+cewFeb(i)*8+ceMar(i)*(31-8)+cewMar(i)*8+ceApr(i)*(30-8)+cewApr(i)*8+ceMay(i)*(31-8)+cewMay(i)*8+ceJun(i)*(30-8)+cewJun(i)*8+ceJul(i)*(31-8)+cewJul(i)*8+ceAug(i)*(31-8)+cewAug(i)*8+ceSep(i)*(30-8)+cewSep(i)*8+ceOct(i)*(31-8)+cewOct(i)*8+ceNov(i)*(30-8)+cewNov(i)*8+ceDec(i)*(31-8)+cewDec(i)*8)/(365*w*t);
    MF(i)=12*monthF(i)/(365*w*t);
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
TC1o=DC+EC+MF;

%select minimum rate per gisID
 gisIDN=gisID((YC~=0) & (YC<=20));
% idxtry = accumarray(gisIDN, TC1o, [], @minarg);
% 
% % fix position in terms of the whole vector
% offset1 = cumsum([0;accumarray(gisIDN,1)]);
% idxtry = idxtry + offset1(1:end-1);
% 
% % corresponding min values
% YC=TC1o(idxtry);
% MF=MF(idxtry);
% DC=DC(idxtry);
% EC=EC(idxtry);
% demandTypeN=demandTypeN(idxtry);
TC1on=DC+EC+MF;

%%%%%%%%%%USEFUL BOXPLOT
% figure
% boxplot( YC ,demandTypeN,'Labels',{'No Demand','Flat Demand','TOU Demand'},'Symbol','o')
% ylabel('[$/kWh]')
% title('Avg Cost - Low Utilization Small Station (1-plug), off-peak')
% ylim([-0.01 3])
% figure
% boxplot( DC ,demandTypeN,'Labels',{'No Demand','Flat Demand','TOU Demand'},'Symbol','o')
% ylabel('[$/kWh]')
% title('Avg Demand Cost - Low Utilization Small Station (1-plug),off-peak')
% ylim([-0.01 2.5])
% figure
% boxplot( EC ,demandTypeN,'Labels',{'No Demand','Flat Demand','TOU Demand'},'Symbol','o')
% ylabel('[$/kWh]')
% title('Avg Energy Cost in $/kWh - Low Utilization Small Station (1-plug), off-peak')
% ylim([-0.01 0.3])


%mean statistics case
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
DMeanLowOffPeak=[meand1;meand2;meand3];
EMeanLowOffPeak=[meane1;meane2;meane3];
YCMeanLowOffPeak=[meanY1;meanY2;meanY3];
FMeanLowOffPeak=[meanf1;meanf2;meanf3];


% DMeanLowOffPeak=grpstats(DC,demandTypeN)
% EMeanLowOffPeak=grpstats(EC,demandTypeN)
% YCMeanLowOffPeak=grpstats(YC,demandTypeN)
% FMeanLowOffPeak=grpstats(MF,demandTypeN)

%scatterplot case
% figure
% gscatter(demandTypeN,YC)
%ylim([-0.01, 5])





%%%%%%%%%%USEFUL BOXPLOT
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
% title('Levelized Electricity Cost Estimates [$/kWh] - No Demand Charges - Low Utilization Small Station Off Peak')
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
% title('Levelized Electricity Cost Estimates [$/kWh]- Flat Demand Charges - Low Utilization Small Station Off Peak')
% ylabel('[$/kWh]')
% set(gca,'Xtick',0:1:52);
% xt_label = get(gca, 'XTick');
% set(gca, 'XTick', xt_label, 'XTickLabel', {'' 'AK' 'AL' 'AR' 'AZ' 'CA' 'CO' 'CT' 'DC' 'DE' 'FL' 'GA' 'HI' 'IA' 'ID' 'IL' 'IN' 'KS' 'KY' 'LA' 'MA' 'MD' 'ME' 'MI' 'MN' 'MO' 'MS' 'MT' 'NC' 'ND' 'NE' 'NH' 'NJ' 'NM' 'NV' 'NY' 'OH' 'OK' 'OR' 'PA' 'RI' 'SC' 'SD' 'TN' 'TX' 'UT' 'VA' 'VT' 'WA' 'WI' 'WV' 'WY' ''})
% hold on
% subplot(3,1,3)
% bar(meanStateLS3,fliplr(stateLS3),'stacked')
% ylim([0 1.7])
% xlim([0 52])
% title('Levelized Electricity Cost Estimates [$/kWh]- TOU Demand Charges - Low Utilization Small Station Off Peak')
% ylabel('[$/kWh]')
% set(gca,'Xtick',0:1:52);
% xt_label = get(gca, 'XTick');
% set(gca, 'XTick', xt_label, 'XTickLabel', {'' 'AK' 'AL' 'AR' 'AZ' 'CA' 'CO' 'CT' 'DC' 'DE' 'FL' 'GA' 'HI' 'IA' 'ID' 'IL' 'IN' 'KS' 'KY' 'LA' 'MA' 'MD' 'ME' 'MI' 'MN' 'MO' 'MS' 'MT' 'NC' 'ND' 'NE' 'NH' 'NJ' 'NM' 'NV' 'NY' 'OH' 'OK' 'OR' 'PA' 'RI' 'SC' 'SD' 'TN' 'TX' 'UT' 'VA' 'VT' 'WA' 'WI' 'WV' 'WY' ''})
