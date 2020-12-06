% braket  Dirac's bra-ket
%    braket(phi1,phi2) denotes the scalar(inner) product of phi1 and phi2.
function b=braket(phi1,phi2)
       b=bra(phi1)*ket(phi2);
