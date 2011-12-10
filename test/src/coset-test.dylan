module: coset-test

define function coset-test ()
  let a :: <coset> = coset(5,7);
  let b :: <coset> = coset(3,7);

  format-out("a: %=\n", a);
  format-out("b: %=\n", b);
  format-out("a + b = %=\n", a + b);
  format-out("a - b = %=\n", a - b);
  format-out("a * b = %=\n", a * b);
  format-out("a / b = %=\n", a / b);
end function coset-test;

coset-test();
