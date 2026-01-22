L2 = 120;
L3 = 120;
L5 = 100;

x_ee_world = 14;
y_ee_world = 0;
z_ee_world = 437;
phi = deg2rad(90);

x0 = 14;
z0 = 97;

x_ee = x_ee_world - x0;
z_ee = z_ee_world - z0;

x_w = x_ee - L5 * cos(phi);
z_w = z_ee - L5 * sin(phi);

theta1 = atan2(y_ee_world, x_ee_world);

if y_ee_world  == 0 && round(x_ee_world, 2) >= 0
    theta1 = 0;
end

r_squared = x_w^2 + z_w^2;

cos_theta3 = (r_squared - L2^2 - L3^2) / (2 * L2 * L3);

cos_theta3 = max(min(cos_theta3, 1), -1);

sin_theta3 = -sqrt(1 - cos_theta3^2);
theta3 = atan2(sin_theta3, cos_theta3);

k1 = L2 + L3 * cos_theta3;
k2 = L3 * sin_theta3;
theta2 = atan2(z_w, x_w) - atan2(k2, k1);

theta4 = 0;
theta5 = phi - (theta2 + theta3);

theta2 = theta2 - pi/2;
theta3 = theta3 + pi/2;
theta5 = theta5 + pi/2;

fprintf('Theta1 = %.2f deg\n', rad2deg(theta1));
fprintf('Theta2 = %.2f deg\n', rad2deg(theta2));
fprintf('Theta3 = %.2f deg\n', rad2deg(theta3));
fprintf('Theta4 = %.2f deg\n', rad2deg(theta4));
fprintf('Theta5 = %.2f deg\n', rad2deg(theta5));
