%% GetFrameWrtFrame function 
% inputs: 
% - linkNumber_i : number of ith link 
% - linkNumber_j: number of jth link 
% - biTei: vector of matrices containing the transformation matrices of link <i> w.r.t. link <i-1> for the current q.
% output:
% iTj : transformationMatrix from link i and link j for the configuration
% described in biTei.

function [iTj]=GetFrameWrtFrame(linkNumber_i, linkNumber_j,biTei,numberOfJoints)
%Having T_i (Transformation matrix from <0> to <i_th>)and
%T_j(Transformation matrix from <0> to <j_th>) I can compute iTj simply
%multiplying the inverse of T_i for T_j
    T_i = GetTransormationWrtBase(biTei(4,4,linkNumber_i));
    T_j = GetTransormationWrtBase(biTei(4,4,linkNumber_j));
   for i=1:1:numberOfJoints
       iTj = T_i/T_j; %equal to inv(T_i) * T_j
   end
   
   
end