%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Airborne EO/IR Sensor Tracking                                 %
%                     Copyright @2015_DRDC, version 01_02112015                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               S.Rajiv,  and B.Balaji                                      %
%          Defence R&D Canada, 3701 Carling Avenue, Ottawa, ON, K1A 0Z4, Canada.            %
%          Rajiv.Sithiravel@drdc-rddc.gc.ca and Bhashyam.Balaji@drdc-rddc.gc.ca             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%
% Property      %
%%%%%%%%%%%%%%%%%
pro.sampling_time                                   = 1;
pro.mcr                                             = 1;
pro.duration                                        = 1601;

%%%%%%%%%%%%%%%
%Targets info %
%%%%%%%%%%%%%%%

target.no_of_targets                                = 1;
target.target_no(1).initial_state                   = [-6000 1 4000 1]';
target.target_no(1).start_time                      = 1;
target.target_no(1).no_of_legs                      = 1;
target.target_no(1).truth                           = [];
target.target_no(1).leg(1).model                    = 'CONSTANT VELOCITY EOIR';
target.target_no(1).leg(1).p_noise_variance         = 0.01;
target.target_no(1).leg(1).duration                 = 1600;
target.target_no(1).leg(1).angular_rate             = [];
target.target_no(1).leg(1).turn_rate_noise_variance = [];
target.target_no(1).leg(1).F                        = [];
target.target_no(1).leg(1).Q                        = [];
target.target_no(1).leg(1).V                        = [];

%%%%%%%%%%%%%%
%Sensor info %
%%%%%%%%%%%%%%
sensor.no_of_sensors                                = 1;

%%%%%%%%%%%%%%%%%%%%%%% Sensor 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sensor.sensor_no(1).FOV                             = [21.7 16.4];
sensor.sensor_no(1).type                            = 'BEARING AND ELEVATION';
sensor.sensor_no(1).bearing_range                   = [-pi pi]';
sensor.sensor_no(1).elevation_range                 = [-pi pi]';
sensor.sensor_no(1).alt                             = 2000;
sensor.sensor_no(1).m_noise_variance                = (pi/180)*(0.75^2);
sensor.sensor_no(1).R                               = [0.75^2 0.0001; 0.0001 0.75^2];
sensor.sensor_no(1).P_ini                           = [sensor.sensor_no(1).R  sensor.sensor_no(1).R/pro.sampling_time ;  sensor.sensor_no(1).R/pro.sampling_time   2*sensor.sensor_no(1).R/pro.sampling_time ^2];
sensor.sensor_no(1).PD                              = 1;
sensor.sensor_no(1).PFA                             = 0;
sensor.sensor_no(1).initial_state                   = [-8000 250 -2000 250]';
sensor.sensor_no(1).start_time                      = 1;
sensor.sensor_no(1).no_of_legs                      = 3;
sensor.sensor_no(1).d                               = 5;
sensor.sensor_no(1).resolution                      = [640 512];
sensor.sensor_no(1).no_of_legs                      = 3;


sensor.sensor_no(1).leg(1).model                    = 'CONSTANT VELOCITY';
sensor.sensor_no(1).leg(1).duration                 = 300;
sensor.sensor_no(1).leg(1).p_noise_variance         = 0.0002;
sensor.sensor_no(1).leg(1).angular_rate             = [];
sensor.sensor_no(1).leg(1).turn_rate_noise_variance = [];
sensor.sensor_no(1).leg(1).F                        = [];
sensor.sensor_no(1).leg(1).Q                        = [];
sensor.sensor_no(1).leg(1).V                        = [];

sensor.sensor_no(1).leg(2).model                    = 'CONSTANT TURN';
sensor.sensor_no(1).leg(2).duration                 = 1200;
sensor.sensor_no(1).leg(2).p_noise_variance         = 0.0001;
sensor.sensor_no(1).leg(2).angular_rate             = 0.00500;
sensor.sensor_no(1).leg(2).turn_rate_noise_variance = 0;
sensor.sensor_no(1).leg(2).F                        = [];
sensor.sensor_no(1).leg(2).Q                        = [];
sensor.sensor_no(1).leg(2).V                        = [];

sensor.sensor_no(1).leg(3).model                    = 'CONSTANT VELOCITY';
sensor.sensor_no(1).leg(3).duration                 = 100;
sensor.sensor_no(1).leg(3).p_noise_variance         = 0.0002;
sensor.sensor_no(1).leg(3).angular_rate             = [];
sensor.sensor_no(1).leg(3).turn_rate_noise_variance = [];
sensor.sensor_no(1).leg(3).F                        = [];
sensor.sensor_no(1).leg(3).Q                        = [];
sensor.sensor_no(1).leg(3).V                        = [];

sensor.sensor_no(1).truth                           = [];
sensor.sensor_no(1).true_bea_ele_grid               = [];
sensor.sensor_no(1).measurement                     = [];
sensor.sensor_no(1).measurement_set                 = [];


