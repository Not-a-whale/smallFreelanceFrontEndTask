
my $DBIxSingleton = undef;

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
    if (!$DBIxSingleton) {
        my $dsnx = 'DBI:mysql:database=' . $self->dbname . ';';
        my $dflt = {
            mysql_auto_reconnect => 1,
            mysql_server_prepare => 1,
            RaiseError           => 1,
            AutoCommit           => 1,
            quote_char           => "\`",
            name_sep             => '.'
        };

        $dsnx .=
            $self->dbhost eq 'localhost'
            ? 'mysql_socket=' . $self->dbsock
            : 'host=' . $self->dbhost . ';port=' . $self->dbport . ';';

        $dsnx .= 'mysql_write_timeout=' . $self->wtmout . ';';
        $dsnx .= 'mysql_read_timeout=' . $self->rtmout . ';';

        my $extras = scalar($self->extras) ? $self->extras : $dflt;
        $self->extras($extras);    # make it visible from outside.
        $ENV{DBIC_UNSAFE_AUTOCOMMIT_OK} = 1 unless $$extras{AutoCommit};
        $DBIxSingleton = $self->connect($dsnx, $self->dbuser, $self->dbpass, $extras);
    } else {
        my $st = $DBIxSingleton->storage;
        $st->ensure_connected if !$st->connected;
        $self->DBIxHandle($DBIxSingleton);
    }
}

__PACKAGE__->meta->make_immutable(inline_constructor => 1);

1;
