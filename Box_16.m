function F = Box_16(X1,X2,X3,X4,Name1)
% X1:4 - data; Name1 - name of the distribution

group10 = [zeros(length(X1(:,1)),1)',ones(length(X1(:,2)),1)',zeros(length(X1(:,3)),1)'+2,...
    zeros(length(X1(:,4)),1)'+3];
group25 = [zeros(length(X2(:,1)),1)'+4,zeros(length(X2(:,2)),1)'+5,zeros(length(X2(:,3)),1)'+6,...
    zeros(length(X2(:,4)),1)'+7];
group50 = [zeros(length(X3(:,1)),1)'+8,zeros(length(X3(:,2)),1)'+9,zeros(length(X3(:,3)),1)'+10,...
    zeros(length(X3(:,4)),1)'+11];
group100 = [zeros(length(X4(:,1)),1)'+12,zeros(length(X4(:,2)),1)'+13,zeros(length(X4(:,3)),1)'+14,...
    zeros(length(X4(:,4)),1)'+15];


group =[group10 group25 group50 group100];


positions = [1.25 1.5 1.75 2 2.5 2.75 3 3.25 3.75 4 4.25 4.5 5 5.25 5.5 5.75];



X1 = reshape(X1,[],1);X2 = reshape(X2,[],1);X3 = reshape(X3,[],1);X4 = reshape(X4,[],1);


X = [X1' X2' X3' X4'];

% difference
figure;

hB = boxplot(X,group, 'positions', positions,'Color','kkkkkkkkkkkkkkkk','symbol','');
h = findobj(gca,'Tag','Box');
for j=[1,5,9,13] % it ll take revesre order
    hP = patch(get(h(j),'XData'),get(h(j),'YData'),'g','FaceAlpha',.5,'EdgeColor','none');
    
    % Get patch objects
    hPatch2 = findobj(hP, 'Type', 'patch');
    
    % Apply Hatch Fill
    
    patch(get(h(j),'XData'),get(h(j),'YData'),'b','FaceAlpha',1,'EdgeColor','none');
    hold on
    hh2 = hatchfill(hPatch2, 'single', 60, 2,'none','w');
    
end

for j=[2,6,10,14]
    hP = patch(get(h(j),'XData'),get(h(j),'YData'),'g','FaceAlpha',.5,'EdgeColor','none');
    
    % Get patch objects
    hPatch2 = findobj(hP, 'Type', 'patch');
    patch(get(h(j),'XData'),get(h(j),'YData'),'b','FaceAlpha',1,'EdgeColor','none');
    
end

for j=[3,7,11,15] % it ll take revesre order
    hP = patch(get(h(j),'XData'),get(h(j),'YData'),'g','FaceAlpha',.5,'EdgeColor','none');
    
    % Get patch objects
    hPatch2 = findobj(hP, 'Type', 'patch');
    
    % Apply Hatch Fill
    
    patch(get(h(j),'XData'),get(h(j),'YData'),'k','FaceAlpha',1,'EdgeColor','none');
    hold on
    hh2 = hatchfill(hPatch2, 'single', 60, 2,'none','w');
    
end

for j=[4,8,12,16] % it ll take revesre order
    hP = patch(get(h(j),'XData'),get(h(j),'YData'),'k','FaceAlpha',1,'EdgeColor','none');
end

hB = boxplot(X,group, 'positions', positions,'Color','kkkkkkkkkkkk','symbol','');
lw = 1.5;
set(gca,'fontsize',14,'FontWeight','bold','FontName', 'Times');
set(hB,'linew',lw);

set(gca,'xTick',[1.5,2.8750, 4.1250, 5.3750])
set(gca,'xTickLabel',{'10','25','50','100'})

ylabel('\it{R_P}','fontsize',14,'FontWeight',...
    'bold','FontName', 'Times');

% title(strcat(Name1));
set(gca,'fontsize',14,'FontWeight','bold','FontName', 'Times')
xlabel('Sample size','fontsize',14,'FontWeight','bold','FontName', 'Times')
% xtickangle(45)

[hLegend,objh,~] = legend(findall(gca,'Tag','Box'),...
    {'C-Moment','L-Moment',...
    'C-Moment: With extreme','L-Moment: With extreme','Ideal'});

set(objh,'linewidth',1.5);
% hChildren = findall(get(hLegend,'Children'), 'Type','Line');
set(gca,'fontsize',14,'FontWeight','bold','FontName', 'Times')
for j = 1:16
    lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
    set(lines(j), 'Color', 'w','LineStyle',':');
end
% ylim([-0.05 0.55])

line([2.25,2.25],ylim,'Color','k','LineWidth',0.5,'LineStyle','--')
line([3.5,3.5],ylim,'Color','k','LineWidth',0.5,'LineStyle','--')
line([4.75,4.75],ylim,'Color','k','LineWidth',0.5,'LineStyle','--')
line(xlim,[1,1],'Color','k','LineWidth',0.5,'LineStyle','-.')