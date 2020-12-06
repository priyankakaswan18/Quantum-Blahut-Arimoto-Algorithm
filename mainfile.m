clear;
clc;

gamma=1; % acceleration parameter (=1 for standard algorithm)
epsilon=10^(-6); % additive error threshold
modA=2; % dimension of hilbert space A


%% Orthonormal basis states for qubit 

global A0 A1 zero one p
zero=ket([1 0]);
one=ket([0 1]);

%% Kraus operators for Amplitude Damping Channel with decay probability p

p=0.3;
A0=ketbra(zero,zero)+sqrt(1-p)*ketbra(one,one);
A1=sqrt(p)*ketbra(zero,one);


%% Default settings for plots

width = 5;     % Width in inches
height = 3;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 11;      % Fontsize
lw = 1.5;      % LineWidth
msz = 8;       % MarkerSize
label_font=12;

%% Thermodynamic_capacity


% no_of_iterations=ceil(gamma*log(modA)/epsilon); 

no_of_iterations=30; % number of iterations
quantity=zeros(1,no_of_iterations); % the quantity of interest, eg- Thermodynamic_capacity
rhot=eye(2)/modA; % intial density operator is chosen to be the maximally mixed state

for t=1:no_of_iterations % iterations of Blahut-Arimoto
    Z1=trace(expm(log(2) .* (logm(rhot)./ log(2)+(1/gamma)*F(rhot,'Thermodynamic_capacity')) ));
    rhotp1=(1/Z1)*expm(log(2) .*( logm(rhot)./ log(2)+(1/gamma)*F(rhot,'Thermodynamic_capacity')));
    quantity(t)=J(rhotp1,rhotp1,gamma,'Thermodynamic_capacity');
    rhot=rhotp1;
end

figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(quantity,'-s','LineWidth',lw,'MarkerSize',msz); %<- Specify plot properites
ylabel('Thermodynamic capacity estimate (bits), $T(t)$','Interpreter','latex','FontSize',label_font)
xlabel('Number of iterations, $t$','Interpreter','latex','FontSize',label_font)


%% Holevo_quantity


no_of_iterations=30; % number of iterations
quantity=zeros(1,no_of_iterations); % the quantity of interest, eg- Holevo_quantity
rhot=eye(2)/modA; % intial density operator is chosen to be the maximally mixed state

for t=1:no_of_iterations % iterations of Blahut-Arimoto
    Z1=trace(expm(log(2) .*( logm(rhot)./ log(2)+(1/gamma)*F(rhot,'Holevo_quantity'))));
    rhotp1=(1/Z1)*expm(log(2) .*( logm(rhot)./ log(2)+(1/gamma)*F(rhot,'Holevo_quantity')));
    quantity(t)=J(rhotp1,rhotp1,gamma,'Holevo_quantity');
    rhot=rhotp1;
end

figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(quantity,'-s','LineWidth',lw,'MarkerSize',msz); %<- Specify plot properites
ylabel('Holevo quantity estimate (bits), $\chi(t)$','Interpreter','latex','FontSize',label_font)
xlabel('Number of iterations, $t$','Interpreter','latex','FontSize',label_font)

%% Quantum_mutual_information


no_of_iterations=30; % number of iterations
quantity=zeros(1,no_of_iterations);  % the quantity of interest, eg- Quantum_mutual_information
rhot=eye(2)/modA; % intial density operator is chosen to be the maximally mixed state

for t=1:no_of_iterations % iterations of Blahut-Arimoto
    Z1=trace(expm(log(2) .*( logm(rhot)./ log(2)+(1/gamma)*F(rhot,'Quantum_mutual_information'))));
    rhotp1=(1/Z1)*expm(log(2) .*( logm(rhot)./ log(2)+(1/gamma)*F(rhot,'Quantum_mutual_information')));
    quantity(t)=J(rhotp1,rhotp1,gamma,'Quantum_mutual_information');
    rhot=rhotp1;
end

figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(quantity,'-s','LineWidth',lw,'MarkerSize',msz); %<- Specify plot properites
ylabel('Mutual information estimate (bits), $I(t)$','Interpreter','latex','FontSize',label_font)
xlabel('Number of iterations, $t$','Interpreter','latex','FontSize',label_font)

%% Coherent_information


no_of_iterations=30; % number of iterations
quantity=zeros(1,no_of_iterations);  % the quantity of interest, eg- Coherent_information
rhot=eye(2)/modA; % intial density operator is chosen to be the maximally mixed state

for t=1:no_of_iterations % iterations of Blahut-Arimoto
    Z1=trace(expm(log(2) .*( logm(rhot)./ log(2)+(1/gamma)*F(rhot,'Coherent_information'))));
    rhotp1=(1/Z1)*expm(log(2) .*( logm(rhot)./ log(2)+(1/gamma)*F(rhot,'Coherent_information')));
    quantity(t)=J(rhotp1,rhotp1,gamma,'Coherent_information');
    rhot=rhotp1;
end

figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
plot(quantity,'-s','LineWidth',lw,'MarkerSize',msz); %<- Specify plot properites
ylabel('Coherent information estimate (bits), $I_{coh}(t)$','Interpreter','latex','FontSize',label_font)
xlabel('Number of iterations, $t$','Interpreter','latex','FontSize',label_font)