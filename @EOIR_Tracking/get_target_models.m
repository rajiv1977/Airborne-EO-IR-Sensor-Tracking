%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [p,t,s] = get_target_models(p,t,s)

for i = 1 : t.no_of_targets
    
    % For all target motion legs
    for j=1 : t.target_no(i).no_of_legs
        
        switch t.target_no(i).leg(j).model
            case 'CONSTANT VELOCITY'
                [t.target_no(i).leg(j)] = EOIR_Tracking.set_CV_models( t.target_no(i).leg(j), p.sampling_time, t.target_no(i).leg(j).p_noise_variance);
            case 'CONSTANT VELOCITY EOIR'
                [t.target_no(i).leg(j)] = EOIR_Tracking.set_EOIR_models( t.target_no(i).leg(j), p.sampling_time, t.target_no(i).leg(j).p_noise_variance);
            case 'CONSTANT TURN'
                [t.target_no(i).leg(j)] = EOIR_Tracking.set_CT_models( t.target_no(i).leg(j), p.sampling_time, t.target_no(i).leg(j).p_noise_variance, t.target_no(i).leg(j).angular_rate, t.target_no(i).leg(j).turn_rate_noise_variance);
            otherwise
                disp('No model found');
                
        end % end of switch
        
    end % end of legs
    
end % end of all targets

end