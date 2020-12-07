# Quantum-Blahut-Arimoto-Algorithm

This package contains matlab implementions of Blahut Arimoto Algorithms in quantum setting, presented in "N. Ramakrishnan, R. Iten, V. Scholz and M. Berta, "Quantum Blahut-Arimoto Algorithms," ISIT, 2020". 

**Four quantities of interest** 
- Holevo quantity 
- Thermodynamic capacity
- Coherent information 
- Mutual information 

The programs are run and estimates are plotted with iterations through the mainfile.m. 

The programs are run using **amplitude damping quantum channel with decay probability p=0.3** for last three quantities- thermodynamic capacity, coherent information and mutual information. For Holevo quantity, **random cq channel with input alphabet of size 2 and output dimension 2** was used. 

Further the **acceleration coefficient** gamma is chosen 1 to implement standard Blahut-arimoto algorithm, however a lower value can be chosen for accelerated Blahut-Arimoto algorithm.

## Functions

- ket.m : Transforms a vector into column vector
- bra.m : Transforms a vector into a normalized row vector
- ketbra.m : Computes outer product of two vectors and outputs a scalar
- braket.m : Computes inner product of two vectors and outputs a matrix
- E.m : creates a quantum channel
- Ec.m : creates the complementary channel (of the quantum channel)
- Eadjoint.m : creates adjoint channel (of the quantum channel)
- Ecadjoint.m : creates adjoint channel (of complementary channel of quantum channel)
- Erand.m : gives action of a random classical quantum channel.
- RandomDensityMatrix.m : Generates a random density matrix. (This function has been used form QETLAB: http://www.qetlab.com/RandomDensityMatrix)
- RandomUnitary.m : Generates a random unitary or orthogonal matrix. (This function has been used form QETLAB: http://www.qetlab.com/RandomUnitary)
- opt_args.m : Handles optional input arguments for functions. (This function has been used form QETLAB: http://www.qetlab.com/Opt_args)
- F.m : contains Hermitian matrix valued super-operator on density operators used in Blahut-Arimoto algorithm
- J.m : creates two variable extension for estimation using Blahut-Arimoto algorithm
- tensor.m : computes the tensor product. (This function is being used from Toby Cubitt's webpage: http://www.dr-qubit.org/matlab.html)
