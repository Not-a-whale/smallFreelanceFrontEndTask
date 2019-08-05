use utf8;
package TMS::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FLPlBTGKR+NODlQJnGdTBA
# use MooseX::Singleton;
has dbhost => (is => 'ro', isa => 'Str', required => 1, default => '192.168.11.7');
has dbport => (is => 'ro', isa => 'Int', required => 1, default => 3306);
has dbuser => (is => 'ro', isa => 'Str', required => 1, default => 'root');
has dbpass => (is => 'ro', isa => 'Str', required => 1, default => 'Nlvae4asd!');
has dbname => (is => 'ro', isa => 'Str', required => 1, default => 'tms');
has dbsock => (is => 'ro', isa => 'Str', required => 1, default => '/dbrelated/mysql.sock');

has DBIxHandle => (is => 'rw', lazy => 1, builder => 'ConnectToDB');

sub ConnectToDB {
    my $self = shift;
    my $dsnx = 'DBI:mysql:database=' . $self->dbname . ';';
    $dsnx .=
        $self->dbhost eq 'localhost'
        ? 'mysql_socket=' . $self->dbsock
        : 'host=' . $self->dbhost . ';port=' . $self->dbport;
    $dsnx .= ';';

    # my $schema = $self->connect($dsnx, $self->dbuser, $self->dbpass, {RaiseError => 1,AutoCommit=>0});
    my $schema = $self->connect($dsnx, $self->dbuser, $self->dbpass, {RaiseError => 1,AutoCommit=>1});
    $self->DBIxHandle($schema);
}

__PACKAGE__->meta->make_immutable(inline_constructor => 1);
1;