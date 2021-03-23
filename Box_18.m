function F = Box_18(X1,X2,X3)
% X1:4 - data; Name1 - name of the distribution

group10 = [zeros(length(X1(:,1)),1)',ones(length(X1(:,2)),1)',...
    zeros(length(X1(:,1)),1)'+2,zeros(length(X1(:,2)),1)'+3,...
    zeros(length(X3(:,1)),1)'+4,zeros(length(X3(:,2)),1)'+5];
group50 = [zeros(length(X2(:,1)),1)'+6,zeros(length(X2(:,2)),1)'+7,...
    zeros(length(X3(:,1)),1)'+8,zeros(length(X3(:,2)),1)'+9,...
    zeros(length(X3(:,1)),1)'+10,zeros(length(X3(:,2)),1)'+11];
group90 = [zeros(length(X3(:,1)),1)'+12,zeros(length(X3(:,2)),1)'+13,...
    zeros(length(X3(:,1)),1)'+14,zeros(length(X3(:,2)),1)'+15,...
    zeros(length(X3(:,1)),1)'+16,zeros(length(X3(:,2)),1)'+17];



group =[group10 group50 group90];

D = 0.25;
positions = [D*5 D*6 D*7 D*8 D*9 D*10 D*12 D*13 D*14 D*15 D*16 D*17 D*19 D*20 D*21 D*22 D*23 D*24];

X1 = reshape(X1,[],1);X2 = reshape(X2,[],1);X3 = reshape(X3,[],1);


X = [X1' X2' X3'];

% difference
figure;

hB = boxplot(X,group, 'positions', positions,'Color','kkkkkkkkkkkkkkkkkk','symbol','');
h = findobj(gca,'Tag','Box');

Hatch_fill2(h,[1,7,13],'b','single',90,'w',1,1)
Hatch_fill2(h,[2,8,14],'b','cross',90,'w',1,0.5)
Hatch_fill2(h,[3,9,15],'m','single',45,'w',1,1)
Hatch_fill2(h,[4,10,16],'m','cross',45,'w',1,1)
Hatch_fill2(h,[5,11,17],'r','single',135,'w',1,1)
Hatch_fill2(h,[6,12,18],'r','fill',0,'w',1,1)

hB = boxplot(X,group, 'positions', positions,'Color','kkkkkkkkkkkkkkkkkk','symbol','');
lw = 1.5;
set(gca,'fontsize',14,'FontWeight','bold','FontName', 'Times');
set(hB,'linew',lw);

set(gca,'xTick',[1.875,3.625,5.375])
% Tick = cellstr(num2str(Percentile));
set(gca,'xTickLabel',{'90','95','99'})


ylabel('\bf\it{R_P}','fontsize',14,'FontWeight',...
    'bold','FontName', 'Times');

% title(strcat(Name1));
set(gca,'fontsize',14,'FontWeight','bold','FontName', 'Times')
xlabel('Percentile','fontsize',14,'FontWeight','bold','FontName', 'Times')
% xtickangle(45)

[hLegend,objh,~] = legend(findall(gca,'Tag','Box'),...
    {'C-Moment: Load - 2.5 kN','L-Moment: Load - 2.5 kN',...
    'C-Moment: Load - 4 kN','L-Moment: Load - 4 kN',...
    'C-Moment: Load - 7 kN','L-Moment: Load - 7 kN','Ideal'},'numcolumns',2);

% set(objh,'linewidth',1.5);
% hChildren = findall(get(hLegend,'Children'), 'Type','Line');
set(gca,'fontsize',14,'FontWeight','bold','FontName', 'Times')

for j = 1:18
    lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
    set(lines(j), 'Color', 'w','LineStyle','-','LineWidth',1.5);
end
ylim([0.7 3.7])

line([2.75,2.75],ylim,'Color','k','LineWidth',0.5,'LineStyle','--')
line([4.5,4.5],ylim,'Color','k','LineWidth',0.5,'LineStyle','--')
% line([3,3],ylim,'Color','k','LineWidth',0.5,'LineStyle','--')
line(xlim,[1,1],'Color','k','LineWidth',1.5,'LineStyle',':')