% ket  Transforms a vector into column vector.
function w=ket(v)
   [~,x]=size(v);
   if x>1
     w=v.';
   else
     w=v;
   end 