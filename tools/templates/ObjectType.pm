subtype 'MOOSETYPE', as class_type('MOOSECLASS');
coerce 'MOOSETYPE', from 'HashRef', via { _build_type('MOOSECLASS', $_) };

