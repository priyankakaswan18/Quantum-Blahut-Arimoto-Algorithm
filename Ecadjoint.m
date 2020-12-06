function output = Ecadjoint(rho)

% this function gives action of the adjoint channel of the complementary channel 
% of a quantum channel with Kraus operators A0 and A1 on a density matrix rho.

global zero one

% apply the Choi map to the complementary channel to obtain the corresponding Choi matrix
choi=tensor( Ec(ketbra(zero,zero)) , ketbra(zero,zero) )...
    +tensor( Ec(ketbra(zero,one)) , ketbra(zero,one) )...
    +tensor( Ec(ketbra(one,zero)) , ketbra(one,zero) )...
    +tensor( Ec(ketbra(one,one)) , ketbra(one,one) );


% compute the spectral decomposition of choi matrix
[V,D] = eig(choi);

% initializing Kraus operators of adjoint channel of complementary channel
% of the quantum channel

B={};
B{1}=zeros(2,2);
B{2}=zeros(2,2);
B{3}=zeros(2,2);
B{4}=zeros(2,2);

% Kraus operators will be the eigenvectors rearranged into a matrix 
% and the weight of each Kraus operator will be the corresponding eigenvalue.

for i=1:4
    v1=V(:,i); % ith eigenvector
    d=D(i,i); % ith eigenvalue
    if d>10^(-6) % only updating a Kraus operator in case of corresponding non-zero eigenvalue
        % creation of elements of ith matrix (i.e., ith Kraus operator)
        % from ith eigenvector and ith eigenvalue
        B{i}(1,1)=v1(1)*sqrt(d); 
        B{i}(1,2)=v1(2)*sqrt(d);
        B{i}(2,1)=v1(3)*sqrt(d);
        B{i}(2,2)=v1(4)*sqrt(d);
        
    end
    
end

% resultant action on density operator
output=B{4}'*rho*B{4}+B{1}'*rho*B{1}+B{2}'*rho*B{2}+B{3}'*rho*B{3};