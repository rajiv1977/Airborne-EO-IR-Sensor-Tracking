%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
classdef EOIR_Tracking
    
    properties
        
    end
    
    methods(Static)
       
        X = set_CV_models(X,T,p_noise);
        X = set_EOIR_models(X,T,p_noise);
        X = set_CT_models(X, T, p_noise, w, w_noise);
        [Z, LnZ] = getZ(X,Y,s,p,t);
        [J] = get_PCRLB(p,t,s);
        [p,t,s] = get_target_models(p,t,s);
        [p,t,s] = get_sensor_models(p,t,s);
        [p,t,s] = generate_target_truth(p,t,s);
        [p,t,s] = generate_target_measurement(p,t,s);
        [p,t,s] = generate_sensor_path(p,t,s);
        [p,t,s] = generate_measurement_set(p,t,s);
        [temp_truth, temp] = generate_CV_truth(temp_truth, temp, X , sample_T );
        [temp_truth, temp] = generate_CV_EOIR_truth(temp_truth, temp, X , sample_T );
        [temp_truth, temp] = generate_CT_truth( temp_truth , temp , X , T ); 
        [m,p] = EKF(p,t,s);
        plot_target_truth_and_sensor(t,s,X,Y);
        plot_meas(s);
          
    end
    
end

