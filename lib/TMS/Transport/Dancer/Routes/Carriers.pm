use TMS::API::Feature::Carriers::Interface;

post '/api/carriers' => sub { TMS::API::Feature::Carriers::Interface::default(body_parameters->mixed) };
post '/api/carriers/create' => sub { TMS::API::Feature::Carriers::Interface::create(body_parameters->mixed) };
post '/api/carriers/search' => sub {TMS::API::Feature::Carriers::Interface::search(body_parameters->mixed) };

