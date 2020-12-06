function output = E(rho)

% this function gives action of a quantum channel with Kraus operators A0
% and A1 on a density matrix rho

global A0 A1
output=A0*rho*A0'+A1*rho*A1';




