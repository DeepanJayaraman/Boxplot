function F = Box_8(X1,X2,Percentile)
% X1:2 - data; 

group10 = [zeros(length(X1(:,1)),1)',ones(length(X1(:,2)),1)',zeros(length(X1(:,3)),1)'+2,...
    zeros(length(X1(:,4)),1)'+3];
group90 = [zeros(length(X2(:,1)),1)'+4,zeros(length(X2(:,2)),1)'+5,zeros(length(X2(:,3)),1)'+6,...
    zeros(length(X2(:,4)),1)'+7];




group =[group10 group90];


positions = [1.25 1.5 1.75 2 2.5 2.75 3 3.25];



X1 = reshape(X1,[],1);X2 = reshape(X2,[],1);


X = [X1' X2'];

% difference
figure;

hB = boxplot(X,group, 'positions', positions,'Color','kkkkkkkkkkkk','symbol','');
h = findobj(gca,'Tag','Box');
for j=[1,5] % it ll take revesre order
    hP = patch(get(h(j),'XData'),get(h(j),'YData'),'g','FaceAlpha',.5,'EdgeColor','none');
    
    % Get patch objects
    hPatch2 = findobj(hP, 'Type', 'patch');
    
    % Apply Hatch Fill
    
    patch(get(h(j),'XData'),get(h(j),'YData'),'b','FaceAlpha',1,'EdgeColor','none');
    hold on
    hh2 = hatchfill(hPatch2, 'single', 45, 2,'none','w');
    
end

for j=[2,6]
    hP = patch(get(h(j),'XData'),get(h(j),'YData'),'g','FaceAlpha',.5,'EdgeColor','none');
    
    % Get patch objects
    hPatch2 = findobj(hP, 'Type', 'patch');
    patch(get(h(j),'XData'),get(h(j),'YData'),'b','FaceAlpha',1,'EdgeColor','none');
    
end

for j=[3,7] % it ll take revesre order
    hP = patch(get(h(j),'XData'),get(h(j),'YData'),'g','FaceAlpha',.5,'EdgeColor','none');
    
    % Get patch objects
    hPatch2 = findobj(hP, 'Type', 'patch');
    
    % Apply Hatch Fill
    
    patch(get(h(j),'XData'),get(h(j),'YData'),'k','FaceAlpha',1,'EdgeColor','none');
    hold on
    hh2 = hatchfill(hPatch2, 'single', 45, 2,'none','w');
    
end

for j=[4,8] % it ll take revesre order
    hP = patch(get(h(j),'XData'),get(h(j),'YData'),'k','FaceAlpha',1,'EdgeColor','none');
end

hB = boxplot(X,group, 'positions', positions,'Color','kkkkkkkk','symbol','');
lw = 1.5;
set(gca,'fontsize',14,'FontWeight','bold','FontName', 'Times');
set(hB,'linew',lw);

set(gca,'xTick',[1.625,2.8750])
Tick = cellstr(num2str(Percentile));
set(gca,'xTickLabel',{char(Tick(1)),char(Tick(2))})

ylabel('\bf{Ratio}','fontsize',14,'FontWeight',...
    'bold','FontName', 'Times');

% title(strcat(Name1));
set(gca,'fontsize',14,'FontWeight','bold','FontName', 'Times')
xlabel('Percentile','fontsize',14,'FontWeight','bold','FontName', 'Times')
% xtickangle(45)

% [hLegend,objh,~] = legend(findall(gca,'Tag','Box'),...
%     {'C-Moment','L-Moment',...
%     'C-Moment: With extreme','L-Moment: With extreme','Ideal'});

% set(objh,'linewidth',1.5);
% hChildren = findall(get(hLegend,'Children'), 'Type','Line');
set(gca,'fontsize',14,'FontWeight','bold','FontName', 'Times')
for j = 1:16
    lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
    set(lines(j), 'Color', 'w','LineStyle',':');
end
% ylim([0.6 1.4])

line([2.25,2.25],ylim,'Color','k','LineWidth',0.5,'LineStyle','--')
line([3.5,3.5],ylim,'Color','k','LineWidth',0.5,'LineStyle','--')
line([4.75,4.75],ylim,'Color','k','LineWidth',0.5,'LineStyle','--')
line(xlim,[1,1],'Color','k','LineWidth',1.5,'LineStyle',':')
