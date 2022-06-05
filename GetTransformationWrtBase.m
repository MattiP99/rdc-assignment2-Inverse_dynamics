%% GetTransformatioWrtBase function
% inputs:
% - biTei: vector of matrices containing the transformation matrices of link <i> w.r.t. link <i-1> for the current q.
% - linkNumber: for which computing the transformation matrix;
% output:
% - bTi: transformation matrix from the manipulator base to the ith joint in the configuration identified by biTei.

function [bTi] = GetTransformationWrtBase(biTei, linkNumber)
%Multiplying every transfromation matrix from <0> to <i-th>
if linkNumber == 1
    bTi = biTei(:,:,1);
else
    bTi = biTei(:,:,1);
    
    for i=2:1:linkNumber
        bTi = bTi* biTei(:,:,i);
    end
end
end