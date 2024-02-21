%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function X = set_CT_models(X, T, p_noise, w, w_noise)

X.F = [ 1  sin(w*T)/w     0  (cos(w*T)-1)/w 0 ;
        0  cos(w*T)       0  -sin(w*T)      0 ;
        0 (1-cos(w*T))/w  1  sin(w*T)/w    0 ;
        0  sin(w*T)       0  cos(w*T)       0 ;
        0  0              0  0              1 ] ;
X.Q = [ T^2/2 0     0 ;
        T     0     0 ;
        0     T^2/2 0 ;
        0     T     0 ;
        0     0     T ] ;
X.V = [ p_noise p_noise w_noise ]' ;

end

