%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%             rajiv.sithiravel@gmail.com and Bhashyam.Balaji@drdc-rddc.gc.ca                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plot_meas(s)

pp = s.sensor_no(1).measurement_set;
[r1,c1] = find(pp(:,2)==1);
ppp = pp(r1,:);
pp(r1,:)=[];

% figure(1);
% plot(ppp(:,1),ppp(:,3),'bo','LineWidth',2,'MarkerEdgeColor','b','MarkerSize',2)
% hold on
% plot(pp(:,1),pp(:,3),'r.','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',10)
% hold off;
% legend('Target generated measurement','False alarm generated measurement');
% xlabel('Time (sec)');
% ylabel('Bearing (rad)');

figure(1);
plot(ppp(:,1),ppp(:,3),'bo','LineWidth',2,'MarkerEdgeColor','b','MarkerSize',2)
legend('Target generated measurement');
xlabel('Time (sec)');
ylabel('Bearing (rad)');

% figure(2);
% plot(ppp(:,1),ppp(:,4),'bo','LineWidth',2,'MarkerEdgeColor','b','MarkerSize',2)
% hold on;
% plot(pp(:,1),pp(:,4),'r.','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',10)
% hold off;
% legend('Target generated measurement','False alarm generated measurement');
% xlabel('Time (sec)');
% ylabel('Elevation  (rad)');

figure(2);
plot(ppp(:,1),ppp(:,4),'bo','LineWidth',2,'MarkerEdgeColor','b','MarkerSize',2)
legend('Target generated measurement');
xlabel('Time (sec)');
ylabel('Elevation  (rad)');

% rf1 = find(pp(:,1)==frame_no);
% ele1 = pp(rf1,3);
% ele2 = pp(rf1,4);
% 
% figure(3)
%  plot(ppp(frame_no,3),ppp(frame_no,4),'b^','LineWidth',2,...
%                        'MarkerEdgeColor','b',...
%                        'MarkerFaceColor','b',...
%                        'MarkerSize',6);
% hold on;
% %for i=1:1:length(ele1)
%  plot(ele1,ele2,'k^','LineWidth',2,...
%                        'MarkerEdgeColor','k',...
%                        'MarkerFaceColor','k',...
%                        'MarkerSize',6);
% %hold on;
% %end
% hold off
% legend('Target generated measurement','False alarm generated measurement');
% xlabel('Bearing (deg)');
% ylabel('Elevation (deg)');


% figure(4)
% %  plot(hh(:,3),hh(:,4),'b^','LineWidth',2,...
% %                        'MarkerEdgeColor','b',...
% %                        'MarkerFaceColor','b',...
% %                        'MarkerSize',6);
% % hold on;
% plot(ppp(:,3),ppp(:,4),'k^','LineWidth',2,...
%                        'MarkerEdgeColor','k',...
%                        'MarkerFaceColor','k',...
%                        'MarkerSize',6);
% hold on;
% plot(pp(:,3),pp(:,4),'r^','LineWidth',2,...
%                        'MarkerEdgeColor','r',...
%                        'MarkerFaceColor','r',...
%                        'MarkerSize',6);
% hold off;
% %legend('True target measurement','Target generated measurement', 'False alarm generated measurement');
% legend('Target generated measurement', 'False alarm generated measurement');
% xlabel('Bearing (deg)');
% ylabel('Elevation (deg)');

figure(4)
%  plot(hh(:,3),hh(:,4),'b^','LineWidth',2,...
%                        'MarkerEdgeColor','b',...
%                        'MarkerFaceColor','b',...
%                        'MarkerSize',6);
% hold on;
plot(ppp(:,3),ppp(:,4),'k^','LineWidth',2,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','k',...
                       'MarkerSize',6);

hold off;
%legend('True target measurement','Target generated measurement', 'False alarm generated measurement');
legend('Target generated measurement');
xlabel('Bearing (rad)');
ylabel('Elevation (rad)');

end