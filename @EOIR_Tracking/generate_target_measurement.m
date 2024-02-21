%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [p,t,s] = generate_target_measurement(p,t,s)

% For all sensors
for l=1 : s.no_of_sensors
    temp_meas = [ ] ;
    
    true_BE_grid = [];
    
    % For all time steps
    T = s.sensor_no(l).start_time ;
    
    for j=s.sensor_no(l).start_time : length(s.sensor_no(l).truth(:,1)) % j=0 ; initial time
        
        % For all targets
        for i=1 : t.no_of_targets
            
            t_row_no = find(t.target_no(i).truth(:,1)==T);
            
            if ~isempty(t_row_no)
                
                s_row_no = find(s.sensor_no(l).truth(:,1)==T);
                
                x = t.target_no(i).truth(t_row_no,2)-s.sensor_no(l).truth(s_row_no,2) ;
                y = t.target_no(i).truth(t_row_no,4)-s.sensor_no(l).truth(s_row_no,4) ;
                
                %bearing = atan2(y,x) + sqrt(s.sensor_no(l).m_noise_variance)*randn ;
                eA = s.sensor_no(l).alt/sqrt(x^2 + y^2);
                %elevation = atan(eA) + sqrt(s.sensor_no(l).m_noise_variance)*randn;
                
                
                OY = [atan2(y,x); atan(eA)] + [s.sensor_no(l).d 0; 0 s.sensor_no(l).d]*...
                    [s.sensor_no(l).FOV(1)/s.sensor_no(l).resolution(1) 0; 0 s.sensor_no(l).FOV(2)/s.sensor_no(l).resolution(2)]*...
                    [sqrt(s.sensor_no(l).m_noise_variance)*randn; sqrt(s.sensor_no(l).m_noise_variance)*randn];
             
                temp_meas = [ temp_meas ; [ T , i , OY(1), OY(2)] ] ;
                
                true_BE_grid = [ true_BE_grid ; [ T , i , atan2(y,x), atan(eA)] ] ;
                
            end
            
        end
        T = T + p.sampling_time ;
    end
    
    s.sensor_no(l).measurement = temp_meas ;
    s.sensor_no(l).true_bea_ele_grid  = true_BE_grid ;
    
end

end