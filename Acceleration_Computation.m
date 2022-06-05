function Acc = Accelaration_Computation(q_dot, q_dot_dot, ri, ki, Vel_i_i_1, Acc_i_i_1, joint_type)
  Acc_rot = zeros(3,1);
  Acc_lin = zeros(3,1);
  temp = cross(Vel_i_i_1(1:3,1)',  ri');
  temp1 = cross(Vel_i_i_1(1:3,1)', ki');
  temp2 = cross(Acc_i_i_1(1:3,1)', ri');
        if joint_type == 0
           
            % Angular Acceleration
            
            Acc_rot = Acc_i_i_1(1:3,1) + temp1' .* q_dot + ki .* q_dot_dot;

            % Linear Accelaration
            Acc_lin = Acc_i_i_1(4:6,1) + temp2' + cross(Vel_i_i_1(1:3,1)', temp)';
        elseif joint_type == 1
            
            % Angular Acceleration
            Acc_rot = Acc_i_i_1(1:3,1);

            % Linear Acceleration
             Acc_lin = Acc_i_i_1(4:6,1) + temp2' + cross(Vel_i_i_1(1:3,1)', (temp + (ki' .*  q_dot)) )' +  temp1' .* q_dot + ki .* q_dot_dot;
           
        end
    
    Acc = [Acc_rot; Acc_lin];
end