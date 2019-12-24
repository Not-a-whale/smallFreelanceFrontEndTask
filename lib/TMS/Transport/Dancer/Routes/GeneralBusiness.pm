use TMS::API::Feature::Businesses::General;

get  '/api/business/search' => sub { TMS::API::Feature::Businesses::General->new()->Search(body_parameters->mixed) };
post '/api/business/search' => sub { TMS::API::Feature::Businesses::General->new()->Search(body_parameters->mixed) };
post '/api/business/create' => sub { TMS::API::Feature::Businesses::General->new()->Create(body_parameters->mixed) };
