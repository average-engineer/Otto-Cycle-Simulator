function [v] = piston_kinematics(bore,stroke,con_rod,cr,starting_crank_angle,ending_crank_angle)
%engine kinematics
v_swept = (pi/4)*bore^2*stroke;
v_clearance = v_swept/(cr-1);
%crank angle
theta = linspace(starting_crank_angle,ending_crank_angle,180); 
crank_length = stroke/2;
R = con_rod/crank_length;
term1 = 0.5*(cr-1);
term2 = R +1 - cosd(theta);
term3 = (R^2 - sind(theta).^2).^0.5;
%using geometric relation between combustion chamber volume and crank angle
v = (1 + term1*(term2 - term3))*v_clearance
plot(v)
end


