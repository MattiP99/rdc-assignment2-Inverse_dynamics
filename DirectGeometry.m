%% DirectGeometry Function 
% inputs: 
% - q : current links position;
% - biTri: transformation matrix of link <i> w.r.t. link <i-1> for qi=0; 
% - jointType: 0 for revolute, 1 for prismatic;
% output:
% biTei : transformation matrix of link <i> w.r.t. link <i-1> for the input qi.

function biTei = DirectGeometry(qi, biTri, linkType)

    % if the joint type is rotational 
    %compute the rotation around z-axis
   if linkType == 0
       biTei = biTri * [cos(qi), -sin(qi),   0, 0;
                        sin(qi), cos(qi),    0, 0;
                         0,       0,         1, 0;
                         0,       0,         0, 1 ] ;
    % if the joint type is prismatic
    %compute the traslation along z-axis
   elseif linkType == 1
        biTei = biTri * [1, 0, 0, 0;
                         0, 1, 0, 0;
                         0, 0, 1, qi;
                         0, 0, 0, 0 ];
   %fixed joint
   elseif linkType == 2
       biTei = biTri;
       
       
              
   end
   
end