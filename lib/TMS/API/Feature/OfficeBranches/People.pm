package TMS::API::Feature::OfficeBranches::People;
use Moose;
use TMS::API::Joins::OfficeBranchPeople;
extends 'TMS::API::Feature::OfficeBranches::BizBranch';
override '_build_prefetch' => sub { shift->prefetch(TMS::API::Joins::OfficeBranchPeople->new->prefetch) };
