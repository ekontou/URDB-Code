% INPUT DATA (matrix dJan, dFeb, dMar,..) 
% INPUT DATA (matrix eJan, eFeb, eMar,...)
% INPUT DATA (matrix 
% n=7506; % #utility rates
% w=1050; %kW  
% ww=20; %kwh per charge 
 t=1; 
% at=240; %number of charges

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



%%%Find Max among the hours and charge then 
%Demand charge
[maxHourJan, maxChargeJan]=FindMaxCharge(dJan, n, eJan);
[maxHourFeb, maxChargeFeb]=FindMaxCharge(dFeb, n, eFeb);
[maxHourMar, maxChargeMar]=FindMaxCharge(dMar, n, eMar);
[maxHourApr, maxChargeApr]=FindMaxCharge(dApr, n, eApr);
[maxHourMay, maxChargeMay]=FindMaxCharge(dMay, n, eMay);
[maxHourJun, maxChargeJun]=FindMaxCharge(dJun, n, eJun);
[maxHourJul, maxChargeJul]=FindMaxCharge(dJul, n, eJul);
[maxHourAug, maxChargeAug]=FindMaxCharge(dAug, n, eAug);
[maxHourSep, maxChargeSep]=FindMaxCharge(dSep, n, eSep);
[maxHourOct, maxChargeOct]=FindMaxCharge(dOct, n, eOct);
[maxHourNov, maxChargeNov]=FindMaxCharge(dNov, n, eNov);
[maxHourDec, maxChargeDec]=FindMaxCharge(dDec, n, eDec);
%Electricity charge weekday
[maxEHourJan, maxEChargeJan]=FindMaxCharge1(eJan, n);
[maxEHourFeb, maxEChargeFeb]=FindMaxCharge1(eFeb, n);
[maxEHourMar, maxEChargeMar]=FindMaxCharge1(eMar, n);
[maxEHourApr, maxEChargeApr]=FindMaxCharge1(eApr, n);
[maxEHourMay, maxEChargeMay]=FindMaxCharge1(eMay, n);
[maxEHourJun, maxEChargeJun]=FindMaxCharge1(eJun, n);
[maxEHourJul, maxEChargeJul]=FindMaxCharge1(eJul, n);
[maxEHourAug, maxEChargeAug]=FindMaxCharge1(eAug, n);
[maxEHourSep, maxEChargeSep]=FindMaxCharge1(eSep, n);
[maxEHourOct, maxEChargeOct]=FindMaxCharge1(eOct, n);
[maxEHourNov, maxEChargeNov]=FindMaxCharge1(eNov, n);
[maxEHourDec, maxEChargeDec]=FindMaxCharge1(eDec, n);
%Electricity charge weekend
[maxWHourJan, maxWChargeJan]=FindMaxCharge1(wJan, n);
[maxWHourFeb, maxWChargeFeb]=FindMaxCharge1(wFeb, n);
[maxWHourMar, maxWChargeMar]=FindMaxCharge1(wMar, n);
[maxWHourApr, maxWChargeApr]=FindMaxCharge1(wApr, n);
[maxWHourMay, maxWChargeMay]=FindMaxCharge1(wMay, n);
[maxWHourJun, maxWChargeJun]=FindMaxCharge1(wJun, n);
[maxWHourJul, maxWChargeJul]=FindMaxCharge1(wJul, n);
[maxWHourAug, maxWChargeAug]=FindMaxCharge1(wAug, n);
[maxWHourSep, maxWChargeSep]=FindMaxCharge1(wSep, n);
[maxWHourOct, maxWChargeOct]=FindMaxCharge1(wOct, n);
[maxWHourNov, maxWChargeNov]=FindMaxCharge1(wNov, n);
[maxWHourDec, maxWChargeDec]=FindMaxCharge1(wDec, n);

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
        resultJan(i)=maxChargeJan(i)*w;
        resultFeb(i)=maxChargeFeb(i)*w;
        resultMar(i)=maxChargeMar(i)*w;
        resultApr(i)=maxChargeApr(i)*w;
        resultMay(i)=maxChargeMay(i)*w;
        resultJun(i)=maxChargeJun(i)*w;
        resultJul(i)=maxChargeJul(i)*w;
        resultAug(i)=maxChargeAug(i)*w;
        resultSep(i)=maxChargeSep(i)*w;
        resultOct(i)=maxChargeOct(i)*w;
        resultNov(i)=maxChargeNov(i)*w;
        resultDec(i)=maxChargeDec(i)*w;
         
%Energy Costs (energy cost that corresponds to maximum demand
%charge time of day)
        ceJan(i)=eJan(i, maxHourJan(i))*t*ww*at;
        ceFeb(i)=eFeb(i, maxHourFeb(i))*t*ww*at;
        ceMar(i)=eMar(i, maxHourMar(i))*t*ww*at;
        ceApr(i)=eApr(i, maxHourApr(i))*t*ww*at;
        ceMay(i)=eMay(i, maxHourMay(i))*t*ww*at;
        ceJun(i)=eJun(i, maxHourJun(i))*t*ww*at;
        ceJul(i)=eJul(i, maxHourJul(i))*t*ww*at;
        ceAug(i)=eAug(i, maxHourAug(i))*t*ww*at;
        ceSep(i)=eSep(i, maxHourSep(i))*t*ww*at;
        ceOct(i)=eOct(i, maxHourOct(i))*t*ww*at;
        ceNov(i)=eNov(i, maxHourNov(i))*t*ww*at;
        ceDec(i)=eDec(i, maxHourDec(i))*t*ww*at;
        
        cewJan(i)=wJan(i, maxHourJan(i))*t*ww*at;
        cewFeb(i)=wFeb(i, maxHourFeb(i))*t*ww*at;
        cewMar(i)=wMar(i, maxHourMar(i))*t*ww*at;
        cewApr(i)=wApr(i, maxHourApr(i))*t*ww*at;
        cewMay(i)=wMay(i, maxHourMay(i))*t*ww*at;
        cewJun(i)=wJun(i, maxHourJun(i))*t*ww*at;
        cewJul(i)=wJul(i, maxHourJul(i))*t*ww*at;
        cewAug(i)=wAug(i, maxHourAug(i))*t*ww*at;
        cewSep(i)=wSep(i, maxHourSep(i))*t*ww*at;
        cewOct(i)=wOct(i, maxHourOct(i))*t*ww*at;
        cewNov(i)=wNov(i, maxHourNov(i))*t*ww*at;
        cewDec(i)=wDec(i, maxHourDec(i))*t*ww*at;
           
        
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
        ceJan(i)=maxEChargeJan(i)*t*ww*at;
        ceFeb(i)=maxEChargeFeb(i)*t*ww*at;
        ceMar(i)=maxEChargeMar(i)*t*ww*at;
        ceApr(i)=maxEChargeApr(i)*t*ww*at;
        ceMay(i)=maxEChargeMay(i)*t*ww*at;
        ceJun(i)=maxEChargeJun(i)*t*ww*at;
        ceJul(i)=maxEChargeJul(i)*t*ww*at;
        ceAug(i)=maxEChargeAug(i)*t*ww*at;
        ceSep(i)=maxEChargeSep(i)*t*ww*at;
        ceOct(i)=maxEChargeOct(i)*t*ww*at;
        ceNov(i)=maxEChargeNov(i)*t*ww*at;
        ceDec(i)=maxEChargeDec(i)*t*ww*at;
        
        cewJan(i)=maxWChargeJan(i)*t*ww*at;
        cewFeb(i)=maxWChargeFeb(i)*t*ww*at;
        cewMar(i)=maxWChargeMar(i)*t*ww*at;
        cewApr(i)=maxWChargeApr(i)*t*ww*at;
        cewMay(i)=maxWChargeMay(i)*t*ww*at;
        cewJun(i)=maxWChargeJun(i)*t*ww*at;
        cewJul(i)=maxWChargeJul(i)*t*ww*at;
        cewAug(i)=maxWChargeAug(i)*t*ww*at;
        cewSep(i)=maxWChargeSep(i)*t*ww*at;
        cewOct(i)=maxWChargeOct(i)*t*ww*at;
        cewNov(i)=maxWChargeNov(i)*t*ww*at;
        cewDec(i)=maxWChargeDec(i)*t*ww*at;
        
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
        
        %Electricity cost same calculation as in the flat demand case
        ceJan(i)=maxEChargeJan(i)*t*ww*at; 
        ceFeb(i)=maxEChargeFeb(i)*t*ww*at;
        ceMar(i)=maxEChargeMar(i)*t*ww*at;
        ceApr(i)=maxEChargeApr(i)*t*ww*at;
        ceMay(i)=maxEChargeMay(i)*t*ww*at;
        ceJun(i)=maxEChargeJun(i)*t*ww*at;
        ceJul(i)=maxEChargeJul(i)*t*ww*at;
        ceAug(i)=maxEChargeAug(i)*t*ww*at;
        ceSep(i)=maxEChargeSep(i)*t*ww*at;
        ceOct(i)=maxEChargeOct(i)*t*ww*at;
        ceNov(i)=maxEChargeNov(i)*t*ww*at;
        ceDec(i)=maxEChargeDec(i)*t*ww*at;
        
        cewJan(i)=maxWChargeJan(i)*t*ww*at;
        cewFeb(i)=maxWChargeFeb(i)*t*ww*at;
        cewMar(i)=maxWChargeMar(i)*t*ww*at;
        cewApr(i)=maxWChargeApr(i)*t*ww*at;
        cewMay(i)=maxWChargeMay(i)*t*ww*at;
        cewJun(i)=maxWChargeJun(i)*t*ww*at;
        cewJul(i)=maxWChargeJul(i)*t*ww*at;
        cewAug(i)=maxWChargeAug(i)*t*ww*at;
        cewSep(i)=maxWChargeSep(i)*t*ww*at;
        cewOct(i)=maxWChargeOct(i)*t*ww*at;
        cewNov(i)=maxWChargeNov(i)*t*ww*at;
        cewDec(i)=maxWChargeDec(i)*t*ww*at;
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
    YC(i)=(totcostJan(i)+totcostFeb(i)+totcostMar(i)+totcostApr(i)+totcostMay(i)+totcostJun(i)+ totcostJul(i)+totcostAug(i)+totcostSep(i)+totcostOct(i)+totcostNov(i)+totcostDec(i))/(365*ww*at);
    DC(i)=(resultJan(i)+resultFeb(i)+resultMar(i)+resultApr(i)+resultMay(i)+resultJun(i)+resultJul(i)+resultAug(i)+resultSep(i)+resultOct(i)+resultNov(i)+resultDec(i))/(365*ww*at);
    EC(i)=(ceJan(i)*(31-8)+cewJan(i)*8+ceFeb(i)*(28-8)+cewFeb(i)*8+ceMar(i)*(31-8)+cewMar(i)*8+ceApr(i)*(30-8)+cewApr(i)*8+ceMay(i)*(31-8)+cewMay(i)*8+ceJun(i)*(30-8)+cewJun(i)*8+ceJul(i)*(31-8)+cewJul(i)*8+ceAug(i)*(31-8)+cewAug(i)*8+ceSep(i)*(30-8)+cewSep(i)*8+ceOct(i)*(31-8)+cewOct(i)*8+ceNov(i)*(30-8)+cewNov(i)*8+ceDec(i)*(31-8)+cewDec(i)*8)/(365*ww*at);
    MF(i)=12*monthF(i)/(365*ww*at);
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
TC2=DC+EC+MF;

%minimum rate per gisID
gisIDN=gisID((YC~=0) & (YC<=20));
% idxtry = accumarray(gisIDN, TC2, [], @minarg);
% 
% % fix position in terms of the whole vector
% offset1 = cumsum([0;accumarray(gisIDN,1)]);
% idxtry = idxtry + offset1(1:end-1);
% 
% % corresponding min values
% YC=TC2(idxtry);
% MF=MF(idxtry);
% DC=DC(idxtry);
% EC=EC(idxtry);
% demandTypeN=demandTypeN(idxtry);
TC2n=DC+EC+MF;
%%%%%%%%% USEFUL BOXPLOT
% figure
% boxplot( YC ,demandTypeN,'Labels',{'No Demand','Flat Demand','TOU Demand'},'Symbol','o')
% ylabel('[$/kWh]')
% title('Avg Cost - Low Utilization Large Station (12-plugs), on-peak')
% ylim([-0.0001 1])
% figure
% boxplot( DC ,demandTypeN,'Labels',{'No Demand','Flat Demand','TOU Demand'},'Symbol','o')
% ylabel('[$/kWh]')
% title('Avg Demand Cost - Low Utilization Large Station (12-plugs),on-peak')
% ylim([-0.001 0.2])
% figure
% boxplot( EC ,demandTypeN,'Labels',{'No Demand','Flat Demand','TOU Demand'},'Symbol','o')
% ylabel('[$/kWh]')
% title('Avg Energy Cost - Low Utilization Large Station (12-plugs), on-peak')
% ylim([-0.001 0.3])

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
DMeanLowOnPeakL=[meand1;meand2;meand3]
EMeanLowOnPeakL=[meane1;meane2;meane3]
YCMeanLowOnPeakL=[meanY1;meanY2;meanY3]
FMeanLowOnPeakL=[meanf1;meanf2;meanf3]

% DMeanLowOnPeakL=grpstats(DC,demandTypeN)
% EMeanLowOnPeakL=grpstats(EC,demandTypeN)
% YCMeanLowOnPeakL=grpstats(YC,demandTypeN)
% FMeanLowOnPeakL=grpstats(MF,demandTypeN)

%scatterplot case
% figure
% gscatter(demandTypeN,YC)
% ylim([-0.01, 5])



%%%%%%%%%%%%% USEFUL BOXPLOT
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
% title('Levelized Electricity Cost Estimates [$/kWh] - No Demand Charges - Low Utilization Large Station On Peak')
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
% title('Levelized Electricity Cost Estimates [$/kWh]- Flat Demand Charges - Low Utilization Large Station On Peak')
% ylabel('[$/kWh]')
% set(gca,'Xtick',0:1:52);
% xt_label = get(gca, 'XTick');
% set(gca, 'XTick', xt_label, 'XTickLabel', {'' 'AK' 'AL' 'AR' 'AZ' 'CA' 'CO' 'CT' 'DC' 'DE' 'FL' 'GA' 'HI' 'IA' 'ID' 'IL' 'IN' 'KS' 'KY' 'LA' 'MA' 'MD' 'ME' 'MI' 'MN' 'MO' 'MS' 'MT' 'NC' 'ND' 'NE' 'NH' 'NJ' 'NM' 'NV' 'NY' 'OH' 'OK' 'OR' 'PA' 'RI' 'SC' 'SD' 'TN' 'TX' 'UT' 'VA' 'VT' 'WA' 'WI' 'WV' 'WY' ''})
% hold on
% subplot(3,1,3)
% bar(meanStateLS3,fliplr(stateLS3),'stacked')
% ylim([0 1.7])
% xlim([0 52])
% title('Levelized Electricity Cost Estimates [$/kWh]- TOU Demand Charges - Low Utilization Large Station On Peak')
% ylabel('[$/kWh]')
% set(gca,'Xtick',0:1:52);
% xt_label = get(gca, 'XTick');
% set(gca, 'XTick', xt_label, 'XTickLabel', {'' 'AK' 'AL' 'AR' 'AZ' 'CA' 'CO' 'CT' 'DC' 'DE' 'FL' 'GA' 'HI' 'IA' 'ID' 'IL' 'IN' 'KS' 'KY' 'LA' 'MA' 'MD' 'ME' 'MI' 'MN' 'MO' 'MS' 'MT' 'NC' 'ND' 'NE' 'NH' 'NJ' 'NM' 'NV' 'NY' 'OH' 'OK' 'OR' 'PA' 'RI' 'SC' 'SD' 'TN' 'TX' 'UT' 'VA' 'VT' 'WA' 'WI' 'WV' 'WY' ''})
% 
