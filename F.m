function output = F(sigma,quantity)

% F is a Hermitian matrix valued super-operator on density operators used in algorithm,
% which is different for different quantities of interest
% quantity- the quantity of interest to be estimated, eg- Coherent information, Holevo quantity, etc

global zero one

if strcmp(quantity,'Thermodynamic_capacity')
    output=Eadjoint(logm(E(sigma))./ log(2))-logm(sigma)./ log(2);
end

if strcmp(quantity,'Holevo_quantity')
    output=ketbra(zero,zero)*trace( E(ketbra(zero,zero))*( logm(E( eye(2)*10^(-6) + ketbra(zero,zero)))./ log(2)-logm(E(sigma))./ log(2) ) )...
        +ketbra(one,one)*trace( E(ketbra(one,one))*( logm(E( eye(2)*10^(-6) +ketbra(one,one)))./ log(2)-logm(E(sigma))./ log(2) ) );
end

if strcmp(quantity,'Quantum_mutual_information')
    output=Ecadjoint(logm(Ec(sigma))./ log(2)) -Eadjoint(logm(E(sigma))./ log(2))  -logm(sigma)./ log(2);
end

if strcmp(quantity,'Coherent_information')
    output=Ecadjoint(logm(Ec(sigma))./ log(2)) -Eadjoint(logm(E(sigma))./ log(2));
end


