use TMS::API::Feature::Addresses::Interface;

post '/api/addresses'        => sub { TMS::API::Feature::Addresses::Interface::default(body_parameters->mixed) };
post '/api/addresses/create' => sub { TMS::API::Feature::Addresses::Interface::create(body_parameters->mixed) };
post '/api/addresses/meta'   => sub { TMS::API::Feature::Addresses::Interface::meta(body_parameters->mixed) };
post '/api/addresses/search' => sub { TMS::API::Feature::Addresses::Interface::search(body_parameters->mixed) };
get '/api/addresses/meta'    => sub { TMS::API::Feature::Addresses::Interface::meta(body_parameters->mixed) };
