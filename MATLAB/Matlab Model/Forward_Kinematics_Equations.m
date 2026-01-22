theta = [0, -179.64, 217.11, 0, 52.53];
T_final = forwardKinematics(theta)

function T_final = forwardKinematics(theta_deg)

    theta = deg2rad(theta_deg);

    DH = [ ...
        theta(1),  14,   97,    pi/2;
        theta(2) + pi/2, 120,    0,    0;
        theta(3),   0,    0,    pi/2;
        theta(4),   0,  120,   -pi/2;
        theta(5) + pi, 100,    0,    0];

    T_final = eye(4);

    for i = 1:size(DH,1)
        theta_i = DH(i,1);
        a_i     = DH(i,2);
        d_i     = DH(i,3);
        alpha_i = DH(i,4);
        
        T_i = [cos(theta_i), -sin(theta_i)*cos(alpha_i),  sin(theta_i)*sin(alpha_i), a_i*cos(theta_i);
               sin(theta_i),  cos(theta_i)*cos(alpha_i), -cos(theta_i)*sin(alpha_i), a_i*sin(theta_i);
                     0     ,         sin(alpha_i)      ,         cos(alpha_i)     ,     d_i;
                     0     ,              0            ,             0            ,     1];
                 
        T_final = T_final * T_i;
    end
end
