% clear all
% clc
% close all
% 
% load('DataURDB.mat')
%%Inputs change for each case
%You can define the inputs as instucted herein
%General inputs
n=7506; % num of utility rates

%% Inputs

%% Inputs for Scenario 1 On peak & Off Peak
w=50; %kW of usage per plug per charge in the case of 1 charger
ww=8.8; %kWh per charging event
t=ww/w; % percentage of the hour that corresponds to DCFC charging (0.4= 20kWh/50kw)
myScript %runs low utilization 1 charger only case on peak
myScript_offPeak %runs low utilization 1 charger only case off peak
%matrices for low utilization small station
Matrix_L_S_on=[DMeanLowOnPeak,EMeanLowOnPeak,FMeanLowOnPeak];
Matrix_L_S_on_no=Matrix_L_S_on(1,:);
Matrix_L_S_on_flat=Matrix_L_S_on(2,:);
Matrix_L_S_on_TOU=Matrix_L_S_on(3,:);
Matrix_L_S_off=[DMeanLowOffPeak,EMeanLowOffPeak,FMeanLowOffPeak];
Matrix_L_S_off_no=Matrix_L_S_off(1,:);
Matrix_L_S_off_flat=Matrix_L_S_off(2,:);
Matrix_L_S_off_TOU=Matrix_L_S_off(3,:);

%% Inputs for Scenario 2 
w=50; %power demand
ww=8.8;
Recharge_Per_Day=16;
ScalingFactor=(Recharge_Per_Day*ww)/600;
tpatternkwh=[0 0 0 0 0 0 0 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 0 0]*ScalingFactor; 
myScript_High_onPeak
%Off Peak Energy Profile for High Utilization Small Station
tpatternkwh=[40 40 40 40 40 40 40 40 40 40 40 0 0 0 0 0 0 0 0 0 40 40 40 40]*ScalingFactor; 
myScript_High_offPeak
%matrices for high utilization small station
Matrix_H_S_on=[DMeanHighOnPeak,EMeanHighOnPeak,FMeanHighOnPeak];
Matrix_H_S_on_no=Matrix_H_S_on(1,:);
Matrix_H_S_on_flat=Matrix_H_S_on(2,:);
Matrix_H_S_on_TOU=Matrix_H_S_on(3,:);
Matrix_H_S_off=[DMeanHighOffPeak,EMeanHighOffPeak,FMeanHighOffPeak];
Matrix_H_S_off_no=Matrix_H_S_off(1,:);
Matrix_H_S_off_flat=Matrix_H_S_off(2,:);
Matrix_H_S_off_TOU=Matrix_H_S_off(3,:);

%% Inputs for Scenario 3 on and off peak
w=600; %kW  power
ww=38; %kwh per charge  
at=48; %number of charges per day
myScript_LStation %runs low utilization more chargers on peak
myScript_LStation_offPeak %runs low utilization more chargers off peak
%matrices for low utilization large station
Matrix_L_L_on=[DMeanLowOnPeakL,EMeanLowOnPeakL,FMeanLowOnPeakL];
Matrix_L_L_on_no=Matrix_L_L_on(1,:);
Matrix_L_L_on_flat=Matrix_L_L_on(2,:);
Matrix_L_L_on_TOU=Matrix_L_L_on(3,:);
Matrix_L_L_off=[DMeanLowOffPeakL,EMeanLowOffPeakL,FMeanLowOffPeakL];
Matrix_L_L_off_no=Matrix_L_L_off(1,:);
Matrix_L_L_off_flat=Matrix_L_L_off(2,:);
Matrix_L_L_off_TOU=Matrix_L_L_off(3,:);

%% Inputs for Scenario 4 On peak & Off Peak
w=400; %kW of usage per plug per charge in the case of 1 charger
ww=47; %kWh per charging event
t=ww/w; % percentage of the hour that corresponds to DCFC charging (0.4= 20kWh/50kw)
myScript %runs low utilization 1 charger only case on peak
myScript_offPeak %runs low utilization 1 charger only case off peak
%matrices for low utilization small station
Matrix_L_S_on2=[DMeanLowOnPeak,EMeanLowOnPeak,FMeanLowOnPeak];
Matrix_L_S_on_no2=Matrix_L_S_on2(1,:);
Matrix_L_S_on_flat2=Matrix_L_S_on2(2,:);
Matrix_L_S_on_TOU2=Matrix_L_S_on2(3,:);
Matrix_L_S_off2=[DMeanLowOffPeak,EMeanLowOffPeak,FMeanLowOffPeak];
Matrix_L_S_off_no2=Matrix_L_S_off2(1,:);
Matrix_L_S_off_flat2=Matrix_L_S_off2(2,:);
Matrix_L_S_off_TOU2=Matrix_L_S_off2(3,:);

%% Inputs for Scenario 5 
%Off Peak Energy Profile for High Utilization Large Station assuming 25200 kWh per day
w=400*12; %power demand
ww=80;
Recharge_Per_Day=350;
ScalingFactor=(Recharge_Per_Day*ww)/25200;
%On Peak Energy Profile for High Utilization Large Station
tpatternkwh=[0 0 0 0 0 0 0 0 0 0 0 0 4200 4200 4200 4200 4200 4200 0 0 0 0 0 0]*ScalingFactor;  %charging energy profile
myScript_High_onPeakL
tpatternkwh=[4200 4200 4200 4200 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4200 4200]*ScalingFactor;  %charging energy profile
myScript_High_offPeakL
%matrices for high utilization large station
Matrix_H_L_on=[DMeanHighOnPeakL,EMeanHighOnPeakL,FMeanHighOnPeakL];
Matrix_H_L_on_no=Matrix_H_L_on(1,:);
Matrix_H_L_on_flat=Matrix_H_L_on(2,:);
Matrix_H_L_on_TOU=Matrix_H_L_on(3,:);
Matrix_H_L_off=[DMeanHighOffPeakL,EMeanHighOffPeakL,FMeanHighOffPeakL];
Matrix_H_L_off_no=Matrix_H_L_off(1,:);
Matrix_H_L_off_flat=Matrix_H_L_off(2,:);
Matrix_H_L_off_TOU=Matrix_H_L_off(3,:); 

%% Program for creating bar graphs 
%fix inputs for stacked bar graph
Mr1c1=[Matrix_L_S_on_no;Matrix_L_S_off_no];
Mr2c1=[Matrix_L_S_on_flat;Matrix_L_S_off_flat];
Mr3c1=[Matrix_L_S_on_TOU;Matrix_L_S_off_TOU];
Mr1c2=[Matrix_L_L_on_no;Matrix_L_L_off_no];
Mr2c2=[Matrix_L_L_on_flat;Matrix_L_L_off_flat];
Mr3c2=[Matrix_L_L_on_TOU;Matrix_L_L_off_TOU];
Mr1c3=[Matrix_H_S_on_no;Matrix_H_S_off_no];
Mr2c3=[Matrix_H_S_on_flat;Matrix_H_S_off_flat];
Mr3c3=[Matrix_H_S_on_TOU;Matrix_H_S_off_TOU];
Mr1c4=[Matrix_L_S_on_no2;Matrix_L_S_off_no2];
Mr2c4=[Matrix_L_S_on_flat2;Matrix_L_S_off_flat2];
Mr3c4=[Matrix_L_S_on_TOU2;Matrix_L_S_off_TOU2];
Mr1c5=[Matrix_H_L_on_no;Matrix_H_L_off_no];
Mr2c5=[Matrix_H_L_on_flat;Matrix_H_L_off_flat];
Mr3c5=[Matrix_H_L_on_TOU;Matrix_H_L_off_TOU];


set(0,'defaultuicontrolfontname','Arial');
set(0,'defaultuicontrolfontsize',1);
set(0,'defaultaxesfontname','Arial');
set(0,'defaultaxesfontsize',14);
set(0,'defaulttextfontname','Arial');
set(0,'defaulttextfontsize',18);
set(0,'defaultlegendfontname','Arial');
set(0,'defaultlegendfontsize',18);

figure1 = figure('Colormap',[0 0 0;0 0.45 0.74;1 0 0],'Color',[1 1 1]);
set(figure1, 'Position', [500 500 800*1.618 800])
ylim1=0.3;
ylim2=3;

%1st column graphs
subplot1=subplot(3,5,1)
bar(fliplr(Mr1c1),'stacked');
title('Scenario 1')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
yt_label = get(gca, 'YTick');
set(gca, 'YTick', yt_label, 'XTickLabel', {'on peak' 'off peak'})
ylabel({'Average Electricity Cost [$/kWh]'})
ylim([0 ylim1])
xlim([0.25 2.75])
hold on
text('Parent',subplot1,'Rotation',90,'String','No Demand Charges',...
    'Position',[-1.7 -0.0147686340127776 0]);

subplot(3,5,6)
bar(fliplr(Mr2c1),'stacked')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylabel({'Average Electricity Cost [$/kWh]'})
ylim([0 ylim2])
xlim([0.25 2.75])
hold on
text('Parent',subplot1,'Rotation',90,'String','Flat Demand Charges',...
    'Position',[-1.7 -0.419122908427137 0]);

subplot(3,5,11)
bar(fliplr(Mr3c1),'stacked')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylabel({'Average Electricity Cost [$/kWh]'})
ylim([0 ylim2])
xlim([0.25 2.75])
hold on
text('Parent',subplot1,'Rotation',90,'String','TOU Demand Charges',...
    'Position',[-1.7 -0.852802327350167 0]);

%2nd column graphs
subplot(3,5,2)
bar(fliplr(Mr1c3),'stacked')
title('Scenario 2')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim1])
xlim([0.25 2.75])
%legend({'Demand Charges', 'Energy Charges','Fixed Charges'},'location','northwest')
hold on
subplot(3,5,7)
bar(fliplr(Mr2c3),'stacked')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim1])
hold on
subplot(3,5,12)
bar(fliplr(Mr3c3),'stacked')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim1])
xlim([0.25 2.75])

%3rd column graphs
subplot(3,5,3)
bar(fliplr(Mr1c2),'stacked')
title('Scenario 3')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim1])
xlim([0.25 2.75])
hold on
subplot(3,5,8)
bar(fliplr(Mr2c2),'stacked')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim1])
xlim([0.25 2.75])
hold on
subplot(3,5,13)
bar(fliplr(Mr3c2),'stacked')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim1])
xlim([0.25 2.75])

%4th column graphs
subplot(3,5,4)
bar(fliplr(Mr1c4),'stacked')
title('Scenario 4')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim1])
xlim([0.25 2.75])
hold on
subplot(3,5,9)
bar(fliplr(Mr2c4),'stacked')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim2])
xlim([0.25 2.75])
hold on
subplot(3,5,14)
bar(fliplr(Mr3c4),'stacked')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim2])
xlim([0.25 2.75])

%5th column graphs
subplot(3,5,5)
H=bar(fliplr(Mr1c5),'stacked');
title('Scenario 5')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim1])
xlim([0.25 2.75])
legend1=legend([fliplr(H)],{'Demand Charges','Energy Charges','Fixed Charges'});
set(legend1,'FontSize',18);
subplot(3,5,10)
bar(fliplr(Mr2c5),'stacked')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim1])
xlim([0.25 2.75])
hold on
subplot(3,5,15)
bar(fliplr(Mr3c5),'stacked')
xt_label = get(gca, 'XTick');
set(gca, 'XTick', xt_label, 'XTickLabel', {'on peak' 'off peak'})
ylim([0 ylim1])
xlim([0.25 2.75])
%print('BarTotal','-dpng','-r300');

%% Varying kWh per charge
for ii=3:1:80
%%Inputs for Scenario 1 on and off peak
w=50; %kW of usage per plug per charge in the case of 1 charger
%ww=36; %kwh per charge  
ww=ii;
t=ww/w; % percentage of the hour that corresponds to DCFC charging (0.4= 20kWh/50kw) if energy 36kwh then t=0.72
myScript %runs low utilization 1 charger only case on peak
myScript_offPeak %runs low utilization 1 charger only case off peak
%matrices for Scenario 1
Matrix_L_S_on=[DMeanLowOnPeak,EMeanLowOnPeak,FMeanLowOnPeak];
Matrix_L_S_on_no=Matrix_L_S_on(1,:);
Matrix_L_S_on_flat=Matrix_L_S_on(2,:);
Matrix_L_S_on_TOU=Matrix_L_S_on(3,:);
Matrix_L_S_off=[DMeanLowOffPeak,EMeanLowOffPeak,FMeanLowOffPeak];
Matrix_L_S_off_no=Matrix_L_S_off(1,:);
Matrix_L_S_off_flat=Matrix_L_S_off(2,:);
Matrix_L_S_off_TOU=Matrix_L_S_off(3,:);

%%Inputs for Scenario 2 on and off peak
w=50; %power demand
%ww=36; %kwh per charge  
ww=ii;
Recharge_Per_Day=16;
ScalingFactor=(Recharge_Per_Day*ww)/600;
tpatternkwh=[0 0 0 0 0 0 0 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 0 0]*ScalingFactor; 
myScript_High_onPeak
%Off Peak Energy Profile for High Utilization Small Station
tpatternkwh=[40 40 40 40 40 40 40 40 40 40 40 0 0 0 0 0 0 0 0 0 40 40 40 40]*ScalingFactor; 
myScript_High_offPeak
%matrices for high utilization small station
Matrix_H_S_on=[DMeanHighOnPeak,EMeanHighOnPeak,FMeanHighOnPeak];
Matrix_H_S_on_no=Matrix_H_S_on(1,:);
Matrix_H_S_on_flat=Matrix_H_S_on(2,:);
Matrix_H_S_on_TOU=Matrix_H_S_on(3,:);
Matrix_H_S_off=[DMeanHighOffPeak,EMeanHighOffPeak,FMeanHighOffPeak];
Matrix_H_S_off_no=Matrix_H_S_off(1,:);
Matrix_H_S_off_flat=Matrix_H_S_off(2,:);
Matrix_H_S_off_TOU=Matrix_H_S_off(3,:);

%%Inputs for Scenario 3 on and off peak
w=300; %kW  power
%ww=36; %kwh per charge  
ww=ii;
at=48; %number of charges per day
myScript_LStation %runs low utilization more chargers on peak
myScript_LStation_offPeak %runs low utilization more chargers off peak
%matrices for low utilization large station
Matrix_L_L_on=[DMeanLowOnPeakL,EMeanLowOnPeakL,FMeanLowOnPeakL];
Matrix_L_L_on_no=Matrix_L_L_on(1,:);
Matrix_L_L_on_flat=Matrix_L_L_on(2,:);
Matrix_L_L_on_TOU=Matrix_L_L_on(3,:);
Matrix_L_L_off=[DMeanLowOffPeakL,EMeanLowOffPeakL,FMeanLowOffPeakL];
Matrix_L_L_off_no=Matrix_L_L_off(1,:);
Matrix_L_L_off_flat=Matrix_L_L_off(2,:);
Matrix_L_L_off_TOU=Matrix_L_L_off(3,:);

%%Inputs for Scenario 4 on and off peak
w=350; %kW of usage per plug per charge in the case of 1 charger
%ww=36; %kwh per charge  
ww=ii;
t=ww/w; % percentage of the hour that corresponds to DCFC charging (0.4= 20kWh/50kw) if energy 36kwh then t=0.72
myScript %runs low utilization 1 charger only case on peak
myScript_offPeak %runs low utilization 1 charger only case off peak
%matrices for Scenario 1
Matrix_L_S_on2=[DMeanLowOnPeak,EMeanLowOnPeak,FMeanLowOnPeak];
Matrix_L_S_on_no2=Matrix_L_S_on2(1,:);
Matrix_L_S_on_flat2=Matrix_L_S_on2(2,:);
Matrix_L_S_on_TOU2=Matrix_L_S_on2(3,:);
Matrix_L_S_off2=[DMeanLowOffPeak,EMeanLowOffPeak,FMeanLowOffPeak];
Matrix_L_S_off_no2=Matrix_L_S_off2(1,:);
Matrix_L_S_off_flat2=Matrix_L_S_off2(2,:);
Matrix_L_S_off_TOU2=Matrix_L_S_off2(3,:);

%%Inputs for Scenario 5 on and off peak
w=2100; %power demand
%ww=36; %kwh per charge  
ww=ii;
Recharge_Per_Day=500;
ScalingFactor=(Recharge_Per_Day*ww)/25200;
tpatternkwh=[4200 4200 4200 4200 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4200 4200]*ScalingFactor;  %charging energy profile
myScript_High_offPeakL
%On Peak Energy Profile for High Utilization Large Station
tpatternkwh=[0 0 0 0 0 0 0 0 0 0 0 0 4200 4200 4200 4200 4200 4200 0 0 0 0 0 0]*ScalingFactor;  %charging energy profile
myScript_High_onPeakL
%matrices for high utilization large station
Matrix_H_L_on=[DMeanHighOnPeakL,EMeanHighOnPeakL,FMeanHighOnPeakL];
Matrix_H_L_on_no=Matrix_H_L_on(1,:);
Matrix_H_L_on_flat=Matrix_H_L_on(2,:);
Matrix_H_L_on_TOU=Matrix_H_L_on(3,:);
Matrix_H_L_off=[DMeanHighOffPeakL,EMeanHighOffPeakL,FMeanHighOffPeakL];
Matrix_H_L_off_no=Matrix_H_L_off(1,:);
Matrix_H_L_off_flat=Matrix_H_L_off(2,:);
Matrix_H_L_off_TOU=Matrix_H_L_off(3,:);

%fix inputs for stacked bar graph
Mr1c1=[Matrix_L_S_on_no;Matrix_L_S_off_no];
Mr2c1=[Matrix_L_S_on_flat;Matrix_L_S_off_flat];
Mr3c1=[Matrix_L_S_on_TOU;Matrix_L_S_off_TOU];
Mr1c2=[Matrix_L_L_on_no;Matrix_L_L_off_no];
Mr2c2=[Matrix_L_L_on_flat;Matrix_L_L_off_flat];
Mr3c2=[Matrix_L_L_on_TOU;Matrix_L_L_off_TOU];
Mr1c3=[Matrix_H_S_on_no;Matrix_H_S_off_no];
Mr2c3=[Matrix_H_S_on_flat;Matrix_H_S_off_flat];
Mr3c3=[Matrix_H_S_on_TOU;Matrix_H_S_off_TOU];
Mr1c4=[Matrix_L_S_on_no2;Matrix_L_S_off_no2];
Mr2c4=[Matrix_L_S_on_flat2;Matrix_L_S_off_flat2];
Mr3c4=[Matrix_L_S_on_TOU2;Matrix_L_S_off_TOU2];
Mr1c5=[Matrix_H_L_on_no;Matrix_H_L_off_no];
Mr2c5=[Matrix_H_L_on_flat;Matrix_H_L_off_flat];
Mr3c5=[Matrix_H_L_on_TOU;Matrix_H_L_off_TOU];



%% Summary cost
Mean_SmallLow_NoDem(ii) = mean(sum(Mr1c1,2)); %Average cost for small station low utilization no demand charges
Mean_SmallLow_Dem(ii) = (mean(sum(Mr2c1,2))+mean(sum(Mr3c1,2)))/2; %Average cost for small station low utilization with demand charges (average on and off peak charging)

Mean_SmallHigh_NoDem(ii) = mean(sum(Mr1c3,2)); %Average cost for small station high utilization no demand charges
Mean_SmallHigh_Dem(ii) = (mean(sum(Mr2c3,2))+mean(sum(Mr3c3,2)))/2; %Average cost for small station high utilization with demand charges (average on and off peak charging)

Mean_LargeLow_NoDem(ii) = mean(sum(Mr1c2,2)); %Average cost for large station low utilization no demand charges
Mean_LargeLow_Dem(ii) = (mean(sum(Mr2c2,2))+mean(sum(Mr3c2,2)))/2; %Average cost for large station low utilization with demand charges (average on and off peak charging)

Mean_SmallLow_NoDem2(ii) = mean(sum(Mr1c4,2)); %Average cost for large station high utilization no demand charges
Mean_SmallLow_Dem2(ii) = (mean(sum(Mr2c4,2))+mean(sum(Mr3c4,2)))/2; %Average cost for large station high utilization with demand charges (average on and off peak charging)

Mean_LargeHigh_NoDem(ii) = mean(sum(Mr1c5,2)); %Average cost for large station high utilization no demand charges
Mean_LargeHigh_Dem(ii) = (mean(sum(Mr2c5,2))+mean(sum(Mr3c5,2)))/2; %Average cost for large station high utilization with demand charges (average on and off peak charging)

end

figure2 = figure('Color',[1 1 1]);
set(figure2, 'Position', [500 500 900*1.618 900])
subplot(2,3,1)
h1=plot(Mean_SmallLow_NoDem,'k','LineWidth',3);
hold on
h2=plot(Mean_SmallLow_Dem,'--','LineWidth',3);
xlim([5 70])
ylim([0 3])
title('Scenario 1')
ylabel('Average Electricity Cost [$/kWh]')
xlabel('Average Energy per Charging Event [kWh]')
legend1=legend([h2 h1],{'Demand Charges','No Demand Charges'});

subplot(2,3,2)
h1=plot(Mean_SmallHigh_NoDem,'k','LineWidth',3);
hold on
h2=plot(Mean_SmallHigh_Dem,'--','LineWidth',3);
xlim([5 70])
ylim([0 .3])
title('Scenario 2')
xlabel('Average Energy per Charging Event [kWh]')
legend1=legend([h2 h1],{'Demand Charges','No Demand Charges'});

subplot(2,3,3)
h1=plot(Mean_LargeLow_NoDem,'k','LineWidth',3);
hold on
h2=plot(Mean_LargeLow_Dem,'--','LineWidth',3);
xlim([5 70])
ylim([0 .3])
title('Scenario 3')
xlabel('Average Energy per Charging Event [kWh]')
legend1=legend([h2 h1],{'Demand Charges','No Demand Charges'});

subplot(2,3,4)
h1=plot(Mean_SmallLow_NoDem2,'k','LineWidth',3);
hold on
h2=plot(Mean_SmallLow_Dem2,'--','LineWidth',3);
xlim([5 70])
ylim([0 3])
title('Scenario 4')
ylabel('Average Electricity Cost [$/kWh]')
xlabel('Average Energy per Charging Event [kWh]')
legend1=legend([h2 h1],{'Demand Charges','No Demand Charges'});

subplot(2,3,5)
h1=plot(Mean_LargeHigh_NoDem,'k','LineWidth',3);
hold on
h2=plot(Mean_LargeHigh_Dem,'--','LineWidth',3);
xlim([3 70])
ylim([0 .3])
title('Scenario 5')
xlabel('Average Energy per Charging Event [kWh]')
legend1=legend([h2 h1],{'Demand Charges','No Demand Charges'});


%% Varyinf number of charges per day

ww=8.8;
lll=48;
vvv=16;
%1 Plug 50 kW station
for vvv=1:1:48
%%Inputs for Large Utilization Stations (Small and Large Station different
%%input needed

%On Peak Energy Profile for High Utilization Small Station assuming 600 kWh per day
w=50; %power demand
%ww=36; %kwh per charge  
%Recharge_Per_Day=16;
Recharge_Per_Day=vvv;
ScalingFactor=(Recharge_Per_Day*ww)/600;
tpatternkwh=[0 0 0 0 0 0 0 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 0 0]*ScalingFactor; 
myScript_High_onPeak
%Off Peak Energy Profile for High Utilization Small Station
tpatternkwh=[40 40 40 40 40 40 40 40 40 40 40 0 0 0 0 0 0 0 0 0 40 40 40 40]*ScalingFactor; 
myScript_High_offPeak

%%Program for creating bar graphs 

%matrices for high utilization small station
Matrix_H_S_on=[DMeanHighOnPeak,EMeanHighOnPeak,FMeanHighOnPeak];
Matrix_H_S_on_no=Matrix_H_S_on(1,:);
Matrix_H_S_on_flat=Matrix_H_S_on(2,:);
Matrix_H_S_on_TOU=Matrix_H_S_on(3,:);
Matrix_H_S_off=[DMeanHighOffPeak,EMeanHighOffPeak,FMeanHighOffPeak];
Matrix_H_S_off_no=Matrix_H_S_off(1,:);
Matrix_H_S_off_flat=Matrix_H_S_off(2,:);
Matrix_H_S_off_TOU=Matrix_H_S_off(3,:);
%fix inputs for stacked bar graph
Mr1c3=[Matrix_H_S_on_no;Matrix_H_S_off_no];
Mr2c3=[Matrix_H_S_on_flat;Matrix_H_S_off_flat];
Mr3c3=[Matrix_H_S_on_TOU;Matrix_H_S_off_TOU];




%% Summary cost
%%Summary cost based on utilization factor, charging # of daily
%%charges
% Mean_SmallLow_NoDemU(vvv) = mean(sum(Mr1c1,2)); %Average cost for small station low utilization no demand charges
% Mean_SmallLow_DemU(vvv) = (mean(sum(Mr2c1,2))+mean(sum(Mr3c1,2)))/2 %Average cost for small station low utilization with demand charges (average on and off peak charging)

Mean_SmallHigh_NoDemU(vvv) = mean(sum(Mr1c3,2)); %Average cost for small station high utilization no demand charges
Mean_SmallHigh_DemU(vvv) = (mean(sum(Mr2c3,2))+mean(sum(Mr3c3,2)))/2; %Average cost for small station high utilization with demand charges
Mean_SmallHigh_FlatDemU(vvv) = mean(sum(Mr2c3,2)); %Average cost for small station high utilization with flat demand charges 
Mean_SmallHigh_TOUDemU(vvv)=mean(sum(Mr3c3,2)); %Average cost for small station high utilization with TOU demand charges 

% Mean_LargeLow_NoDemU(ii) = mean(sum(Mr1c2,2)); %Average cost for large station low utilization no demand charges
% Mean_LargeLow_DemU(ii) = (mean(sum(Mr2c2,2))+mean(sum(Mr3c2,2)))/2 %Average cost for large station low utilization with demand charges (average on and off peak charging)
end

ww=38;
%4 Plugs station
for lll=10:1:150
%%Inputs for Low Utilization Large Station on and off peak

%Off Peak Energy Profile for High Utilization Large Station assuming 25200 kWh per day
w=300; %power demand
Recharge_Per_Day=lll;
ScalingFactor=(Recharge_Per_Day*ww)/25200;
tpatternkwh=[4200 4200 4200 4200 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4200 4200]*ScalingFactor;  %charging energy profile
myScript_High_offPeakL
%On Peak Energy Profile for High Utilization Large Station
tpatternkwh=[0 0 0 0 0 0 0 0 0 0 0 0 4200 4200 4200 4200 4200 4200 0 0 0 0 0 0]*ScalingFactor;  %charging energy profile
myScript_High_onPeakL

%%Program for creating bar graphs 

%matrices for high utilization large station
Matrix_H_L_on=[DMeanHighOnPeakL,EMeanHighOnPeakL,FMeanHighOnPeakL];
Matrix_H_L_on_no=Matrix_H_L_on(1,:);
Matrix_H_L_on_flat=Matrix_H_L_on(2,:);
Matrix_H_L_on_TOU=Matrix_H_L_on(3,:);
Matrix_H_L_off=[DMeanHighOffPeakL,EMeanHighOffPeakL,FMeanHighOffPeakL];
Matrix_H_L_off_no=Matrix_H_L_off(1,:);
Matrix_H_L_off_flat=Matrix_H_L_off(2,:);
Matrix_H_L_off_TOU=Matrix_H_L_off(3,:);

%fix inputs for stacked bar graph

Mr1c4=[Matrix_H_L_on_no;Matrix_H_L_off_no];
Mr2c4=[Matrix_H_L_on_flat;Matrix_H_L_off_flat];
Mr3c4=[Matrix_H_L_on_TOU;Matrix_H_L_off_TOU];


%% Summary cost

%%Summary cost based on utilization factor, charging # of daily
%%charges
% Mean_SmallLow_NoDemU(vvv) = mean(sum(Mr1c1,2)); %Average cost for small station low utilization no demand charges
% Mean_SmallLow_DemU(vvv) = (mean(sum(Mr2c1,2))+mean(sum(Mr3c1,2)))/2 %Average cost for small station low utilization with demand charges (average on and off peak charging)

% Mean_LargeLow_NoDemU(ii) = mean(sum(Mr1c2,2)); %Average cost for large station low utilization no demand charges
% Mean_LargeLow_DemU(ii) = (mean(sum(Mr2c2,2))+mean(sum(Mr3c2,2)))/2 %Average cost for large station low utilization with demand charges (average on and off peak charging)

 Mean_LargeHigh_NoDemU4(lll) = mean(sum(Mr1c4,2)); %Average cost for large station high utilization no demand charges
 Mean_LargeHigh_DemU4(lll) = (mean(sum(Mr2c4,2))+mean(sum(Mr3c4,2)))/2; %Average cost for large station high utilization no demand charges
 Mean_LargeHigh_FlatDemU4(lll) = mean(sum(Mr2c4,2));
 Mean_LargeHigh_TOUDenU4(lll)= mean(sum(Mr3c4,2)); %Average cost for large station high utilization with demand charges (average on and off peak charging)

end

ww=47;
%1 Plug 350 kW station
for vvv=1:1:48
%%Inputs for Large Utilization Stations (Small and Large Station different
%%input needed

%On Peak Energy Profile for High Utilization Small Station assuming 600 kWh per day
w=350; %power demand
%ww=36; %kwh per charge  
%Recharge_Per_Day=16;
Recharge_Per_Day=vvv;
ScalingFactor=(Recharge_Per_Day*ww)/600;
tpatternkwh=[0 0 0 0 0 0 0 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 0 0]*ScalingFactor; 
myScript_High_onPeak
%Off Peak Energy Profile for High Utilization Small Station
tpatternkwh=[40 40 40 40 40 40 40 40 40 40 40 0 0 0 0 0 0 0 0 0 40 40 40 40]*ScalingFactor; 
myScript_High_offPeak

%%Program for creating bar graphs 

%matrices for high utilization small station
Matrix_H_S_on=[DMeanHighOnPeak,EMeanHighOnPeak,FMeanHighOnPeak];
Matrix_H_S_on_no=Matrix_H_S_on(1,:);
Matrix_H_S_on_flat=Matrix_H_S_on(2,:);
Matrix_H_S_on_TOU=Matrix_H_S_on(3,:);
Matrix_H_S_off=[DMeanHighOffPeak,EMeanHighOffPeak,FMeanHighOffPeak];
Matrix_H_S_off_no=Matrix_H_S_off(1,:);
Matrix_H_S_off_flat=Matrix_H_S_off(2,:);
Matrix_H_S_off_TOU=Matrix_H_S_off(3,:);
%fix inputs for stacked bar graph
Mr1c3=[Matrix_H_S_on_no;Matrix_H_S_off_no];
Mr2c3=[Matrix_H_S_on_flat;Matrix_H_S_off_flat];
Mr3c3=[Matrix_H_S_on_TOU;Matrix_H_S_off_TOU];




%% Summary cost
%%Summary cost based on utilization factor, charging # of daily
%%charges
% Mean_SmallLow_NoDemU(vvv) = mean(sum(Mr1c1,2)); %Average cost for small station low utilization no demand charges
% Mean_SmallLow_DemU(vvv) = (mean(sum(Mr2c1,2))+mean(sum(Mr3c1,2)))/2 %Average cost for small station low utilization with demand charges (average on and off peak charging)

Mean_SmallHigh_NoDemU2(vvv) = mean(sum(Mr1c3,2)); %Average cost for small station high utilization no demand charges
Mean_SmallHigh_DemU2(vvv) = (mean(sum(Mr2c3,2))+mean(sum(Mr3c3,2)))/2; %Average cost for small station high utilization with demand charges
Mean_SmallHigh_FlatDemU2(vvv) = mean(sum(Mr2c3,2)); %Average cost for small station high utilization with flat demand charges 
Mean_SmallHigh_TOUDemU2(vvv)=mean(sum(Mr3c3,2)); %Average cost for small station high utilization with TOU demand charges 

% Mean_LargeLow_NoDemU(ii) = mean(sum(Mr1c2,2)); %Average cost for large station low utilization no demand charges
% Mean_LargeLow_DemU(ii) = (mean(sum(Mr2c2,2))+mean(sum(Mr3c2,2)))/2 %Average cost for large station low utilization with demand charges (average on and off peak charging)
end

ww=47;
%12 Plugs station
for lll=60:20:1000
%%Inputs for Low Utilization Large Station on and off peak

%Off Peak Energy Profile for High Utilization Large Station assuming 25200 kWh per day
w=1400; %power demand
Recharge_Per_Day=lll;
ScalingFactor=(Recharge_Per_Day*ww)/25200;
tpatternkwh=[4200 4200 4200 4200 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4200 4200]*ScalingFactor;  %charging energy profile
myScript_High_offPeakL
%On Peak Energy Profile for High Utilization Large Station
tpatternkwh=[0 0 0 0 0 0 0 0 0 0 0 0 4200 4200 4200 4200 4200 4200 0 0 0 0 0 0]*ScalingFactor;  %charging energy profile
myScript_High_onPeakL

%%Program for creating bar graphs 

%matrices for high utilization large station
Matrix_H_L_on=[DMeanHighOnPeakL,EMeanHighOnPeakL,FMeanHighOnPeakL];
Matrix_H_L_on_no=Matrix_H_L_on(1,:);
Matrix_H_L_on_flat=Matrix_H_L_on(2,:);
Matrix_H_L_on_TOU=Matrix_H_L_on(3,:);
Matrix_H_L_off=[DMeanHighOffPeakL,EMeanHighOffPeakL,FMeanHighOffPeakL];
Matrix_H_L_off_no=Matrix_H_L_off(1,:);
Matrix_H_L_off_flat=Matrix_H_L_off(2,:);
Matrix_H_L_off_TOU=Matrix_H_L_off(3,:);

%fix inputs for stacked bar graph

Mr1c4=[Matrix_H_L_on_no;Matrix_H_L_off_no];
Mr2c4=[Matrix_H_L_on_flat;Matrix_H_L_off_flat];
Mr3c4=[Matrix_H_L_on_TOU;Matrix_H_L_off_TOU];


%% Summary cost

%%Summary cost based on utilization factor, charging # of daily
%%charges
% Mean_SmallLow_NoDemU(vvv) = mean(sum(Mr1c1,2)); %Average cost for small station low utilization no demand charges
% Mean_SmallLow_DemU(vvv) = (mean(sum(Mr2c1,2))+mean(sum(Mr3c1,2)))/2 %Average cost for small station low utilization with demand charges (average on and off peak charging)

% Mean_LargeLow_NoDemU(ii) = mean(sum(Mr1c2,2)); %Average cost for large station low utilization no demand charges
% Mean_LargeLow_DemU(ii) = (mean(sum(Mr2c2,2))+mean(sum(Mr3c2,2)))/2 %Average cost for large station low utilization with demand charges (average on and off peak charging)

 Mean_LargeHigh_NoDemU(lll) = mean(sum(Mr1c4,2)); %Average cost for large station high utilization no demand charges
 Mean_LargeHigh_DemU(lll) = (mean(sum(Mr2c4,2))+mean(sum(Mr3c4,2)))/2; %Average cost for large station high utilization no demand charges
 Mean_LargeHigh_FlatDemU(lll) = mean(sum(Mr2c4,2));
 Mean_LargeHigh_TOUDenU(lll)= mean(sum(Mr3c4,2)); %Average cost for large station high utilization with demand charges (average on and off peak charging)

end

set(0,'defaultuicontrolfontname','Arial');
set(0,'defaultuicontrolfontsize',24);
set(0,'defaultaxesfontname','Arial');
set(0,'defaultaxesfontsize',18);
set(0,'defaulttextfontname','Arial');
set(0,'defaulttextfontsize',24);
set(0,'defaultlegendfontname','Arial');
set(0,'defaultlegendfontsize',24);
%%Create Utilization Figure For Small Station 50 kW (1 charger)
figure3 = figure('Color',[1 1 1]);
set(figure3, 'Position', [500 500 800*1.618 350])
subplot(1,4,1)
xpps=1:1:48;
xppsind=1:1:48;
pps1=plot(xpps(xppsind),Mean_SmallHigh_NoDemU(xppsind),'k','LineWidth',3);
hold on
pps2=plot(xpps(xppsind),Mean_SmallHigh_DemU(xppsind),'--','LineWidth',3);
xlim([1 48])
ylim([0 2])
title('1 Plug - 50 kW')
xlabel('Charging Events per Day')
ylabel('Average Electricity Cost [$/kWh]')
legendpps=legend([pps2 pps1],{'Demand Charges', 'No Demand Charges'});
hold on
% Creater Utilization Figure For Large Station (4 chargers)
subplot(1,4,2)
xppsn=10:1:150;
xppsindn=10:1:150;
pps3=plot(xppsindn,Mean_LargeHigh_NoDemU4(xppsindn),'k','LineWidth',3);
hold on
pps4=plot(xppsindn,Mean_LargeHigh_DemU4(xppsindn),'--','LineWidth',3);
xlim([10 150])
ylim([0 .3])
title('4 Plugs - 150 kW')
xlabel('Charging Events per Day')
legendpps=legend([pps4 pps3],{'Demand Charges', 'No Demand Charges'});
%%Create Utilization Figure For Small Station 350 kW(1 charger)
subplot(1,4,3)
xpps=1:1:48;
xppsind=1:1:48;
pps1=plot(xpps(xppsind),Mean_SmallHigh_NoDemU2(xppsind),'k','LineWidth',3);
hold on
pps2=plot(xpps(xppsind),Mean_SmallHigh_DemU2(xppsind),'--','LineWidth',3);
xlim([1 48])
ylim([0 2])
title('1 Plug - 350 kW')
xlabel('Charging Events per Day')
ylabel('Average Electricity Cost [$/kWh]')
legendpps=legend([pps2 pps1],{'Demand Charges', 'No Demand Charges'});
hold on
% Creater Utilization Figure For Large Station (12 chargers)
subplot(1,4,4)
xppsn=60:20:1200;
xppsindn=60:40:1200;
pps3=plot(xppsindn,Mean_LargeHigh_NoDemU(xppsindn),'k','LineWidth',3);
hold on
pps4=plot(xppsindn,Mean_LargeHigh_DemU(xppsindn),'--','LineWidth',3);
xlim([60 1200])
ylim([0 .3])
title('12 Plugs - 350 kW')
xlabel('Charging Events per Day')
legendpps=legend([pps4 pps3],{'Demand Charges', 'No Demand Charges'});

%% 3-D plots

%1 Plug 50 kW station
Mean_SmallHigh_NoDemU=zeros(76,32);
Mean_SmallHigh_DemU=zeros(76,32);
index1=1;
for ii=5:1:80
    index2=1;
for vvv=1:1:32
%%Inputs for Large Utilization Stations (Small and Large Station different
%%input needed

%On Peak Energy Profile for High Utilization Small Station assuming 600 kWh per day
w=50; %power demand
ww=ii; %kwh per charge  
Recharge_Per_Day=vvv;
ScalingFactor=(Recharge_Per_Day*ww)/600;
tpatternkwh=[0 0 0 0 0 0 0 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 0 0]*ScalingFactor; 
myScript_High_onPeak
%Off Peak Energy Profile for High Utilization Small Station
tpatternkwh=[40 40 40 40 40 40 40 40 40 40 40 0 0 0 0 0 0 0 0 0 40 40 40 40]*ScalingFactor; 
myScript_High_offPeak

%%Program for creating bar graphs 

%matrices for high utilization small station
Matrix_H_S_on=[DMeanHighOnPeak,EMeanHighOnPeak,FMeanHighOnPeak];
Matrix_H_S_on_no=Matrix_H_S_on(1,:);
Matrix_H_S_on_flat=Matrix_H_S_on(2,:);
Matrix_H_S_on_TOU=Matrix_H_S_on(3,:);
Matrix_H_S_off=[DMeanHighOffPeak,EMeanHighOffPeak,FMeanHighOffPeak];
Matrix_H_S_off_no=Matrix_H_S_off(1,:);
Matrix_H_S_off_flat=Matrix_H_S_off(2,:);
Matrix_H_S_off_TOU=Matrix_H_S_off(3,:);
%fix inputs for stacked bar graph
Mr1c3=[Matrix_H_S_on_no;Matrix_H_S_off_no];
Mr2c3=[Matrix_H_S_on_flat;Matrix_H_S_off_flat];
Mr3c3=[Matrix_H_S_on_TOU;Matrix_H_S_off_TOU];

%% Summary cost
%%Summary cost based on utilization factor, charging # of daily
%%charges
% Mean_SmallLow_NoDemU(vvv) = mean(sum(Mr1c1,2)); %Average cost for small station low utilization no demand charges
% Mean_SmallLow_DemU(vvv) = (mean(sum(Mr2c1,2))+mean(sum(Mr3c1,2)))/2 %Average cost for small station low utilization with demand charges (average on and off peak charging)

Mean_SmallHigh_NoDemU(index1,index2) = mean(sum(Mr1c3,2)); %Average cost for small station high utilization no demand charges
Mean_SmallHigh_DemU(index1,index2) = (mean(sum(Mr2c3,2))+mean(sum(Mr3c3,2)))/2; %Average cost for small station high utilization with demand charges
%Mean_SmallHigh_FlatDemU(ii,vvv) = mean(sum(Mr2c3,2)); %Average cost for small station high utilization with flat demand charges 
%Mean_SmallHigh_TOUDemU(ii,vvv)=mean(sum(Mr3c3,2)); %Average cost for small station high utilization with TOU demand charges 

% Mean_LargeLow_NoDemU(ii) = mean(sum(Mr1c2,2)); %Average cost for large station low utilization no demand charges
% Mean_LargeLow_DemU(ii) = (mean(sum(Mr2c2,2))+mean(sum(Mr3c2,2)))/2 %Average cost for large station low utilization with demand charges (average on and off peak charging)
index2=index2+1;
end
index1=index1+1;
end

%4 Plugs 150 kW station
Mean_MedHigh_NoDemU=zeros(76,71);
Mean_MedHigh_DemU=zeros(76,71);
index1=1;
for ii=5:1:80
    index2=1;
for vvv=10:2:150
%%Inputs for Large Utilization Stations (Small and Large Station different
%%input needed

%On Peak Energy Profile for High Utilization Small Station assuming 600 kWh per day
w=300; %power demand
ww=ii; %kwh per charge  
%Recharge_Per_Day=16;
Recharge_Per_Day=vvv;
ScalingFactor=(Recharge_Per_Day*ww)/600;
tpatternkwh=[0 0 0 0 0 0 0 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 0 0]*ScalingFactor; 
myScript_High_onPeak
%Off Peak Energy Profile for High Utilization Small Station
tpatternkwh=[40 40 40 40 40 40 40 40 40 40 40 0 0 0 0 0 0 0 0 0 40 40 40 40]*ScalingFactor; 
myScript_High_offPeak

%%Program for creating bar graphs 

%matrices for high utilization small station
Matrix_H_S_on=[DMeanHighOnPeak,EMeanHighOnPeak,FMeanHighOnPeak];
Matrix_H_S_on_no=Matrix_H_S_on(1,:);
Matrix_H_S_on_flat=Matrix_H_S_on(2,:);
Matrix_H_S_on_TOU=Matrix_H_S_on(3,:);
Matrix_H_S_off=[DMeanHighOffPeak,EMeanHighOffPeak,FMeanHighOffPeak];
Matrix_H_S_off_no=Matrix_H_S_off(1,:);
Matrix_H_S_off_flat=Matrix_H_S_off(2,:);
Matrix_H_S_off_TOU=Matrix_H_S_off(3,:);
%fix inputs for stacked bar graph
Mr1c3=[Matrix_H_S_on_no;Matrix_H_S_off_no];
Mr2c3=[Matrix_H_S_on_flat;Matrix_H_S_off_flat];
Mr3c3=[Matrix_H_S_on_TOU;Matrix_H_S_off_TOU];

%% Summary cost
%%Summary cost based on utilization factor, charging # of daily
%%charges
% Mean_SmallLow_NoDemU(vvv) = mean(sum(Mr1c1,2)); %Average cost for small station low utilization no demand charges
% Mean_SmallLow_DemU(vvv) = (mean(sum(Mr2c1,2))+mean(sum(Mr3c1,2)))/2 %Average cost for small station low utilization with demand charges (average on and off peak charging)

Mean_MedHigh_NoDemU(index1,index2) = mean(sum(Mr1c3,2)); %Average cost for small station high utilization no demand charges
Mean_MedHigh_DemU(index1,index2) = (mean(sum(Mr2c3,2))+mean(sum(Mr3c3,2)))/2; %Average cost for small station high utilization with demand charges
%Mean_SmallHigh_FlatDemU(ii,vvv) = mean(sum(Mr2c3,2)); %Average cost for small station high utilization with flat demand charges 
%Mean_SmallHigh_TOUDemU(ii,vvv)=mean(sum(Mr3c3,2)); %Average cost for small station high utilization with TOU demand charges 

% Mean_LargeLow_NoDemU(ii) = mean(sum(Mr1c2,2)); %Average cost for large station low utilization no demand charges
% Mean_LargeLow_DemU(ii) = (mean(sum(Mr2c2,2))+mean(sum(Mr3c2,2)))/2 %Average cost for large station low utilization with demand charges (average on and off peak charging)
index2=index2+1;
end
index1=index1+1;
end

%12 Plugs 350 kW station
Mean_LargeHigh_NoDemU=zeros(76,55);
Mean_LargeHigh_DemU=zeros(76,55);
index1=1;
for ii=5:1:80
    index2=1;
for vvv=60:10:600
%%Inputs for Large Utilization Stations (Small and Large Station different
%%input needed

%On Peak Energy Profile for High Utilization Small Station assuming 600 kWh per day
w=2100; %power demand
ww=ii; %kwh per charge  
%Recharge_Per_Day=16;
Recharge_Per_Day=vvv;
ScalingFactor=(Recharge_Per_Day*ww)/600;
tpatternkwh=[0 0 0 0 0 0 0 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 0 0]*ScalingFactor; 
myScript_High_onPeak
%Off Peak Energy Profile for High Utilization Small Station
tpatternkwh=[40 40 40 40 40 40 40 40 40 40 40 0 0 0 0 0 0 0 0 0 40 40 40 40]*ScalingFactor; 
myScript_High_offPeak

%%Program for creating bar graphs 

%matrices for high utilization small station
Matrix_H_S_on=[DMeanHighOnPeak,EMeanHighOnPeak,FMeanHighOnPeak];
Matrix_H_S_on_no=Matrix_H_S_on(1,:);
Matrix_H_S_on_flat=Matrix_H_S_on(2,:);
Matrix_H_S_on_TOU=Matrix_H_S_on(3,:);
Matrix_H_S_off=[DMeanHighOffPeak,EMeanHighOffPeak,FMeanHighOffPeak];
Matrix_H_S_off_no=Matrix_H_S_off(1,:);
Matrix_H_S_off_flat=Matrix_H_S_off(2,:);
Matrix_H_S_off_TOU=Matrix_H_S_off(3,:);
%fix inputs for stacked bar graph
Mr1c3=[Matrix_H_S_on_no;Matrix_H_S_off_no];
Mr2c3=[Matrix_H_S_on_flat;Matrix_H_S_off_flat];
Mr3c3=[Matrix_H_S_on_TOU;Matrix_H_S_off_TOU];

%% Summary cost
%%Summary cost based on utilization factor, charging # of daily
%%charges
% Mean_SmallLow_NoDemU(vvv) = mean(sum(Mr1c1,2)); %Average cost for small station low utilization no demand charges
% Mean_SmallLow_DemU(vvv) = (mean(sum(Mr2c1,2))+mean(sum(Mr3c1,2)))/2 %Average cost for small station low utilization with demand charges (average on and off peak charging)

Mean_LargeHigh_NoDemU(index1,index2) = mean(sum(Mr1c3,2)); %Average cost for small station high utilization no demand charges
Mean_LargeHigh_DemU(index1,index2) = (mean(sum(Mr2c3,2))+mean(sum(Mr3c3,2)))/2; %Average cost for small station high utilization with demand charges
%Mean_SmallHigh_FlatDemU(ii,vvv) = mean(sum(Mr2c3,2)); %Average cost for small station high utilization with flat demand charges 
%Mean_SmallHigh_TOUDemU(ii,vvv)=mean(sum(Mr3c3,2)); %Average cost for small station high utilization with TOU demand charges 

% Mean_LargeLow_NoDemU(ii) = mean(sum(Mr1c2,2)); %Average cost for large station low utilization no demand charges
% Mean_LargeLow_DemU(ii) = (mean(sum(Mr2c2,2))+mean(sum(Mr3c2,2)))/2 %Average cost for large station low utilization with demand charges (average on and off peak charging)
index2=index2+1;
end
index1=index1+1;
end

set(0,'defaultuicontrolfontname','Arial');
set(0,'defaultuicontrolfontsize',24);
set(0,'defaultaxesfontname','Arial');
set(0,'defaultaxesfontsize',18);
set(0,'defaulttextfontname','Arial');
set(0,'defaulttextfontsize',24);
set(0,'defaultlegendfontname','Arial');
set(0,'defaultlegendfontsize',24);

figure4 = figure('Color',[1 1 1]);
set(figure4, 'Position', [500 500 1500*1.618 800])
subplot1 = subplot(1,3,1,'Parent',figure4);
hold(subplot1,'on');
surf([1:1:32], [5:1:80], Mean_SmallHigh_DemU)
set(subplot1,'CLim',[0 2.5]);
colormap(jet(50))
xlim(subplot1,[0 32]);
ylim(subplot1,[5 80]);
zlim(subplot1,[0 2.5]);
xlabel(['Charging Events';'    per Day    '],'HorizontalAlignment','center');
ylabel([' Average Energy per ';'Charging Event [kWh]'],'HorizontalAlignment','center');
zlabel('Average Electricity Cost [$/kWh]')
title('1 Plugs - 50 kW')
view(subplot1,[118.5 13.2]);
grid(subplot1,'on');
colorbar('peer',subplot1);

subplot2 = subplot(1,3,2,'Parent',figure4);
hold(subplot2,'on');
surf([10:1:150], [5:1:80], Mean_MedHigh_DemU)
set(subplot2,'CLim',[0.08 2.5]);
colormap(jet(35))
xlim(subplot2,[10 120]);
ylim(subplot2,[5 80]);
zlim(subplot2,[0 2.5]);
xlabel(['Charging Events';'    per Day    '],'HorizontalAlignment','center');
ylabel([' Average Energy per ';'Charging Event [kWh]'],'HorizontalAlignment','center');
zlabel('Average Electricity Cost [$/kWh]')
title('4 Plugs - 150 kW')
view(subplot2,[118.5 13.2]);
grid(subplot2,'on');
set(subplot2,'CLim',[0 2.5]);
colorbar('peer',subplot2);

subplot3 = subplot(1,3,3,'Parent',figure4);
hold(subplot3,'on');
surf([60:5:600], [5:1:80], Mean_LargeHigh_DemU)
set(subplot3,'CLim',[0 2.5]);
colormap(jet(35))
xlim(subplot3,[60 600]);
ylim(subplot3,[5 80]);
zlim(subplot3,[0 2.5]);
xlabel(['Charging Events';'    per Day    '],'HorizontalAlignment','center');
ylabel([' Average Energy per ';'Charging Event [kWh]'],'HorizontalAlignment','center');
zlabel('Average Electricity Cost [$/kWh]')
title('12 Plugs - 350 kW')
view(subplot3,[118.5 13.2]);
grid(subplot3,'on');
% Set the remaining axes properties
set(subplot3,'CLim',[0 2.5]);
% Create colorbar
c1=colorbar('peer',subplot3,'Position',[0.94455500618047 0.10875 0.00824062628759781 0.815],'LineWidth',1);
x1 = get(subplot3, 'position'); % get axes position
cw1= get(c1, 'Position'); % Colorbar Width for c1
x1(3)=0.015;
set(c1,'Position',x1)
set(gca,'position',x1)
set(c1,'YTick',[0:0.25:2.5])


%Distribution
%scenario 1
w=50; %kW of usage per plug per charge in the case of 1 charger
ww=8.8; %kWh per charging event
t=ww/w; % percentage of the hour that corresponds to DCFC charging (0.4= 20kWh/50kw)
myScript %runs low utilization 1 charger only case on peak
Gscen1n=gisIDN;
scen1n=TC1n;
myScript_offPeak %runs low utilization 1 charger only case off peak
Gscen1on=gisIDN;
scen1on=TC1on;
figure
subplot(2,3,1)
histogram(TC1n, 'BinWidth', 0.015)
xlabel('Electricity Cost [$/kWh]')
ylabel('Frequency')
xlim([0 1])
title('Scenario 1')
hold on
histogram(TC1on, 'BinWidth', 0.015)
ylim([0 1400])
%scenario 2
w=50; %power demand
ww=8.8;
Recharge_Per_Day=16;
ScalingFactor=(Recharge_Per_Day*ww)/600;
tpatternkwh=[0 0 0 0 0 0 0 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 0 0]*ScalingFactor;
myScript_High_onPeak
scen2n=TC3n;
Gscen2n=gisIDN;
%Off Peak Energy Profile for High Utilization Small Station
tpatternkwh=[40 40 40 40 40 40 40 40 40 40 40 0 0 0 0 0 0 0 0 0 40 40 40 40]*ScalingFactor;
myScript_High_offPeak
scen2on=TC3on;
Gscen2on=gisIDN;
subplot(2,3,2)
histogram(TC3n, 'BinWidth', 0.015)
xlabel('Average Electricity Cost [$/kWh]')
ylabel('Frequency')
xlim([0 1])
title('Scenario 2')
hold on
histogram(TC3on, 'BinWidth', 0.015)
ylim([0 1400])
%scenario 3
w=600; %kW  power
ww=38; %kwh per charge
at=48; %number of charges per day
myScript_LStation %runs low utilization more chargers on peak
scen3n=TC2n;
Gscen3n=gisIDN;
myScript_LStation_offPeak %runs low utilization more chargers off peak
scen3on=TC2on;
Gscen3on=gisIDN;
subplot(2,3,3)
histogram(TC2n, 'BinWidth', 0.015)
xlabel('Electricity Cost [$/kWh]')
ylabel('Frequency')
xlim([0 1])
title('Scenario 3')
hold on
histogram(TC2on, 'BinWidth', 0.015)
ylim([0 1400])
%scenario 4
w=400; %kW of usage per plug per charge in the case of 1 charger
ww=47; %kWh per charging event
t=ww/w; % percentage of the hour that corresponds to DCFC charging (0.4= 20kWh/50kw)
myScript %runs low utilization 1 charger only case on peak
scen4n=TC1n;
Gscen4n=gisIDN;
myScript_offPeak
scen4on=TC1on;
Gscen4on=gisIDN;
subplot(2,3,4)
histogram(TC1n, 'BinWidth', 0.015)
hold on
histogram(TC1on, 'BinWidth', 0.015)
xlabel('Electricity Cost [$/kWh]')
ylabel('Frequency')
xlim([0 1])
title('Scenario 4')
hold on
ylim([0 1400])
%scenario 5
w=400*10; %power demand
ww=80;
Recharge_Per_Day=500;
ScalingFactor=(Recharge_Per_Day*ww)/25200;
tpatternkwh=[4200 4200 4200 4200 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4200 4200]*ScalingFactor;  %charging energy profile
myScript_High_offPeakL
scen5on=TC4on;
Gscen5on=gisIDN;
%On Peak Energy Profile for High Utilization Large Station
tpatternkwh=[0 0 0 0 0 0 0 0 0 0 0 0 4200 4200 4200 4200 4200 4200 0 0 0 0 0 0]*ScalingFactor;  %charging energy profile
myScript_High_onPeakL
scen5n=TC4n;
Gscen5n=gisIDN;
subplot(2,3,5)
histogram(TC4n, 'BinWidth', 0.015)
hold on
histogram(TC4on, 'BinWidth', 0.015)
xlabel('Electricity Cost [$/kWh]')
ylabel('Frequency')
xlim([0 1])
title('Scenario 5')
hold off
ylim([0 1400])
