%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function X = set_EOIR_models(X,T,p_noise)

X.F = [ 1  T  0  0 ;
        0  1  0  0 ;
        0  0  1  T ;
        0  0  0  1 ] ;
X.Q = [0.005*T^3        0.005*T^2           0           0       ;
       0.005*T^2        0.01*T              0           0       ;
            0               0           0.005*T^3   0.005*T^2   ;
            0               0           0.005*T^2   0.01*T     ];  
X.V = [ p_noise p_noise p_noise p_noise]' ;

end

