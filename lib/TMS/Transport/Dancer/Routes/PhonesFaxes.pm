use TMS::API::Feature::PhonesFaxes::Interface;

post '/api/phonesfaxes'        => sub { TMS::API::Feature::PhonesFaxes::Interface::default(body_parameters->mixed) };
post '/api/phonesfaxes/create' => sub { TMS::API::Feature::PhonesFaxes::Interface::create(body_parameters->mixed) };
post '/api/phonesfaxes/meta'   => sub { TMS::API::Feature::PhonesFaxes::Interface::meta(body_parameters->mixed) };
post '/api/phonesfaxes/search' => sub { TMS::API::Feature::PhonesFaxes::Interface::search(body_parameters->mixed) };
get '/api/phonesfaxes/meta'    => sub { TMS::API::Feature::PhonesFaxes::Interface::meta(body_parameters->mixed) };
