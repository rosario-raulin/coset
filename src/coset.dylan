module: coset

define class <coset> (<object>)
  slot value :: <integer>,
    init-keyword: value:,
    init-value: 0;

  slot mod :: <integer>,
    required-init-keyword: mod:;
end class <coset>;

define method initialize (coset :: <coset>, #key)
  next-method();
  coset.value := as(<integer>, modulo(coset.value, coset.mod));
end method initialize;

define inline function coset(value :: <integer>, mod :: <integer>)
 => (c :: <coset>)
  make(<coset>, value: value, mod: mod);
end function coset;

define method print-object (object :: <coset>, stream :: <stream>)
 => ()
  format(stream, "[%d] (mod %d)", object.value, object.mod);
end method print-object;
