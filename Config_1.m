
biTri1(1,1,1) = 1; biTri1(1,2,1) = 0; biTri1(1,3,1) = 0; biTri1(1,4,1) = 0;
biTri1(2,1,1) = 0; biTri1(2,2,1) = 0; biTri1(2,3,1) = -1; biTri1(2,4,1) = 0;
biTri1(3,1,1) = 0; biTri1(3,2,1) = 1; biTri1(3,3,1) = 0; biTri1(3,4,1) = 0;
biTri1(4,1,1) = 0; biTri1(4,2,1) = 0; biTri1(4,3,1) = 0; biTri1(4,4,1) = 1;

biTri1(1,1,2) = 1; biTri1(1,2,2) = 0;  biTri1(1,3,2) = 0; biTri1(1,4,2) = 1;
biTri1(2,1,2) = 0;  biTri1(2,2,2) = 1;  biTri1(2,3,2) = 0; biTri1(2,4,2) = 0;
biTri1(3,1,2) = 0;  biTri1(3,2,2) = 0;  biTri1(3,3,2) = 1; biTri1(3,4,2) = 0;
biTri1(4,1,2) = 0;  biTri1(4,2,2) = 0;  biTri1(4,3,2) = 0; biTri1(4,4,2) = 1;

biTri1(1,1,3) = 1;  biTri1(1,2,3) = 0; biTri1(1,3,3) = 0;  biTri1(1,4,3) = 0.8;
biTri1(2,1,3) = 0; biTri1(2,2,3) = 1; biTri1(2,3,3) = 0;  biTri1(2,4,3) = 0;
biTri1(3,1,3) = 0;  biTri1(3,2,3) = 0; biTri1(3,3,3) = 1; biTri1(3,4,3) = 0;
biTri1(4,1,3) = 0;  biTri1(4,2,3) = 0; biTri1(4,3,3) = 0;  biTri1(4,4,3) = 1;

numberOfJoints1 = 3;

jointType1 =  [0 0 0];

q_dot_1_1 = [0.2, 0.15,0];
q_dot_dot_1_1 = [0.1 , 0.085,0];

q_dot_1_2 = [-0.8, 0.35,0];
q_dot_dot_1_2 = [-0.4 , 0.1, 0];

Masses1 = [22 , 19];
% I have changed Inertia Matrix since my link directions are on their x-axis
v1 = [0,0,0.4];
v2 = [0,0,0.3];

Inertia1 = zeros(3,3,2);
Inertia1(:,:,1) = diag(v1);
Inertia1(:,:,2) = diag(v2);



