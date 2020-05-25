package TMS::API::Core::FinPaymentTermStrict;
use Moose::Role;

has 'Name'            => ('is' => 'rw', 'isa' => 'VarChar1024',    'coerce' => '1', 'required' => '1');
has 'Type'            => ('is' => 'rw', 'isa' => 'enum_Type',      'coerce' => '1', 'required' => '1');
has 'QuickPay'        => ('is' => 'rw', 'isa' => 'BoolInt',        'coerce' => '1', 'required' => '1', 'default' => '0');
has 'QuickPayFee'     => ('is' => 'rw', 'isa' => 'CurrencyValue',  'coerce' => '1', 'required' => '1', 'default' => '0.00');
has 'QuickPayFeeType' => ('is' => 'rw', 'isa' => 'enum_PriceType', 'coerce' => '1', 'required' => '1', 'default' => 'percentage');

1;
