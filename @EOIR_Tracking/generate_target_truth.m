%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [p,t,s] = generate_target_truth(p,t,s)

% For all targets
for i=1 : t.no_of_targets
    
    temp = t.target_no(i).initial_state ;
    temp_truth = [ t.target_no(i).start_time , temp' ] ;
    
    % For all legs
    for j=1 : t.target_no(i).no_of_legs
        
        switch t.target_no(i).leg(j).model
            
            case 'CONSTANT VELOCITY'
                [temp_truth, temp] = EOIR_Tracking.generate_CV_truth(temp_truth, temp, t.target_no(i).leg(j),p.sampling_time);
            case 'CONSTANT VELOCITY EOIR'
                [temp_truth, temp] = EOIR_Tracking.generate_CV_EOIR_truth(temp_truth, temp, t.target_no(i).leg(j),p.sampling_time);
            case 'CONSTANT TURN'
                [temp_truth, temp] = EOIR_Tracking.generate_CT_truth(temp_truth, temp, t.target_no(i).leg(j), p.sampling_time);
            case 'STATIONARY'
                disp('No target with stationary')
            otherwise
                disp('No model found');
                
        end % end of switch
        
    end
    
    t.target_no(i).truth = temp_truth ;
end

end