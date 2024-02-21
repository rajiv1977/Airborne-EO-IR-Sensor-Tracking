%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    
function [m,p] = EKF(p,t,s)

X_temp          = t.target_no.truth;
X_temp(:,1)     = [];
X1              = X_temp';

S_temp          = s.sensor_no(1).truth;
S_temp(:,1)     = [];
S1              = S_temp';

Z_temp          = s.sensor_no(1).measurement_set;
Z_temp(:,2)     = [];
z               = Z_temp;

NTsteps         = p.duration;

Q               = t.target_no(1).leg(1).Q;
R               = s.sensor_no(1).R;
F               = t.target_no(1).leg(1).F;
P_ini           = s.sensor_no(1).P_ini;

m_prior         = [-6000 15 4000 15]';
p_prior         = P_ini;

for k=1:NTsteps
    k
    m_pred      = F*m_prior;
    F_hat       = F;
    p_pred      = Q + F_hat*p_prior*F_hat';
    
    H(1,1)      = (S1(3,k)-X1(3,k)) / ( (X1(1,k)-S1(1,k))^2 + (X1(3,k)-S1(3,k))^2 );
    H(1,2)      = 0;
    H(1,3)      = (X1(1,k)-S1(1,k)) / ( (X1(1,k)-S1(1,k))^2 + (X1(3,k)-S1(3,k))^2 );
    H(1,4)      = 0;
    a1          = s.sensor_no(1).alt*(-S1(1,k)+X1(1,k));
    a2          =   ( (-S1(1,k)+X1(1,k))^2 + (-S1(3,k)+X1(3,k))^2 )^(3/2);
    a3          = 1 + ( s.sensor_no(1).alt^2 / ( (-S1(1,k)+X1(1,k))^2 + (-S1(3,k)+X1(3,k))^2 ) );
    H(2,1)      = -(a1)/(a2*a3);
    H(2,2)      = 0;
    b1          = s.sensor_no(1).alt*(-S1(3,k)+X1(3,k));
    b2          =   ( (-S1(1,k)+X1(1,k))^2 + (-S1(3,k)+X1(3,k))^2 )^(3/2);
    b3          = 1 + ( s.sensor_no(1).alt^2 / ( (-S1(1,k)+X1(1,k))^2 + (-S1(3,k)+X1(3,k))^2 ) );
    H(2,3)      = -(b1)/(b2*b3);
    H(2,4)      = 0;
    
    S           = H* p_pred * H' + R;
    K           = p_pred * H'* inv(S);
    x           = m_pred(1)-S1(1,k) ;
    y           = m_pred(3)-S1(3,k) ;
    eA          = s.sensor_no(1).alt/sqrt(x^2 + y^2);
    flag        = [atan2(y,x); atan(eA)] + [s.sensor_no(1).d*s.sensor_no(1).FOV(1)/s.sensor_no(1).resolution(1) ; s.sensor_no(1).d*s.sensor_no(1).FOV(2)/s.sensor_no(1).resolution(2)];
    
    m.loop(k).m_update      = m_pred + K * [z(k,2)-flag(1); z(k,3)-flag(2)];
    m_prior                 = m.loop(k).m_update;
    
    p.loop(k).p_update      = p_pred - K * S * K';
    p_prior                 = p.loop(k).p_update;
    
end


end