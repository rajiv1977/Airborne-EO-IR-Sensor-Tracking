%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [p,t,s] = generate_sensor_path(p,t,s)

% For all sensors
for i=1 : s.no_of_sensors
    temp = s.sensor_no(i).initial_state ;
    temp_truth = [ s.sensor_no(i).start_time , temp' ] ;
    
    % For all legs
    for j=1 : length(s.sensor_no(i).leg)
        
        switch s.sensor_no(i).leg(j).model
            
            case 'CONSTANT VELOCITY'
                [temp_truth, temp] = EOIR_Tracking.generate_CV_truth(temp_truth, temp, s.sensor_no(i).leg(j),p.sampling_time);
            case 'CONSTANT TURN'
                [temp_truth, temp] = EOIR_Tracking.generate_CT_truth(temp_truth, temp, s.sensor_no(i).leg(j), p.sampling_time);
            case 'STATIONARY'
                [temp_truth, temp] = EOIR_Tracking.generate_STAND_truth(temp_truth, temp, s.sensor_no(i).leg(j));
            otherwise
                disp('No model found');
                
        end % end of switch
        
    end
    s.sensor_no(i).truth = temp_truth ;
end % end of all sensors


end