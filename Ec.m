function output = Ec(rho)

% this function gives action of the complementary channel of a quantum channel with Kraus operators A0
% and A1 on a density matrix rho

global A0 A1 zero one

output= trace(A0*rho*A0')*ketbra(zero,zero)+ trace(A0*rho*A1')*ketbra(zero,one) + trace(A1*rho*A0')*ketbra(one,zero)+ trace(A1*rho*A1')*ketbra(one,one);


