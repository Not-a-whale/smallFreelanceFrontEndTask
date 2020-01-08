use utf8;

package TMS::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 08:23:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4+/4mwvCej8jSY7y26e7TQ

has dbhost => (is => 'ro', isa => 'Str', required => 1, default => '192.168.11.7');
has dbport => (is => 'ro', isa => 'Int', required => 1, default => 3306);
has dbuser => (is => 'ro', isa => 'Str', required => 1, default => 'root');
has dbpass => (is => 'ro', isa => 'Str', required => 1, default => 'Nlvae4asd!');
has dbname => (is => 'ro', isa => 'Str', required => 1, default => 'tms');
has dbsock => (is => 'ro', isa => 'Str', required => 1, default => '/dbrelated/mysql.sock');
has rtmout => (is => 'ro', isa => 'Int', required => 1, default => 60);
has wtmout => (is => 'ro', isa => 'Int', required => 1, default => 60);
has extras => (is => 'rw', isa => 'HashRef', required => 0);

has DBIxHandle => (is => 'rw', lazy => 1, builder => '_connect_to_db');

sub _connect_to_db {
    my $self = shift;
    my $dsnx = 'DBI:mysql:database=' . $self->dbname . ';';

    $dsnx .=
        $self->dbhost eq 'localhost'
        ? 'mysql_socket=' . $self->dbsock
        : 'host=' . $self->dbhost . ';port=' . $self->dbport . ';';

    $dsnx .= 'mysql_write_timeout=' . $self->wtmout . ';';
    $dsnx .= 'mysql_read_timeout=' . $self->rtmout . ';';

    my $extras
        = scalar($self->extras)
        ? $self->extras
        : {mysql_auto_reconnect => 1, mysql_server_prepare => 1, RaiseError => 1, AutoCommit => 1};
    $self->extras($extras);    # make it visible from outside.
    $ENV{DBIC_UNSAFE_AUTOCOMMIT_OK} = 1 unless $$extras{AutoCommit};
    my $schema = $self->connect($dsnx, $self->dbuser, $self->dbpass, $extras);
    $self->DBIxHandle($schema);
} ## end sub _connect_to_db

__PACKAGE__->meta->make_immutable(inline_constructor => 1);

1;
