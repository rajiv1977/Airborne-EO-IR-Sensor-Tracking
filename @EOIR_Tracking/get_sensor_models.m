%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [p,t,s] = get_sensor_models(p,t,s)

for i = 1 : s.no_of_sensors
    
    % For all sensor motion legs
    for j= 1 : s.sensor_no(i).no_of_legs
        
        switch s.sensor_no(i).leg(j).model
            
            case 'CONSTANT VELOCITY'
                [s.sensor_no(i).leg(j)] = EOIR_Tracking.set_CV_models( s.sensor_no(i).leg(j), p.sampling_time, s.sensor_no(i).leg(j).p_noise_variance);
            case 'CONSTANT TURN'
                [s.sensor_no(i).leg(j)] = EOIR_Tracking.set_CT_models( s.sensor_no(i).leg(j), p.sampling_time, s.sensor_no(i).leg(j).p_noise_variance, s.sensor_no(i).leg(j).angular_rate, s.sensor_no(i).leg(j).turn_rate_noise_variance);
            otherwise
                disp('No model found');
                
        end % end of switch
        
    end % end of legs
    
end % end of all sensors


end