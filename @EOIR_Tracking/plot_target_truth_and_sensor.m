%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plot_target_truth_and_sensor(t,s,X,Y)
parameter;

figure(5) ;
for i=1 : t.no_of_targets
    temp_plot = [ ] ;
    for j=1 : length(s.sensor_no(1).truth(:,1))
        T = s.sensor_no(1).truth(j,1) ;
        t_row = find( t.target_no(i).truth(:,1)==T ) ;
        if ~isempty(t_row)
            temp_plot = [ temp_plot , [t.target_no(i).truth(t_row,2);t.target_no(i).truth(t_row,4)] ];
        end
    end
    
    alt1 = ones(1,length(temp_plot))*0;
    plot3( temp_plot(1,:),temp_plot(2,:),alt1, 'black');
    hold on
end

% For all sensors
for i=1 : s.no_of_sensors
    temp_plot = [ ];
    for j=1 : length(s.sensor_no(i).truth(:,1))
        temp_plot = [ temp_plot , [s.sensor_no(i).truth(j,2);s.sensor_no(i).truth(j,4)] ];
    end
    
    alt2 = ones(1,length(temp_plot))*s.sensor_no(i).alt;
    plot3(temp_plot(1,:),temp_plot(2,:),alt2, 'red');
    hold on
end


legend('Target Position','Sensor Position');
xlabel('X-Position (m)');
ylabel('Y-Position (m)');
zlabel('Z-Position (m)');

alt1 = ones(length(t.target_no.truth),1)*0;
alt2 = ones(length(t.target_no.truth),1)*s.sensor_no(1).alt;
figure(6)
plot3(t.target_no.truth(:,2),t.target_no.truth(:,4),alt1,'black');
hold on;
plot3(s.sensor_no(1).truth(:,2),s.sensor_no(1).truth(:,4),alt2,'red');
hold on;
plot3(X,Y,alt1,'blue');
hold off;
legend('Target Position','Sensor Position','Estimated Target Position');
xlabel('X-Position (m)');
ylabel('Y-Position (m)');
zlabel('Z-Position (m)');


end

