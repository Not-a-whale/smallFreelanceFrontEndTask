use TMS::API::Feature::BizSimple::Interface;

post '/api/bizsimple'        => sub { TMS::API::Feature::BizSimple::Interface::default(body_parameters->mixed) };
post '/api/bizsimple/create' => sub { TMS::API::Feature::BizSimple::Interface::create(body_parameters->mixed) };
post '/api/bizsimple/meta'   => sub { TMS::API::Feature::BizSimple::Interface::meta(body_parameters->mixed) };
post '/api/bizsimple/search' => sub { TMS::API::Feature::BizBranches::Interface::search(body_parameters->mixed) };
get '/api/bizsimple/meta'    => sub { TMS::API::Feature::BizSimple::Interface::meta(body_parameters->mixed) };

