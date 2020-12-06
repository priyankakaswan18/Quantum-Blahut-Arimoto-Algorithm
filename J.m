function output = J(rho,sigma,gamma,quantity)

% Writing the two variable extension J for estimation using Blahut-Arimoto algorithm.
% rho,sigma - density operators
% gamma- accerleration parameter for algorithm
% quantity- the quantity of interest to be estimated, eg- Coherent information, Holevo quantity, etc

output= -gamma * trace( rho*(logm(rho)./log(2)) )...
    +trace( rho* ( gamma*logm(sigma)./log(2) + F(sigma,quantity) ) );