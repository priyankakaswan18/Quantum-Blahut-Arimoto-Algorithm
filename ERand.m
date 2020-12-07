function output = ERand(rho)

% this function gives action of a random classical quantum channel. 
% Output density operators randomly in mainfile.m


global tau1 tau2


output=rho(1,1)*tau1+rho(2,2)*tau2;
