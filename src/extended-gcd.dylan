module: coset

define function extended-gcd (a :: <integer>, b :: <integer>)
 => (gcd :: <integer>, s :: <integer>, t :: <integer>)
  if(b = 0)
    values(a,1,0);
  else
    let (gcd, s, t) = extended-gcd(b, modulo(a,b));
    values(gcd, t, as(<integer>, s - (floor/(a, b) * t)));
  end if;
end function extended-gcd;
