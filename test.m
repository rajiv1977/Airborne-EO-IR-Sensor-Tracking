%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;

parameter;
EOIR_Tracking

[p,t,s]      = EOIR_Tracking.get_target_models(pro,target,sensor);
[p,t,s]      = EOIR_Tracking.get_sensor_models(p,t,s);

mcr.X = zeros(1,p.duration);
mcr.Y = zeros(1,p.duration);
for i=1:1:p.mcr
    i
    [p,t,s]      = EOIR_Tracking.generate_target_truth(p,t,s);
    [p,t,s]      = EOIR_Tracking.generate_sensor_path(p,t,s);
    
    [p,t,s]      = EOIR_Tracking.generate_target_measurement(p,t,s);
    [p,t,s]      = EOIR_Tracking.generate_measurement_set(p,t,s);
    
    [x_hat,P_hat]= EOIR_Tracking.EKF(p,t,s);
    
    for jj=1:1:length(x_hat.loop)
        X(jj) = x_hat.loop(jj).m_update(1);
        Y(jj) = x_hat.loop(jj).m_update(3);
    end  
    mcr.X = mcr.X + X;
    mcr.Y = mcr.Y + Y;
    
end
X = mcr.X/p.mcr;
Y = mcr.Y/p.mcr;

EOIR_Tracking.plot_meas(s);
EOIR_Tracking.plot_target_truth_and_sensor(t,s,X,Y);











