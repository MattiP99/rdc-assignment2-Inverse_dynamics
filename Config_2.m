biTri2(1,1,1) = 1; biTri2(1,2,1) = 0; biTri2(1,3,1) = 0; biTri2(1,4,1) = 0;
biTri2(2,1,1) = 0; biTri2(2,2,1) = 0; biTri2(2,3,1) = -1; biTri2(2,4,1) = 0;
biTri2(3,1,1) = 0; biTri2(3,2,1) = 1; biTri2(3,3,1) = 0; biTri2(3,4,1) = 0;
biTri2(4,1,1) = 0; biTri2(4,2,1) = 0; biTri2(4,3,1) = 0; biTri2(4,4,1) = 1;

biTri2(1,1,2) = 0; biTri2(1,2,2) = 0;  biTri2(1,3,2) = 1; biTri2(1,4,2) = 1;
biTri2(2,1,2) = 1;  biTri2(2,2,2) = 0;  biTri2(2,3,2) = 0; biTri2(2,4,2) = 0;
biTri2(3,1,2) = 0;  biTri2(3,2,2) = 1;  biTri2(3,3,2) = 0; biTri2(3,4,2) = 0;
biTri2(4,1,2) = 0;  biTri2(4,2,2) = 0;  biTri2(4,3,2) = 0; biTri2(4,4,2) = 1;

biTri2(1,1,3) = 0;  biTri2(1,2,3) = 1; biTri2(1,3,3) = 0;  biTri2(1,4,3) = 0;
biTri2(2,1,3) = 0; biTri2(2,2,3) = 0; biTri2(2,3,3) = 1;  biTri2(2,4,3) = 0;
biTri2(3,1,3) = 1;  biTri2(3,2,3) = 0; biTri2(3,3,3) = 0; biTri2(3,4,3) = 0.4;
biTri2(4,1,3) = 0;  biTri2(4,2,3) = 0; biTri2(4,3,3) = 0;  biTri2(4,4,3) = 1;



numberOfJoints2 = 3;

jointType2 =  [0 1 0];

q_dot_2_1 = [0.08, 0.03, 0];
q_dot_dot_2_1 = [0.1 , 0.01, 0];


q_dot_2_2 = [-0.4, -0.08, 0];
q_dot_dot_2_2 = [-0.1 , -0.01, 0];

Masses2 = [10 , 6];
v1 = [0,0,0.4];
v2 = [0,0.3,0];
Inertia2 = zeros(3,3,2);
Inertia2(:,:,1) = diag(v1);
Inertia2(:,:,2) = diag(v2);
