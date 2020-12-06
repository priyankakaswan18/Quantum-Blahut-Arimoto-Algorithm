% ketbra  Dirac's bra-ket
%    ketbra(phi1,phi2) denotes the outer product of phi1 and phi2.
function k=ketbra(v1,v2)
k=ket(v1)*bra(v2);

if trace(k)~=0
   k=k/trace(k);
end 
