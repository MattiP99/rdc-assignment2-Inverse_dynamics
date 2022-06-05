%%Main

clc
clear
close all

Config_1;
Config_2;
Config_3;

% CHOOSE EXERCISE:
% We were given three configurations of robot manipulator
% In this section the User inserts the exercise(and sub exercise) he/she
% wants to run. Even if the configuration is given some parameters can be
% chosen: 
%       - How much the joint will move(in degrees or in millimeters depending on which kind of joint we are considering)
%       - There is gravity or not
%       - There are external forces acting on the link. (if so, the user should insert the right conponents wrt the absolute frame 
%               and its point of application but this time in the link frame)
%       - There are external moments acting on the link.(if so, the user should
%               insert the right conponents wrt the absolute frame)



questions_start = {'Which exercise do you want to perform?'};
answer_start = inputdlg(questions_start);
if str2double(answer_start) == 1
  biTri = biTri1;
  numberOfJoints = numberOfJoints1;
  jointType = jointType1;
  Inertia = Inertia1;
  Masses = Masses1;

  % SUB-EXERCISE-1
  questions_start_0 = {'Which sub-exercise do you want to perform?'};
  answer_start_0 = inputdlg(questions_start_0);
 
  if str2double(answer_start_0) == 1
      q_dot = q_dot_1_1;
      q_dot_dot = q_dot_dot_1_1;

  elseif str2double(answer_start_0) == 2
     q_dot = q_dot_1_2;
      q_dot_dot = q_dot_dot_1_2;
  end


% EXRECISE 2
elseif str2double(answer_start) == 2
   biTri = biTri2;
  numberOfJoints = numberOfJoints2;
  jointType = jointType2;
  Inertia = Inertia2;
  Masses = Masses2;

  % SUB-EXERCISE-2
  questions_start_0 = {'Which sub-exercise do you want to perform?'};
  answer_start_0 = inputdlg(questions_start_0);
 
  if str2double(answer_start_0) == 1
     q_dot = q_dot_2_1;
      q_dot_dot = q_dot_dot_2_1;

  elseif str2double(answer_start_0) == 2
      biTri(3,4,3) = 1.2;
     q_dot = q_dot_2_2;
      q_dot_dot = q_dot_dot_2_2;
  end

elseif str2double(answer_start) == 3
   biTri = biTri3;
  numberOfJoints = numberOfJoints3;
  jointType = jointType3;
  Inertia = Inertia3;
  Masses = Masses3;
      q_dot = q_dot3;
      q_dot_dot = q_dot_dot3;
end


%initial configuration
q_0 = zeros(1,numberOfJoints);
%Terminal configuration. The one which the real problem will start from
q_f = zeros(1,numberOfJoints);

for i = 1:numberOfJoints - 1
    n_link = num2str(i);
    questions = {'How much this joint will move wrt the previuos one? degrees or millimeters'};
    answer = inputdlg(questions, n_link);
        if jointType(1,i) == 0
            % Converting inserted degrees into radiants unit
    
            q_f(1,i) = str2double(answer{1})*pi/180;
        else
            %If prismatic take the measure (in meters) as it is given
            q_f(1,i) = str2double(answer{1});
        end
end

gravity_LinkFrame = zeros(3,numberOfJoints-1);
gravity = zeros(3,numberOfJoints-1);
question_gravity = {'Is there the gravity Force y/n?'};

answer3 = inputdlg(question_gravity);
% The gravity is an option to insert as mentioned before.
% It is given in the absolute frame and it will be converted in each link frame below.  
if  isequal(answer3{1}, 'y')
    for i = 1:numberOfJoints - 1
        gravity(:,i) = [0; 0; -9.81];
    end
end

% Computing forces and moments of i-th wrt i-1-th
F_i_i_1 = zeros(3,numberOfJoints);
F = zeros(3,numberOfJoints-1);
F_Position = zeros(3,numberOfJoints-1);
F_Ext_CoM = zeros(3,numberOfJoints-1);

M_i_i_1 = zeros(3,numberOfJoints);
M = zeros(3,numberOfJoints -1);
M_Ext_CoM = zeros(3,numberOfJoints-1);

% The user inserts external forces, with their opsition relative to each link Center of mass (+ on the right, - on the left) and moments
for i = 1:numberOfJoints-1
    n_link = num2str(i);
    if jointType(1,i) == 0
    questions2_1 = {'Is there any force acting on this link?'};
    answer2_1= inputdlg(questions2_1,n_link);
        if  isequal(answer2_1{1}, 'y')


            questions2 = {'Which the x value of Forces acting on link ?'  ...
                  'Which the y value of Forces acting on link  ?'  ...
                  'Which the z value of Forces acting on link  ?' ...
                  'Which is its distance wrt its Center of mass?'};

            answer2 = inputdlg(questions2,n_link);
            F(1,i) = str2double(answer2{1});
            F(2,i) = str2double(answer2{2});
            F(3,i) = str2double(answer2{3});
            F_Position(:,i) = [(str2double(answer2{4})) , 0 , 0]';
           
        end
    
    else
        questions2_1 = {'Is there any force acting on this link?'};
        answer2_1= inputdlg(questions2_1,n_link);
         if  isequal(answer2_1{1}, 'y')
        questions2 = {'Which the x value of Forces acting on link ?'  ...
                  'Which the y value of Forces acting on link  ?'  ...
                  'Which the z value of Forces acting on link  ?'};
        
            answer2 = inputdlg(questions2,n_link);
            F(1,i) = str2double(answer2{1});
            F(2,i) = str2double(answer2{2});
            F(3,i) = str2double(answer2{3});
             % It is not important where you apply the force in a prismatic joint. I
            % need only the component direction
            F_Position(:,i) = [0, 0, 0]';
         end
    end   
end




for i = 1:numberOfJoints-1
    n_link = num2str(i);
    if jointType(1,i) == 0
    questions2_2 = {'Is there any moment acting on this link?'};
    answer2_2= inputdlg(questions2_2,n_link);
        if  isequal(answer2_2{1}, 'y')


            questions2_3 = {'Which the x value of Moment acting on link ?'  ...
                  'Which the y value of Moment acting on link  ?'  ...
                  'Which the z value of Moment acting on link  ?' };
                

            answer2_3 = inputdlg(questions2_3,n_link);
            M(1,i) = str2double(answer2{1});
            M(2,i) = str2double(answer2{2});
            M(3,i) = str2double(answer2{3});
            
        end
    
    else
        questions2_1 = {'Is there any moment acting on this link?'};
        answer2_1= inputdlg(questions2_1,n_link);
         if  isequal(answer2_1{1}, 'y')
           questions2_4 = {'Which the x value of Moment acting on link ?'  ...
                  'Which the y value of Moment acting on link  ?'  ...
                  'Which the z value of Moment acting on link  ?'};
        
            answer2_4 = inputdlg(questions2_4,n_link);
            M(1,i) = str2double(answer2_4{1});
            M(2,i) = str2double(answer2_4{2});
            M(3,i) = str2double(answer2_4{3});
         end
    end   
end


    q_f(1,numberOfJoints) = 0;


%-------------------MOVE----------------------%
% This section is dedicated to the robot movement
% We consider 150 steps of computation and for each of these we compute:
 
nSteps = 150;

for i = 1:numberOfJoints
    qSteps(:,i) = linspace(q_0(1,i),q_f(1,i),nSteps).';
end

    

cindex = 1;
csize = nSteps;
cmap = colormap(summer(csize));
color = cmap(mod(cindex,csize)+1,:);
plot3(0,0,0,'o','Color','r')


% For each interval from initial configuration to the final configuration
% we will compute 
for i =1:nSteps
    basicV = zeros(3,numberOfJoints);
    %qSteps has 150 rows (bacause of the steps) and numberOfJoints columns
    % At each step I will compute numberOfJoitns measures that corrispond to the angles the
    % joints weere moved from the previous time step.
    % Theese angles, or better intermediate configurations are determined by the GetDirectGeometry function
    q = qSteps(i,1:numberOfJoints).';
    
    % biTei is the Vector of Transformation  matrices of joint i wrt i-1
    biTei = GetDirectGeometry(q,biTri,jointType,numberOfJoints);
    
 
    %computing all vectors connecting the base to the i-th link i
    for j = 1:numberOfJoints 
        basicV(:,j) = GetBasicVectorWrtBase(biTei,j);
    end
    
    % plot the base separatly because it is useless plotting it everytime.
    %basicV = [[0;0;0],basicV]
    
    %starting from 2... link 1 is moved because of the position of the base
    %At each step I will plot x,y,z of each joint
   for j = 1:numberOfJoints    
        plot3(basicV(1,j),basicV(2,j),basicV(3,j),'o','Color','b')
    end
   
    color = cmap(mod(cindex,csize)+1, :);
    cindex = cindex +1;
    
    %Connecting all joints while moving by using color lines
    hold on
    line(basicV(1,:),basicV(2,:),basicV(3,:), 'LineWidth', 2,'Color',color)

    pause(0.1)

end
    biTei
    basicV
   
    Vel = zeros(6,numberOfJoints);
    Acc = zeros(6,numberOfJoints);
    ri_i_1 = zeros(3,numberOfJoints);
    ki = zeros(3,numberOfJoints);
    zero_vector = zeros(6,1);
    
    % Transposing each External force and moments into each link frame
    % The same for the gravity
    for i = 1:numberOfJoints-1
         if i == 1
                
                gravity_LinkFrame(:,i) =  biTei(1:3,1:3,i)' * gravity(:,i);
                F_Ext_CoM(:,i) =  biTei(1:3,1:3,i)' * F(:,i) ;
                M_Ext_CoM(:,i) = biTei(1:3,1:3,i)' * M(:,i) ;

         else
                gravity_LinkFrame(:,i) =  biTei(1:3,1:3,i)' * gravity_LinkFrame(:,i-1);
                 F_Ext_CoM(:,i) =  biTei(1:3,1:3,i)' * F_Ext_CoM(:,i-1) ;
                M_Ext_CoM(:,i) = biTei(1:3,1:3,i)' * M_Ext_CoM(:,i-1) ;
         end

    end

    %----------------------------- FORWARD RECURSION-------------------
    for i = 1:numberOfJoints
    
            ki(:,i) = biTei(1:3,3,i);
            ri_i_1(:,i) = biTei(1:3,4,i);
            

            if i == 1
                
                Vel(:,i) = Velocity_Computation(q_dot(1,i), ri_i_1(:,i), ki(:,i),  zero_vector, jointType(1,i));
                Acc(:,i) = Acceleration_Computation(q_dot(1,i),q_dot_dot(1,i), ri_i_1(:,i), ki(:,i),  zero_vector, zero_vector, jointType(1,i));

            else
               % If the joint taken into consideration is not the first
               % then I have to transpose each velocity(angular(1:3) and
               % linear(4:6)) and acceleration(angular(1:3) and
               % linear(1:3)) of the previous link into the next reference
               % frame
               % Note that at this step I'm using the transposed of biTei
               % since it refers to i wrt i-1 but I want to 'move' i-1 into
               % i-th frame
                Vel(1:3,i-1) = biTei(1:3,1:3,i-1)' * Vel(1:3,i-1);
                Vel(4:6,i-1) = biTei(1:3,1:3,i-1)' * Vel(4:6,i-1);
                Acc(1:3,i-1) = biTei(1:3,1:3,i-1)' * Acc(1:3,i-1);
                Acc(4:6,i-1) = biTei(1:3,1:3,i-1)' * Acc(4:6,i-1);
               


                Vel(:,i) = Velocity_Computation(q_dot(1,i), ri_i_1(:,i), ki(:,i),  Vel(:,i-1), jointType(1,i));
                Acc(:,i) = Acceleration_Computation(q_dot(1,i), q_dot_dot(1,i), ri_i_1(:,i), ki(:,i) , Vel(:,i-1), Acc(:,i-1), jointType(1,i));
            end
           
    end

   ki
   Vel
   Acc

   % Now I can compute:
   % - the LINEAR ACCELERATION of each link with respect
   %    to the center of mass of the mentioned body
   % - the term Di: gravitational force in each link
   %- the term Delta_i : the momentum of each link since it is a rigid body
   %with a mass and with a legth. The given inertia matrices are in the
   %link reference frame wrt its center of mass

   Acc_Linear_Wrt_CoM = zeros(3,numberOfJoints-1);
   D = zeros(3,numberOfJoints-1);
   Delta = zeros(3,numberOfJoints-1);
   temp_Matrix = zeros(3,3,numberOfJoints-1); 
   temp_Vector = zeros(3,numberOfJoints-1); 

  
   %HO CAMBIATO ri-1 con ri
   for i = 2:numberOfJoints
        temp = cross(Vel(1:3,i-1)', (ri_i_1(1:3,i) ./ 2)');
         
        Acc_Linear_Wrt_CoM(:,i-1) = Acc(4:6,i-1) + cross(Acc(1:3,i-1)', ( ri_i_1(:,i) ./ 2)' )' + cross(Vel(1:3,i-1)',temp)';

       ODIO = Acc(4:6,i-1)
       LA = cross(Acc(1:3,i-1)', ( ri_i_1(:,i) ./ 2)' )'
       VITA = cross(Vel(1:3,i-1)',temp)'
       
        
         %Computing two fondamental terms for the next step
        % mi*Vci/o
        D(:,i-1) = Acc_Linear_Wrt_CoM(:,i-1) .* Masses(1,i-1);
        
        % Ici/o(w_doti/o) + (wi/o x Ici/o)
        
       
        temp_Vector(:,i-1) = Inertia(:,:,i-1) * Vel(1:3,i-1);
        Delta(:,i-1) = Inertia(:,:,i-1) * Acc(1:3,i-1) +  cross(Vel(1:3,i-1),temp_Vector(:,i-1));
       
   end   

D
Delta
Acc_Linear_Wrt_CoM
%----------------------- BACKWARD RECURSION--------------------

% Final torques initialization
tau = zeros(numberOfJoints-1,1);
r_last = biTei(1:3,4,numberOfJoints);
%LOOP: From the end to the starting joint
for i = (numberOfJoints-1):-1:1
    
    % distance vector of i wrt i-1
    ri_i_1(:,i) = biTei(1:3,4,i);
    ki(:,i) = biTei(1:3,1:3,i)' * ki(:,i);

    %If the last one, I don't have to consider the previous moment and
    %force action on this link
    if i == numberOfJoints-1
    F_i_i_1(:,i) =  - F_Ext_CoM(:,i) + D(:,i) - gravity_LinkFrame(:,i) .* Masses(1,i);
    M_i_i_1(:,i) = -M_Ext_CoM(:,i) + Delta(:,i) + cross((r_last ./ 2), F_i_i_1(:,i));
     F_Ext_CoM
     M_Ext_CoM
    else
        % NO THE LAST ONE
        % Description:
             % Before doing any computation I have to transpose the total force
             % and moment of the previous link into the present one.
             % NOTE that in this case a premultiply for biTei (not the transpose
             % one) since this transformation matrix refers (as mentioned before) to link <i>-th to link <i-1>-th 
    F_i_i_1(:,i+1) = biTei(1:3,1:3,i+1) *  F_i_i_1(:,i+1) ;
   M_i_i_1(:,i+1) = biTei(1:3,1:3,i+1) * M_i_i_1(:,i+1);
   
    F_i_i_1(:,i) = F_i_i_1(:,i+1) - F_Ext_CoM(:,i) + D(:,i) - gravity_LinkFrame(:,i) .* Masses(1,i);
     M_i_i_1(:,i) = M_i_i_1(:,i+1) - M_Ext_CoM(:,i) + cross((ri_i_1(:,i+1)./ 2), F_i_i_1(:,i)) - cross((-ri_i_1(:,i+1)./ 2) , F_i_i_1(:,i+1)) + Delta(:,i);
     
     FROCIO = cross((-ri_i_1(:,i+1)./ 2) , F_i_i_1(:,i+1))
     BASTARDO = cross((ri_i_1(:,i+1)./ 2), F_i_i_1(:,i))
     TI_ODIO = M_i_i_1(:,i+1)
   
    end

    % Computation of final torques of each joint
    if jointType(1,i) == 0
        tau(i,1) =  dot(M_i_i_1(:,i)',ki(:,i)');
    elseif jointType(1,i) == 1
        tau(i,1) = dot(F_i_i_1(:,i)',ki(:,i)');
    end
end

M_i_i_1
F_i_i_1
D
ki
gravity_LinkFrame
tau
