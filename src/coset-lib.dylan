module: dylan-user

define library coset
  use common-dylan;
  use io;
  export coset;
end library coset;

define module coset
  export
    <coset>,
    coset,
    value,
    value-setter,
    mod,
    mod-setter,
    extended-gcd,
    invert;
  use common-dylan , exclude: { format-to-string };
  use print;
  use format;
  use format-out;
end module coset;
