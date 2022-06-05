biTri3(1,1,1) = 1; biTri3(1,2,1) = 0; biTri3(1,3,1) = 0; biTri3(1,4,1) = 0;
biTri3(2,1,1) = 0; biTri3(2,2,1) = 1; biTri3(2,3,1) = 0; biTri3(2,4,1) = 0;
biTri3(3,1,1) = 0; biTri3(3,2,1) = 0; biTri3(3,3,1) = 1; biTri3(3,4,1) = 0;
biTri3(4,1,1) = 0; biTri3(4,2,1) = 0; biTri3(4,3,1) = 0; biTri3(4,4,1) = 1;

biTri3(1,1,2) = 1; biTri3(1,2,2) = 0;  biTri3(1,3,2) = 0; biTri3(1,4,2) = 1;
biTri3(2,1,2) = 0;  biTri3(2,2,2) = 0;  biTri3(2,3,2) = -1; biTri3(2,4,2) = 0;
biTri3(3,1,2) = 0;  biTri3(3,2,2) = 1;  biTri3(3,3,2) = 0; biTri3(3,4,2) = 0;
biTri3(4,1,2) = 0;  biTri3(4,2,2) = 0;  biTri3(4,3,2) = 0; biTri3(4,4,2) = 1;

biTri3(1,1,3) = 1;  biTri3(1,2,3) = 0; biTri3(1,3,3) = 0;  biTri3(1,4,3) = 0.8;
biTri3(2,1,3) = 0; biTri3(2,2,3) = 1; biTri3(2,3,3) = 0;  biTri3(2,4,3) = 0;
biTri3(3,1,3) = 0;  biTri3(3,2,3) = 0; biTri3(3,3,3) = 1; biTri3(3,4,3) = 0;
biTri3(4,1,3) = 0;  biTri3(4,2,3) = 0; biTri3(4,3,3) = 0;  biTri3(4,4,3) = 1;

biTri3(1,1,4) = 1;  biTri3(1,2,4) = 0; biTri3(1,3,4) = 0;  biTri3(1,4,4) = 0.35;
biTri3(2,1,4) = 0; biTri3(2,2,4) = 1; biTri3(2,3,4) = 0;  biTri3(2,4,4) = 0;
biTri3(3,1,4) = 0;  biTri3(3,2,4) = 0; biTri3(3,3,4) = 1; biTri3(3,4,4) = 0;
biTri3(4,1,4) = 0;  biTri3(4,2,4) = 0; biTri3(4,3,4) = 0;  biTri3(4,4,4) = 1;

numberOfJoints3 = 4;
jointType3 =  [0 0 0 0];

q_dot3 = [0.2, 0.15, -0.2, 0];
q_dot_dot3 = [0.1 , 0.085 ,0, 0];


Masses3 = [20 , 20, 6];
v1 = [0.2 ,  0.2,   0.8];
v2 = [0.2,  0.2,   0.8];
v3 = [0.08 , 0.08, 0.1];
Inertia3 = zeros(3,3,3);
Inertia3(:,:,1) = diag(v1);
Inertia3(:,:,2) = diag(v2);
Inertia3(:,:,3) = diag(v3);