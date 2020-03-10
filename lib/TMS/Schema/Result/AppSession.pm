use utf8;

package TMS::Schema::Result::AppSession;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppSession

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_sessions>

=cut

__PACKAGE__->table("app_sessions");

=head1 ACCESSORS

=head2 session_id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 session_name

  data_type: 'char'
  is_nullable: 0
  size: 40

=head2 session_data

  data_type: 'text'
  is_nullable: 0

=head2 created_on

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 last_active

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "session_id",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "session_name",
    {data_type => "char", is_nullable => 0, size => 40},
    "session_data",
    {data_type => "text", is_nullable => 0},
    "created_on",
    {   data_type                 => "timestamp",
        datetime_undef_if_invalid => 1,
        default_value             => \"current_timestamp",
        is_nullable               => 0,
    },
    "last_active",
    {   data_type                 => "timestamp",
        datetime_undef_if_invalid => 1,
        default_value             => \"current_timestamp",
        is_nullable               => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</session_id>

=back

=cut

__PACKAGE__->set_primary_key("session_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<session_name_UNIQUE>

=over 4

=item * L</session_name>

=back

=cut

__PACKAGE__->add_unique_constraint("session_name_UNIQUE", ["session_name"]);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-10 16:28:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:N8V6frpMikOOCzSDkp5s9Q

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
