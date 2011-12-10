module: coset

define function coset-arithmetic (op :: <function>, a :: <coset>, b :: <coset>)
 => (c :: <coset>)
  if(a.mod ~= b.mod)
    error("can not operate on cosets with different modulo");
  else
    make(<coset>, value: apply(op, list(a.value , b.value)), mod: a.mod);
  end if;
end function coset-arithmetic;

define inline method \+ (a :: <coset>, b :: <coset>)
 => (c :: <coset>)
  coset-arithmetic(\+, a, b);
end;

define inline method \- (a :: <coset>, b :: <coset>)
 => (c :: <coset>)
  coset-arithmetic(\-, a, b);
end;

define inline method \* (a :: <coset>, b :: <coset>)
 => (c :: <coset>)
  coset-arithmetic(\*, a, b);
end;

define inline method \* (a :: <coset>, b :: <integer>)
 => (c :: <coset>)
  a * coset(b, a.mod);
end;

define method invert (c :: <coset>)
 => (inverted-coset :: <coset>)
  let (gcd, s, t) = extended-gcd(c.value, c.mod);
  coset(s, c.mod);
end method invert;

// Now that we have inverted cosets we can define / on cosets as multiplying
// the inverted coset.

define inline method \/ (a :: <coset>, b :: <coset>)
 => (c :: <coset>)
  a * invert(b);
end;
