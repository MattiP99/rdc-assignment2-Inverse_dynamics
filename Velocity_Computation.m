
function Vel = Velocity_Computation(q_dot, ri, ki, Vel_i_i_1, joint_type)
  Vel_rot = zeros(3,1);
  Vel_lin = zeros(3,1);
      
        if joint_type == 0
           
            % Angular Velocity
            %Vel(1:3,1) = Vel_i_i_1(1:3,1) + ki .* q_dot
            Vel_rot = Vel_i_i_1(1:3,1) + ki .* q_dot

            % Linear Velocity
            %Vel(4:6,1) = Vel_i_i_1(4:6,1) + cross(Vel_i_i_1(1:3,1),ri)
            Vel_lin = Vel_i_i_1(4:6,1) + cross(Vel_i_i_1(1:3,1)', ri')'
        elseif joint_type == 1
            
            % Angular Velocity
            Vel_rot = Vel_i_i_1(1:3,1);

            % Linear Velocity
            Vel_lin = Vel_i_i_1(4:6,1) + cross(Vel_i_i_1(1:3,1)', ri')' + ki .* q_dot;
        end
    
    Vel = [Vel_rot; Vel_lin];
end