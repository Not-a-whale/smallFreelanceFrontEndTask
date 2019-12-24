subtype 'COMPLEXTYPE', as 'ArrayRef[MOOSETYPE]';
coerce 'COMPLEXTYPE', from 'ArrayRef', via { _build_types('MOOSECLASS',$_) };

