%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [p,t,s] = generate_measurement_set(p,t,s)

% For all sensors
for l=1 : s.no_of_sensors
    
    temp = [] ;
   
    % For all time steps
    T = s.sensor_no(l).truth(1,1) ;
    
    for j = 1 : length(s.sensor_no(l).measurement(:,1))
        
        % For all targets
        rows = find(s.sensor_no(l).measurement(:,1)== T );
        
        if ~isempty(rows)
            for r=1 : length(rows)
                
                if s.sensor_no(l).PD >= rand
                    
                    temp = [ temp ; s.sensor_no(l).measurement(rows(r),:) ] ;
                    
                end
            end
        end
        % Generate and add false alarms
        for k=1 : get_no_of_FA()
            
            fa_bea = s.sensor_no(l).bearing_range(1) + ( s.sensor_no(l).bearing_range(2)-s.sensor_no(l).bearing_range(1) )*rand ;
            fa_elv = s.sensor_no(l).elevation_range(1) + ( s.sensor_no(l).elevation_range(2)-s.sensor_no(l).elevation_range(1) )*rand ;
            temp = [ temp ; [ T , 0 , fa_bea, fa_elv ] ] ;
            
        end
        
        T = T + p.sampling_time ;
    end % end of time step
    
    s.sensor_no(l).measurement_set          = temp ;
    
end % end of all sensors

    function x = get_no_of_FA()
        V = 2*pi ;
        x = poissrnd(V*s.sensor_no(l).PFA);
        
        
    end % end of function get_no_of_FA

end % end of function generate_measurement_set