%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [temp_truth, temp] = generate_CV_EOIR_truth(temp_truth, temp, X , sample_T )

t = temp_truth(end,1);
A = [1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     0 0 0 1];

% For all time steps
for j=1 : X.duration
    t = t+sample_T ;
    temp = X.F*temp + A * chol(X.Q) * sqrt(X.V);
    temp_truth = [ temp_truth ; [ t , temp'] ] ;
end

end